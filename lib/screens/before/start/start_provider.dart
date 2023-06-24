import 'package:flutter/material.dart';

import '../../../resources/routes_manager.dart';
import '/application/application.dart';
import '/screens/base/base_view_model.dart';

import '../../../service/device/package_info.dart';

class StartProvider extends BaseViewModel {
  final AppPackageInfo _appPackageInfo = instance<AppPackageInfo>();

  // late final bool isAppFirstTime;

  void routeTermConditionScreen() {
    // localStorage.saveAppFirstTime();
    Navigator.of(context).pushReplacementNamed(
      Routes.policyScreen,
      arguments: true,
    );
  }

  StartProvider(super.context);

  /*{
    // isAppFirstTime = localStorage.isAppFirstTime();
  }*/

  AppPackageInfo get appPackageInfo => _appPackageInfo;
}
