import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityScreen extends StatefulWidget {
  const ConnectivityScreen({Key? key}) : super(key: key);

  @override
  State<ConnectivityScreen> createState() => _ConnectivityScreenState();
}

class _ConnectivityScreenState extends State<ConnectivityScreen> {
  String status = '';
  late StreamSubscription streamSubscription;
  Future<void> checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.mobile) {
      setState(() {
        status = 'Mobile Network Connected';
      });
    } else if (result == ConnectivityResult.wifi) {
      setState(() {
        status = 'Wifi NetWork Connected';
      });
    } else {
      setState(() {
        status = 'No Device Connected';
      });
    }
  }

  @override
  void initState() {
    checkConnectivity();
    streamSubscription = Connectivity().onConnectivityChanged.listen((event) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.teal,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                'Connectivity Changed to ' + event.name,
                textAlign: TextAlign.center,
              )),
        ),
      );
      setState(() {
        status = event.name;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectivity in Flutter'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Status " + status,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
