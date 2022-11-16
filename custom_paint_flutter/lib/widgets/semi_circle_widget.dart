import 'package:flutter/material.dart';
import 'dart:math' as math;

class SemiCircleWidget extends StatelessWidget {
  const SemiCircleWidget({
    super.key,
    this.diameter = 200,
    required this.sweepAngle,
    required this.color,
  });
  final double diameter;
  final double sweepAngle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(diameter, diameter),
      painter: MyPainter(sweepAngle, color),
    );
  }
}

class MyPainter extends CustomPainter {
  final double sweepAngle;
  final Color color;

  MyPainter(this.sweepAngle, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 60.0
      ..style = PaintingStyle.stroke
      ..color = color;

    double degToRad(double deg) => deg * (math.pi / 180.0);

    final path = Path()
      ..arcTo(
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            width: size.width,
            height: size.height,
          ),
          degToRad(180),
          degToRad(sweepAngle),
          false);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}