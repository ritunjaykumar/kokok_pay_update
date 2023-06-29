import 'package:flutter/material.dart';

class SettingPainter extends CustomPainter {
  SettingPainter({this.color});

  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color ?? Colors.red;
    Path path = Path();
    double x = size.width;
    double y = size.height;

    path.

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
