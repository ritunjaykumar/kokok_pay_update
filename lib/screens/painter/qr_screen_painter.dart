import 'package:flutter/cupertino.dart';

class QrScreenPainter extends CustomPainter {
  final Color color;

  QrScreenPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color;
    Path path = Path();
    double x = size.width;
    double y = size.height;

    path.lineTo(x * 0, y * .45);
    path.lineTo(x * 1, y * .45);
    path.lineTo(x * 1, y * 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
