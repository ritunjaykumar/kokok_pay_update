import 'package:flutter/material.dart';
import '../../widgets/bottomsheet/bottomsheet_impl.dart';
import '/application/push_notification_configuration.dart';

import '../../../models/enums/enums.dart';
import '/application/application.dart';
import '/screens/base/base_view_model.dart';
import '/service/device/device_info.dart';
import '/service/device/package_info.dart';
import '/service/toast/toast_data.dart';
import '/service/toast/toast_manager.dart';
import '../../../models/model/error_model.dart';
import '../../../models/model/model_resp.dart';
import '../../../models/request/request_dto.dart';
import '../../../resources/routes_manager.dart';
import '../../../service/provider/settings_provider.dart';
import '../../../utils/timer/timer_service.dart';
import '../../../utils/util/encryption.dart';

class DeviceRegisterProvider extends BaseViewModel {
  DeviceRegisterProvider(super.context);

  static const String mobileNumberKey = 'mobileNo';
  static const String otpRefIdKey = 'otpRef';

  late AppSettingProvider appSettingProvider;
  final FirebaseInfo _firebaseInfo = instance<FirebaseInfo>();
  final RSAEncryption _rsaEncryption = instance<RSAEncryption>();
  final AppPackageInfo _appPackageInfo = instance<AppPackageInfo>();
  final NativeToastService nativeToastService = NativeToastService();
  final DeviceInfo _deviceInfo = instance<DeviceInfo>();

  TimerManager? _timerManager;
  bool isOtpSent = false;
  int ticValue = 30;
  late MobileValidateResp mobileValidateResp;
  late MobileVerifyResp mobileVerifyResp;
  late String mobileNumber;

  void validateMobileNo(String mobileNo) async {
    //removing country code
    var trimMobile = mobileNo.substring(5, mobileNo.length);
    mobileNumber = trimMobile;

    // if (isOtpSent == false) {
    /*progressDialog.show();
    (await repository.mobileValidate(trimMobile)).fold(
      (Failure failure) {
        progressDialog.dismiss();
        dialogUtil.showFailureDialog(context, failure);
      },
      (MobileValidateResp mobileValidateResp) {
        progressDialog.dismiss();
        this.mobileValidateResp = mobileValidateResp;
        isOtpSent = true;
        _startTimer();
        notifyListeners();
      },
    );*/


    //default
    isOtpSent = true;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    if (_timerManager != null) {
      _timerManager!.cancel();
    }
  }

  void validateOtp(String otp) async {
   /* MobileVerifyReqDto mobileVerifyReqDto = MobileVerifyReqDto(
      mobileValidateResp.otpRefId,
      _rsaEncryption.encryptData(otp),
      appSettingProvider.appLanguage.formatLanguage,
      _firebaseInfo.fcmToken,
      _deviceInfo.modelNo,
      _appPackageInfo.version,
      _deviceInfo.osVersion,
      _deviceInfo.platformType.type,
    );*/

    /*progressDialog.show();
    (await repository.verifyMobile(mobileVerifyReqDto)).fold(
      (Failure failure) {
        progressDialog.dismiss();
        dialogUtil.showFailureDialog(context, failure);
      },
      (MobileVerifyResp resp) {
        mobileVerifyResp = resp;
        localStorage.setIsDeviceRegistered();
        nativeToastService.showToast(ToastData('Device has registered successfully'));
        localStorage.saveMobileNumber(mobileNumber);
        localStorage.saveOtpRefId(resp.otpRefId);
        _appStatus();
      },
    );*/

    _routeScreen(AppStatus.registration);
  }

  Future<void> _appStatus() async {
    try {
      (await repository.appStatus(_appPackageInfo.version)).fold(
        (Failure failure) {
          progressDialog.dismiss();
          dialogUtil.showFailureDialog(context, failure);
        },
        (AppStatusResp appStatusResp) {
          progressDialog.dismiss();
          _routeScreen(AppStatus.getAppStatus(appStatusResp.status));
          if (appStatusResp.alert.isNotEmpty) {
            AlertBottomSheet alertBottomSheet = AlertBottomSheet(
              context,
              appStatusResp.alert,
              'Messages',
            );
            alertBottomSheet.show();
          }
        },
      );
    } catch (error) {
      dialogUtil.showErrorDialog(context, error.toString());
    }
  }

  void _routeScreen(AppStatus appStatus) {
    switch (appStatus) {
      case AppStatus.mpin:
        _routeScreenImpl(Routes.pinRegisterScreen);
        break;
      case AppStatus.registration:
        Navigator.of(context).pushReplacementNamed(
          Routes.userRegisterScreen,
          arguments: {
            mobileNumberKey: mobileNumber,
            // otpRefIdKey: mobileVerifyResp.otpRefId,
            otpRefIdKey: 'mobileVerifyResp.otpRefId', //debug
          },
        );
        break;
      case AppStatus.login:
        _routeScreenImpl(Routes.loginScreen);
        break;
      case AppStatus.otpVerification:
        _routeScreenImpl(Routes.startScreen);
        break;
      case AppStatus.blocked:
        // todo need to call blocked page
        break;
      case AppStatus.kyc:
        // todo show here kyc screen .
        break;
      case AppStatus.changePin:
        // show change pin screen.
        break;
      case AppStatus.error:
        // todo error, it is created manually. but any way you have to show dialog
        break;
    }
  }

  void _routeScreenImpl(String routeName) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  void resendOtp() async {
    ///
    _startTimer();
    notifyListeners();
    progressDialog.show();
    (await repository.resendOtp(mobileValidateResp.otpRefId)).fold(
      (Failure failure) {
        progressDialog.dismiss();
        dialogUtil.showFailureDialog(context, failure);
      },
      (MobileValidateResp mobileValidateResp) {
        progressDialog.dismiss();
        nativeToastService.showToast(ToastData.success(message: 'otp has sent again successfully'));
      },
    );
  }

  void openPrivacyPolicy() {}

  void openTermCondition() {
    Navigator.of(context).pushNamed(Routes.policyScreen, arguments: false);
  }

  void _startTimer() {
    _timerManager = TimerManager.periodic(
      30,
      _onTimerFinished,
      onTick: _onTick,
      revers: true,
    );
  }

  void _onTimerFinished() {
    ticValue = 30;
  }

  void _onTick(int tic) {
    ticValue = tic;
    notifyListeners();
  }
}
