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
    path.lineTo(0, y * .7 );
    path.quadraticBezierTo(x * 0.4, y * 1.5, x * 1 , y * 0.05);
    path.lineTo(x, 0);
    path.lineTo(0, 0);
    // path.

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
