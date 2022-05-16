import 'package:flutter/material.dart';

class CascadeScreen extends StatefulWidget {
  const CascadeScreen({Key? key}) : super(key: key);

  @override
  State<CascadeScreen> createState() => _CascadeScreenState();
}

class _CascadeScreenState extends State<CascadeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: const Text('CasCade Operator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            color: Colors.white,
            width: 350,
            height: 350,
            child: CustomPaint(
              painter: RectanglePainter(),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            color: Colors.white,
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: TranglePainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;

    final a = Offset(size.width * 1 / 6, size.height * 1 / 4);
    final b = Offset(size.width * 5 / 6, size.height * 3 / 4);
    final rect = Rect.fromPoints(a, b);
    const radius = Radius.circular(32);
    canvas.drawRect(rect, paint);
    canvas.drawRRect(
        RRect.fromRectAndRadius(rect, radius), paint); // for rounded rectangle
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class TranglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 10
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(size.width * 1 / 2, size.height * 1 / 4)
      ..lineTo(size.width * 1 / 6, size.height * 3 / 4)
      ..lineTo(size.width * 5 / 6, size.height * 3 / 4);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
