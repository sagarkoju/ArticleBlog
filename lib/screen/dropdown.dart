import 'package:flutter/material.dart';
import 'package:vlogpost/data/menu_item_data.dart';

import 'package:vlogpost/model/menu_item.dart';

class DropDownScreen extends StatefulWidget {
  const DropDownScreen({Key? key}) : super(key: key);

  @override
  State<DropDownScreen> createState() => _DropDownScreenState();
}

class _DropDownScreenState extends State<DropDownScreen> {
  List<String> item = [
    'Apple',
    'Banana',
    'Mango',
    'Orange',
    'Grape',
  ];

  List<MenuItemData> menuItems = [];
  @override
  void initState() {
    menuItems = List.of(MenuData.itemMenu);
    super.initState();
  }

  String dropdown = 'Apple';
  MenuItemData dropdownValue = MenuData.itemMenu.first;
  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropDown Button in Flutter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _dropdownFormKey,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity / 2,
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: Colors.black38,
                  ),
                  borderRadius: BorderRadius.circular(06),
                ),
                child: StatefulBuilder(builder: ((context, setState) {
                  return DropdownButtonFormField<String>(
                    decoration: const InputDecoration(border: InputBorder.none),
                    validator: (value) =>
                        value == null ? "Select a Fruit" : null,
                    // value: dropdown,
                    icon: const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.keyboard_arrow_down)),
                    items: item.map((e) {
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        dropdown = value!;
                      });
                    },
                  );
                })),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_dropdownFormKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$dropdown successfully added'),
                    ),
                  );
                }
              },
              child: const Text("Submit"),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity / 2,
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                width: 1,
                color: Colors.black26,
              )),
              child: StatefulBuilder(builder: ((context, setState) {
                return DropdownButton<MenuItemData>(
                  isExpanded: true,
                  underline: const SizedBox(),
                  value: dropdownValue,
                  icon: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.keyboard_arrow_down)),
                  items: menuItems.map((e) {
                    return DropdownMenuItem<MenuItemData>(
                      value: e,
                      child: Row(
                        children: [
                          Icon(
                            e.icon,
                            size: 20,
                            color: Colors.black12,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(e.text),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (MenuItemData? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                );
              })),
            ),
          ],
        ),
      ),
    );
  }
}
