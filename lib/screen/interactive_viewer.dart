import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InteractiveImageScreen extends StatefulWidget {
  const InteractiveImageScreen({Key? key}) : super(key: key);

  @override
  State<InteractiveImageScreen> createState() => _InteractiveImageScreenState();
}

class _InteractiveImageScreenState extends State<InteractiveImageScreen> {
  TransformationController controller = TransformationController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Viewer'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: InteractiveViewer(
            constrained: false,
            maxScale: 2,
            minScale: 0.5,
            boundaryMargin: const EdgeInsets.all(double.infinity),
            transformationController: controller,
            onInteractionEnd: (details) {
              setState(() {
                controller.toScene(Offset.zero);
              });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/sagar.jpg',
                height: 400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
