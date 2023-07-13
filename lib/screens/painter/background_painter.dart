import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  final Color color;

  BackgroundPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final y = size.height;
    final x = size.width;
    Paint paint = Paint()..color = color;

    Path path = Path();

    const lineFirstX = 0.0;
    final lineFirstY = y * .23;
    path.lineTo(lineFirstX, lineFirstY);

    final curveEndX = x;
    final curveEndY = y * .1;
    final curveMoveX = x * .5;
    final curveMoveY = y * .33;
    path.quadraticBezierTo(curveMoveX, curveMoveY, curveEndX, curveEndY);
    path.lineTo(x, 0);
    canvas.drawPath(path, paint);

    /// second shape
    Path path2 = Path();
    Paint paint2 = Paint()..color = color.withOpacity(0.7);
    final moveX2 = x * .0;
    final moveY2 = y * .25;
    path2.moveTo(moveX2, moveY2);

    final curveEndX2 = x;
    final curveEndY2 = y * .13;
    final curveMoveX2 = x * .5;
    final curveMoveY2 = y * .35;
    path2.quadraticBezierTo(curveMoveX2, curveMoveY2, curveEndX2, curveEndY2);

    path2.lineTo(curveEndX2, curveEndY2 + 10);

    final curveEndX21 = x * 0;
    final curveEndY21 = y * .255;
    final curveMoveX21 = x * .55;
    final curveMoveY21 = y * .37;
    path2.quadraticBezierTo(curveMoveX21, curveMoveY21, curveEndX21, curveEndY21);

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
