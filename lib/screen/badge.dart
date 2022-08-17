import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BadgeScreen extends StatefulWidget {
  const BadgeScreen({Key? key}) : super(key: key);

  @override
  State<BadgeScreen> createState() => _BadgeScreenState();
}

class _BadgeScreenState extends State<BadgeScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badge in Flutter'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Badge(
                badgeColor: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20),
                padding: const EdgeInsets.all(4),
                shape: BadgeShape.square,
                badgeContent: Text(counter.toString()),
                animationType: BadgeAnimationType.slide,
                toAnimate: true,
                child: const Icon(
                  Icons.shopping_cart,
                  size: 50,
                )),
          ),
        ],
      ),
    );
  }
}
