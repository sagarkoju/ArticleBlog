// ignore: file_names
import 'package:flutter/material.dart';

enum ButtonState { init, submitting, completed }

class AnimatedProgressScreen extends StatefulWidget {
  const AnimatedProgressScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedProgressScreen> createState() => _AnimatedProgressScreenState();
}

class _AnimatedProgressScreenState extends State<AnimatedProgressScreen> {
  bool isAnimating = true;
  ButtonState state = ButtonState.init;
  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width;
    // update the UI depending on below variable values
    final isStretched = isAnimating || state == ButtonState.init;
    final isDone = state == ButtonState.completed;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Progress Button'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(40),
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            onEnd: () => setState(() {
                  isAnimating = !isAnimating;
                }),
            width: state == ButtonState.init ? buttonWidth : 70,
            height: 60,
            // If Button State is Submiting or Completed  show 'buttonCircular' widget as below
            child: isStretched ? buildButton() : circularContainer(isDone)),
      ),
    );
  }

  // If Button State is init : show Normal submit button
  Widget buildButton() => OutlinedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          side: const BorderSide(color: Colors.indigo, width: 2),
        ),
        onPressed: () async {
          // here when button is pressed
          // we are changing the state
          // therefore depending on state our button UI changed.
          setState(() {
            state = ButtonState.submitting;
          });
          //await 2 sec // you need to implement your server response here.
          await Future.delayed(const Duration(seconds: 2));
          setState(() {
            state = ButtonState.completed;
          });
          await Future.delayed(const Duration(seconds: 2));
          setState(() {
            state = ButtonState.init;
          });
        },
        child: const FittedBox(
          child: Text('SUBMIT'),
        ),
      );
  // this is custom Widget to show rounded container
  // here is state is submitting, we are showing loading indicator on container then.
  // if it completed then showing a Icon.
  Widget circularContainer(bool done) {
    final color = done ? Colors.green : Colors.blueAccent;
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: done
            ? const Icon(Icons.done, size: 50, color: Colors.white)
            : const CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }
}
