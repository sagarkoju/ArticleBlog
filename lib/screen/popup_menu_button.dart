import 'package:flutter/material.dart';
import 'package:vlogpost/data/menu_item_data.dart';
import 'package:vlogpost/model/menu_item.dart';
import 'package:vlogpost/screen/popupmenu/settings.dart';
import 'package:vlogpost/screen/popupmenu/share.dart';
import 'package:vlogpost/screen/popupmenu/shopping.dart';

class PopMenuButtonScreen extends StatefulWidget {
  const PopMenuButtonScreen({Key? key}) : super(key: key);

  @override
  State<PopMenuButtonScreen> createState() => _PopMenuButtonScreenState();
}

class _PopMenuButtonScreenState extends State<PopMenuButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PopupMenuButton in flutter'),
        centerTitle: true,
        actions: [
          PopupMenuButton<MenuItem>(
              onSelected: ((item) => onSelected(context, item)),
              itemBuilder: ((context) {
                return MenuItems.itemMenu.map((e) {
                  return PopupMenuItem<MenuItem>(
                    value: e,
                    child: Row(
                      children: [
                        Icon(
                          e.icon,
                          color: Colors.black,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(e.text),
                      ],
                    ),
                  );
                }).toList();
              }))
        ],
      ),
    );
  }

  void onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.menuSettings:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SettingScreen(
                      menuItem: item,
                    )));
        break;
      case MenuItems.menuCheck:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShoppingScreen(
                      menuItem: item,
                    )));
        break;
      case MenuItems.menuRate:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShareScreen(
                      menuItem: item,
                    )));
        break;
    }
  }
}
