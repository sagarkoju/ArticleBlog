import 'package:flutter/material.dart';
import 'package:vlogpost/model/menu_item.dart';

class MenuItems {
  static const List<MenuItem> itemMenu = [
    menuSettings,
    menuCheck,
    menuRate,
  ];
  static const menuSettings = MenuItem(
    text: 'Settings',
    icon: Icons.settings,
  );
  static const menuRate = MenuItem(
    text: 'Rate',
    icon: Icons.star,
  );
  static const menuCheck = MenuItem(
    text: 'Check Out',
    icon: Icons.shopping_basket,
  );
}
