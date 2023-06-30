import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kokok_pay/screens/base/base_view_model.dart';

class SettingProvider extends BaseViewModel {
  SettingProvider(super.context);

  late List<SettingData> settingDataList;

  @override
  void init() {
    _initSettingData();
  }

  void _initSettingData() {
    settingDataList = [
      SettingData(
        title: 'Profile',
        subTitle: 'see and update your profile details',
        icon: Icons.person,
        route: 'route',
      ),
      SettingData(
        title: 'Security Pin',
        subTitle: 'change your login pin',
        icon: Icons.security,
        route: 'route',
      ),
      SettingData(
        title: 'Biometry Login',
        subTitle: 'Change your biometric preferences',
        icon: Icons.fingerprint,
        route: 'route',
      ),
      SettingData(
        title: 'E-KYC',
        subTitle: 'update your E-kyc',
        icon: Icons.verified_user_outlined,
        route: 'route',
        verify: true,
      ),
      SettingData(
        title: 'Logout',
        subTitle: 'logout your KokKok pay',
        icon: Icons.logout,
        route: 'route',
      ),
      SettingData(
        title: 'Share App',
        subTitle: 'share with your friends',
        icon: Icons.share,
        route: 'route',
      ),
      SettingData(
        title: 'Clear Data',
        subTitle: 'clear all cached data',
        icon: Icons.cleaning_services_rounded,
        route: 'route',
      ),
      SettingData(
        title: '1.1.0',
        subTitle: 'app version',
        icon: Icons.info_outline,
        route: 'route',
      ),
      SettingData(
        title: 'Delete Account',
        subTitle: 'suspended your account',
        icon: Icons.delete_forever,
        route: 'route',
        color: Colors.red,
      ),
    ];
  }
}

class SettingData {
  String title;
  String subTitle;
  IconData icon;
  bool verify;
  Color? color;
  String route;

  SettingData({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.route,
    this.verify = false,
    this.color,
  });
}
