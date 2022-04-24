import 'package:flutter/material.dart';
import 'package:vlogpost/model/fruit.dart';

class CheckBoxScreen extends StatefulWidget {
  const CheckBoxScreen({Key? key}) : super(key: key);

  @override
  State<CheckBoxScreen> createState() => _CheckBoxScreenState();
}

class _CheckBoxScreenState extends State<CheckBoxScreen> {
  final selectAllFruits = Fruit(text: 'Select All Fruits');
  final fruits = [
    Fruit(text: 'Apple'),
    Fruit(text: 'Grape'),
    Fruit(text: 'Orange'),
    Fruit(text: 'Mango'),
    Fruit(text: 'Banana'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CheckBox in Flutter'),
          centerTitle: true,
        ),
        body: ListView(children: [
          CheckboxListTile(
              activeColor: Colors.green,
              title: Text(
                selectAllFruits.text,
                style: const TextStyle(fontSize: 16),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: selectAllFruits.value,
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  selectAllFruits.value = value;
                  fruits.forEach((element) => element.value = value);
                });
              }),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              height: 1,
              thickness: 2,
            ),
          ),
          ...fruits.map((customCheckListTile)).toList()
        ]));
  }

  Widget customCheckListTile(Fruit fruit) {
    return CheckboxListTile(
        activeColor: Colors.green,
        title: Text(
          fruit.text,
          style: const TextStyle(fontSize: 16),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        value: fruit.value,
        onChanged: (value) {
          setState(() {
            fruit.value = value!;
            selectAllFruits.value = fruits.every((element) => element.value);
          });
        });
  }
}
