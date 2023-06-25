import 'package:flutter/material.dart';
import 'package:kokok_pay/screens/base/base_view_model.dart';
import 'package:kokok_pay/screens/dashboard/home/home_screen.dart';
import 'package:kokok_pay/screens/dashboard/qr/my_qr_screen.dart';
import 'package:kokok_pay/screens/dashboard/more/more_screen.dart';
import 'package:kokok_pay/screens/dashboard/profile/profile_screen.dart';
import 'package:kokok_pay/screens/dashboard/setting/setting_screen.dart';
import 'package:kokok_pay/screens/widgets/menu/bottom_navigation.dart';

class DashboardProvider extends BaseViewModel {
  DashboardProvider(super.context);
  final List<String> titles = ['Home', 'My QR','My Profile','Setting'];
  int _currentIndex = 0;
  int _previousSelectedIndex = 0;
  final List<ItemData> _menuItem = [];
  late Widget _screen;
  late String _title;

  void init() {
    _setMenuItem();
    _menuScreen();
  }

  void navigationListener(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      _menuScreen();
      notifyListeners();
    }
  }

  int get currentIndex => _currentIndex;

  void _setMenuItem() {
    _menuItem.addAll(
      const [
        ItemData(icon: Icons.home, label: 'Home', alternate: Icons.home_outlined),
        ItemData(icon: Icons.qr_code_2_outlined, label: 'My QR', alternate: Icons.qr_code_2),
        ItemData(icon: Icons.person, label: 'Profile', alternate: Icons.person_2_outlined),
        ItemData(icon: Icons.settings, label: 'Setting', alternate: Icons.settings_applications),
        ItemData(
            icon: Icons.keyboard_double_arrow_down,
            label: 'More',
            alternate: Icons.keyboard_double_arrow_up),
      ],
    );
  }

  void _menuScreen() {
    if (_currentIndex != 4) {
      _previousSelectedIndex = _currentIndex;
      _title = titles[_currentIndex];
    }

    switch (_currentIndex) {
      case 0:
        _screen = const HomeScreen();
        break;
      case 1:
        _screen = const MyQrScreen();
        break;
      case 2:
        _screen = const ProfileScreen();
        break;
      case 3:
        _screen = const SettingScreen();
        break;
      case 4:
        _showMoreDialog();
        break;
    }
  }

  void _showMoreDialog() async {
    await showGeneralDialog(
      context: context,
      barrierLabel: 'more label',
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (ctx, anim1, anim2) {
        return const Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          insetPadding: EdgeInsets.zero,
          alignment: Alignment.bottomCenter,
          child: MoreScreen(),
        );
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(anim1),
          child: child,
        );
      },
    );
    _currentIndex = _previousSelectedIndex;
    notifyListeners();
  }

  String get title => _title;

  Widget get screen => _screen;

  List<ItemData> get menuItem => _menuItem;
}
