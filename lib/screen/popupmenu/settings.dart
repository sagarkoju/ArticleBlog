import 'package:flutter/material.dart';
import 'package:vlogpost/model/menu_item.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key, required this.menuItem}) : super(key: key);
  final MenuItemData menuItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${menuItem.text} Screen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: menuItem.menuColors,
            ),
          )
        ],
      ),
    );
  }
}
