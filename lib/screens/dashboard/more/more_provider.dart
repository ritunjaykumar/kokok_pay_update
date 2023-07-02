import 'package:flutter/material.dart';
import 'package:kokok_pay/resources/routes_manager.dart';
import 'package:kokok_pay/screens/base/base_view_model.dart';

class MoreProvider extends BaseViewModel {
  MoreProvider(super.context);

  late final List<MenuItemData> _menuItems;

  @override
  void init() {
    _menuItems = _initMenuItems();
  }

  List<MenuItemData> _initMenuItems() {
    return <MenuItemData>[
      MenuItemData(title: 'Transfer', icon: Icons.send, path: Routes.transferScreen),
      MenuItemData(title: 'Wallet', icon: Icons.wallet, path: Routes.walletScreen),
      MenuItemData(title: 'My Cards', icon: Icons.credit_card, path: Routes.cardScreen),
      MenuItemData(title: 'Favorite', icon: Icons.favorite_border, path: 'Routes.calenderScreen'),
      MenuItemData(title: 'EDL', icon: Icons.electric_bolt, path: Routes.edlScreen),
      MenuItemData(title: 'Support', icon: Icons.support_agent, path: Routes.supportScreen),
    ];
  }

  List<MenuItemData> get menuItems => _menuItems;
}

class MenuItemData {
  String title;
  IconData icon;
  String? path;

  MenuItemData({required this.title, required this.icon, this.path});
}
