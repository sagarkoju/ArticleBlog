import 'dart:math';

import 'package:flutter/material.dart';

class CustomePainterScreen extends StatefulWidget {
  const CustomePainterScreen({Key? key, required this.progress})
      : super(key: key);

  final double progress;
  @override
  State<CustomePainterScreen> createState() => _CustomePainterScreenState();
}

class _CustomePainterScreenState extends State<CustomePainterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Custom Painter'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: CustomPaint(
              painter: RingPainter(
                progress: widget.progress,
                taskNotCompletedColor: Colors.black,
                taskCompletedColor: Colors.green,
              ),
            ),
          ),
          const Text(
            'Custom Painter in Flutter',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          )
        ],
      ),
    );
  }
}

class RingPainter extends CustomPainter {
  RingPainter({
    required this.progress,
    required this.taskNotCompletedColor,
    required this.taskCompletedColor,
  });
  // a value between 0 and 1
  final double progress;
  // background color to use when the task is not completed
  final Color taskNotCompletedColor;
  // foreground color to use when the task is completed
  final Color taskCompletedColor;
  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width / 15.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 3;
    final backgroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = taskNotCompletedColor
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, backgroundPaint);
    final foregroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = taskCompletedColor
      ..style = PaintingStyle.stroke;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(RingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
