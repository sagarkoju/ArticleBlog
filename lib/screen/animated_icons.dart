import 'package:flutter/material.dart';

class AnimatedIconScreen extends StatefulWidget {
  const AnimatedIconScreen({Key? key}) : super(key: key);

  @override
  _AnimatedIconScreenState createState() => _AnimatedIconScreenState();
}

class _AnimatedIconScreenState extends State<AnimatedIconScreen>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;

  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animated Icon in Flutter'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 250,
                splashColor: Colors.amber,
                onPressed: toggleIcon,
                icon: AnimatedIcon(
                  icon: AnimatedIcons.add_event,
                  progress: controller,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ));
  }

  void toggleIcon() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying ? controller.forward() : controller.reverse();
    });
  }
}
