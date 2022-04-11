

import 'package:flutter/material.dart';

class SelectableTextScreen extends StatefulWidget {
  const SelectableTextScreen({Key? key}) : super(key: key);

  @override
  State<SelectableTextScreen> createState() => _SelectableTextScreenState();
}

class _SelectableTextScreenState extends State<SelectableTextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selectable Text in Flutter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(
              "Flutter Tutorial By Sagar Koju",
              style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 45),
              textAlign: TextAlign.center,
              onTap: () => debugPrint('Tapped'),
              toolbarOptions: const ToolbarOptions(
                copy: true,
                selectAll: true,
              ),
              showCursor: true,
              cursorWidth: 2,
              cursorColor: Colors.red,
              cursorRadius: const Radius.circular(5),
            ),
            SelectableText.rich(
              const TextSpan(
                children: [
                  TextSpan(
                      text: 'Flutter Tutorial',
                      style: TextStyle(color: Colors.red, fontSize: 40)),
                  TextSpan(
                      text: ' by',
                      style: TextStyle(color: Colors.amber, fontSize: 40)),
                  TextSpan(
                      text: ' Sagar Koju',
                      style: TextStyle(color: Colors.green, fontSize: 40)),
                ],
              ),
              textAlign: TextAlign.center,
              onTap: () => debugPrint('Tapped'),
              toolbarOptions: const ToolbarOptions(
                copy: true,
                selectAll: true,
              ),
              showCursor: true,
              cursorWidth: 2,
              cursorColor: Colors.red,
              cursorRadius: const Radius.circular(5),
            ),
          ],
        ),
      ),
    );
  }
}
