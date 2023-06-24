import 'package:flutter/material.dart';

import '/application/application.dart';
import '/models/enums/enums.dart';
import '/models/model/error_model.dart';
import '/resources/routes_manager.dart';
import '/screens/base/base_view_model.dart';
import '/screens/widgets/bottomsheet/bottomsheet_impl.dart';
import '/service/device/package_info.dart';
import '../../../models/model/model_resp.dart';

class SplashProvider extends BaseViewModel {
  SplashProvider(super.context);

  final AppPackageInfo _appPackageInfo = instance<AppPackageInfo>();

  // void startTimer() {
  //   TimerManager(5, _checkScreenStatus);
  // }

  void checkScreenStatus() {
    /*if (localStorage.isAppFirstTime()) {
      Navigator.of(context).pushReplacementNamed(
        Routes.startScreen,
      );
      */ /*Navigator.of(context).pushReplacementNamed(
        Routes.policyScreen,
        arguments: true,
      );*/ /*
    } else {
     checkAppStatus();
    }*/

    // checkAppStatus();
    _routeScreenImpl(Routes.startScreen);
  }

  void checkAppStatus() async {
    try {
      // progressDialog.show();
      (await repository.appStatus(_appPackageInfo.version)).fold(
        (Failure failure) {
          dialogUtil.showFailureDialog(context, failure);
        },
        (AppStatusResp appStatusResp) {
          if (localStorage.isDeviceRegistered() == false) {
            _routeScreen(AppStatus.otpVerification);
          } else {
            _routeScreen(AppStatus.getAppStatus(appStatusResp.status));
            if (appStatusResp.alert.isNotEmpty) {
              AlertBottomSheet alertBottomSheet = AlertBottomSheet(
                context,
                appStatusResp.alert,
                'Messages',
              );
              alertBottomSheet.show();
            }
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
        _routeScreenImpl(Routes.userRegisterScreen);
        break;
      case AppStatus.login:
        _routeScreenImpl(Routes.loginScreen);
        break;
      case AppStatus.otpVerification:
        // _routeScreenImpl(Routes.deviceRegistrationScreen);
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
}
