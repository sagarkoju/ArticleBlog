import 'package:flutter/material.dart';

class SpreadOperatorScreen extends StatelessWidget {
  SpreadOperatorScreen({Key? key}) : super(key: key);
  List<String> data = [
    'Apple',
    'Banana',
    'Mango',
    'Grape',
    'WaterMelon',
    'Orange',
    'Papaya',
    'Coconut',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spread Operator in Flutter'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ...data
              .map((e) => ListTile(
                    title: Text(e),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
