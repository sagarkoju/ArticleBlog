import 'package:flutter/material.dart';

class SuccessfulPageScreen extends StatelessWidget {
  const SuccessfulPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Successfully Added',
          textScaleFactor: 1.5,
        ),
      ),
    );
  }
}
