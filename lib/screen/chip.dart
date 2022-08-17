import 'package:flutter/material.dart';
import 'package:vlogpost/data/food_data.dart';
import 'package:vlogpost/model/student.dart';

class ChipScreen extends StatefulWidget {
  const ChipScreen({Key? key}) : super(key: key);

  @override
  State<ChipScreen> createState() => _ChipScreenState();
}

class _ChipScreenState extends State<ChipScreen> {
  List<Fruit> fruit = [];

  @override
  void initState() {
    fruit = List.of(fruits);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chip in Flutter'),
        centerTitle: true,
      ),
      body: Wrap(
        children: fruit
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Chip(
                    label: Text(
                      e.name,
                    ),
                    avatar: CircleAvatar(
                      backgroundImage: AssetImage(e.url),
                    ),
                    onDeleted: () {
                      setState(() {
                        fruit.removeWhere((element) => element.id == e.id);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.teal,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          duration: const Duration(milliseconds: 1000),
                          content: Text(
                              'Item ${e.name} has been removed from the list')));
                    },
                    deleteIcon: const Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
