import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vlogpost/screen/succssfulpage.dart';

class BackDropScreen extends StatefulWidget {
  const BackDropScreen({Key? key}) : super(key: key);

  @override
  State<BackDropScreen> createState() => _BackDropScreenState();
}

class _BackDropScreenState extends State<BackDropScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BackDrop Filter'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => showAlert(context),
              child: const Text('Show BackDrop Filter'),
            ),
          )
        ],
      ),
    );
  }

  Future<void> showAlert(BuildContext context) {
    return showDialog(
        context: context,
        barrierColor: Colors.grey.shade400.withOpacity(0.8),
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: const Center(
                  child: Text(
                'Do you want to add more item ?',
                textAlign: TextAlign.center,
              )),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SuccessfulPageScreen()));
                    },
                    child: const Text('OK'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
