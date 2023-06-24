import 'package:flutter/material.dart';
import 'package:kokok_pay/exceptions/exceptions.dart';
import 'package:kokok_pay/models/enums/enums.dart';
import 'package:kokok_pay/models/model/error_model.dart';
import 'package:kokok_pay/models/model/models.dart';
import 'package:kokok_pay/screens/widgets/dialog/dialog_impl.dart';
import 'package:kokok_pay/service/toast/toast_data.dart';

import '../../../application/application.dart';
import '../../../models/model/model_resp.dart';
import '../../../resources/routes_manager.dart';
import '../../../service/biometric/biometric.dart';
import '../../../service/device/package_info.dart';
import '../../../service/network/dio_config/dio_config.dart';
import '../../../utils/util/date_time_formatter.dart';
import '../../../utils/util/encryption.dart';
import '/screens/base/base_view_model.dart';

class LoginProvider extends BaseViewModel {
  final AppPackageInfo appPackageInfo = instance<AppPackageInfo>();
  bool _isObscure = true;
  final LoginData loginData = LoginData();
  final CurrentUserDetails currentUserDetails = instance<CurrentUserDetails>();
  final DioImpl dioImpl = instance<DioImpl>();
  final RSAEncryption rsaEncryption = instance<RSAEncryption>();
  final AppBiometric appBiometric = instance<AppBiometric>();

  LoginProvider(super.context);

  bool get isObscure => _isObscure;

  void setObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  void mpinLogin(String mpin) {
    final String salt = rsaEncryption.getSalt();
    String hashed1 = rsaEncryption.getHashedData(mpin);
    String mpin1 = hashed1 + salt;
    String hashed2 = rsaEncryption.getHashedData(mpin1);

    loginData.mpin = hashed2;
    loginData.loginSalt = salt;
    loginData.loginType = LoginType.mpin;

    _userLogin();
  }

  void biometricLogin() async {
    var biometricEnable = localStorage.getBiometricEnable();
    if (biometricEnable == false) {
      nativeToast.showToast(ToastData.warning(message: 'Biometric is not enabled'));
      return;
    }
    try {
      var status = await appBiometric.authenticateBiometric(
        title: 'Please authenticate to login',
      );
      if (status) {
        loginData.loginType = LoginType.biometric;
        _userLogin();
      }
    } on BiometricException catch (ex) {
      ErrorDialog errorDialog = ErrorDialog(context, ex.msg);
      errorDialog.show();
    }

    loginData.loginType = LoginType.biometric;
  }

  void _userLogin() async {
    progressDialog.show();
    /*(await repository.userLogin(loginData)).fold(
      (Failure failure) {
        progressDialog.dismiss();
        dialogUtil.showFailureDialog(context, failure);
      },
      (LoginRes loginRes) {
        progressDialog.dismiss();
        nativeToast.showToast(ToastData.success(message: 'Login success'));
        dioImpl.sessionId = loginRes.loginToken;
        currentUserDetails.userType = loginRes.userType;
        currentUserDetails.profileId = loginRes.profileId;
        currentUserDetails.kycStatus = loginRes.kycStatus;
        currentUserDetails.fullName = loginRes.name;
        currentUserDetails.mobileNo = loginRes.mobile;
        currentUserDetails.loginTime = DateTimeFormatter().respFormat(loginRes.loginTime);
        currentUserDetails.userId = loginRes.userId;
        _registerBiometric();
      },
    );*/
    //delete it
    _registerBiometric();
  }

  void _registerBiometric() {
    bool biometricEnable = localStorage.getBiometricEnable();
    print('biometricEnable: $biometricEnable');
    if (biometricEnable == false && appBiometric.canUserEnableBiometric()) {
      YesNoDialogData yesNoDialogData = YesNoDialogData(
        title: 'Information',
        subTitle: 'Do You want to enable Biometric?',
        iconData: Icons.info_outline,
        iconColor: Theme.of(context).colorScheme.primary,
        titleColor: Theme.of(context).colorScheme.primary,
      );

      YesNoDialog yesNoDialog = YesNoDialog(
        context,
        yesNoDialogData,
        () {
          localStorage.saveBiometricEnable();
          _navigateToHomeScreen();
          nativeToast.showToast(ToastData.success(message: 'Biometric has enabled'));
        },
        _navigateToHomeScreen,
      );
      yesNoDialog.show();
    } else {
      _navigateToHomeScreen();
    }
  }

  void _navigateToHomeScreen() {
    Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
  }

  void forgotPassword() {
    YesNoDialogData yesNoDialogData = YesNoDialogData(
      title: 'Alert',
      subTitle: 'Do you want to reset your PIN?',
      iconData: Icons.help_outline,
      iconColor: Theme.of(context).colorScheme.primary,
      titleColor: Theme.of(context).colorScheme.primary,
    );

    YesNoDialog yesNoDialog = YesNoDialog(context, yesNoDialogData, () {
      Navigator.of(context).pushNamed(Routes.forgotPin);
    });
    yesNoDialog.show();
  }
}
