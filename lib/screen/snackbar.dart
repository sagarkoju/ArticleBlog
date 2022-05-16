import 'package:flutter/material.dart';

class SnackBarScreen extends StatefulWidget {
  const SnackBarScreen({Key? key}) : super(key: key);

  @override
  State<SnackBarScreen> createState() => _SnackBarScreenState();
}

class _SnackBarScreenState extends State<SnackBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar in Flutter'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => showSnackBar(context),
              child: const Text('Show SnackBar'),
            ),
          )
        ],
      ),
    );
  }

  Future<void> showSnackBar(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.teal,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        duration: const Duration(milliseconds: 1000),
        content: Container(
            margin: const EdgeInsets.all(10),
            child: const Text(
              'Login SuccessFully',
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}
