import 'package:flutter/material.dart';
import 'package:vlogpost/model/menu_item.dart';

class MenuData {
  static const List<MenuItemData> itemMenu = [
    menuSettings,
    menuCheck,
    menuRate,
  ];
  static const menuSettings = MenuItemData(
    text: 'Settings',
    icon: Icons.settings,
    menuColors: Colors.amber,
  );
  static const menuRate = MenuItemData(
    text: 'Rate',
    icon: Icons.star,
    menuColors: Colors.blueAccent,
  );
  static const menuCheck = MenuItemData(
    text: 'Check Out',
    icon: Icons.shopping_basket,
    menuColors: Colors.green,
  );
}
