import 'package:flutter/material.dart';
import 'package:kokok_pay/screens/base/base_view_model.dart';
import 'package:kokok_pay/screens/dashboard/home/home_screen.dart';
import 'package:kokok_pay/screens/dashboard/message/message_screen.dart';
import 'package:kokok_pay/screens/dashboard/profile/profile_screen.dart';
import 'package:kokok_pay/screens/dashboard/setting/setting_screen.dart';
import 'package:kokok_pay/screens/widgets/menu/bottom_navigation.dart';

class DashboardProvider extends BaseViewModel {
  DashboardProvider(super.context);

  int _currentIndex = 0;
  final List<ItemData> _menuItem = [];
  late Widget _screen;
  late String _title;

  void init() {
    _setMenuItem();
    _menuScreen();
    _setScreenTitle();
  }

  void navigationListener(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      _menuScreen();
      _setScreenTitle();
      notifyListeners();
    }
  }

  int get currentIndex => _currentIndex;

  void _setMenuItem() {
    _menuItem.addAll(
      const [
        ItemData(icon: Icons.home, label: 'Home', alternate: Icons.home_outlined),
        ItemData(icon: Icons.notifications, label: 'Messages', alternate: Icons.notifications_none),
        ItemData(icon: Icons.person, label: 'Profile', alternate: Icons.person_2_outlined),
        ItemData(icon: Icons.settings, label: 'Setting', alternate: Icons.settings_applications),
        ItemData(
            icon: Icons.keyboard_double_arrow_up,
            label: 'More',
            alternate: Icons.keyboard_double_arrow_up_outlined),
      ],
    );
  }

  void _setScreenTitle() {
    switch (_currentIndex) {
      case 0:
        _title = 'Home';
        break;
      case 1:
        _title = 'Messages';
        break;
      case 2:
        _title = 'My Profile';
        break;
      case 3:
        _title = 'Setting';
        break;
      case 4:
        _title = 'Home';
        break;
    }
  }

  void _menuScreen() {
    switch (_currentIndex) {
      case 0:
        _screen = const HomeScreen();
        break;
      case 1:
        _screen = const MessageScreen();
        break;
      case 2:
        _screen = const ProfileScreen();
        break;
      case 3:
        _screen = const SettingScreen();
        break;
      case 4:
        _screen = const HomeScreen();
        break;
    }
  }


  String get title => _title;

  Widget get screen => _screen;

  List<ItemData> get menuItem => _menuItem;
}
