import 'package:flutter/material.dart';

class LoginBgPainter extends CustomPainter {
  final Color color;

  LoginBgPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final y = size.height;
    final x = size.width;

    //first path
    Paint paint = Paint();
    Path path = Path();

    double endX = x;
    double endY = y * .40;

    double firstX = x * 0.4;
    double firstY = y * .15;

    double secondX = x * .2;
    double secondY = y * 0.45;

    paint.color = color;
    path = Path();
    path.lineTo(0, y * 0.1);
    path.cubicTo(firstX, firstY, secondX, secondY, endX, endY);
    path.lineTo(x, 0);

    canvas.drawPath(path, paint);

    //second path

    Paint paint2 = Paint();
    Path path2 = Path();

    double endX2 = x;
    double endY2 = y * .46;

    double firstX2 = x * 0.3;
    double firstY2 = y * .15;

    double secondX2 = x * .1;
    double secondY2 = y * 0.48;

    paint2.color = color.withOpacity(0.6);
    path2 = Path();
    path2.lineTo(0, y * 0.14);
    path2.cubicTo(firstX2, firstY2, secondX2, secondY2, endX2, endY2);
    path2.lineTo(x, 0);

    canvas.drawPath(path2, paint2);
    //third pat

    Paint paint3 = Paint();
    Path path3 = Path();

    double endX3 = x;
    double endY3 = y * .5;

    double firstX3 = x * 0.35;
    double firstY3 = y * .15;

    double secondX3 = x * .05;
    double secondY3 = y * 0.5;

    paint3.color = color.withOpacity(0.3);
    path3 = Path();
    path3.lineTo(0, y * 0.12);
    path3.cubicTo(firstX3, firstY3, secondX3, secondY3, endX3, endY3);
    path3.lineTo(x, 0);

    canvas.drawPath(path3, paint3);

    ////bottom design

    Paint paintBtm = Paint();
    Path pathBtm = Path();

    double endXBtm = x;
    double endYBtm = y * 0.95;

    double firstXBtm = x * .6;
    double firstYBtm = y * .82;

    double secondXBtm = x * .2;
    double secondYBtm = y * 1;

    paintBtm.color = color.withOpacity(0.6);
    pathBtm = Path();
    pathBtm.moveTo(0, y * 0.80);
    pathBtm.cubicTo(firstXBtm, firstYBtm, secondXBtm, secondYBtm, endXBtm, endYBtm);
    pathBtm.lineTo(x, y);
    pathBtm.lineTo(0, y);

    canvas.drawPath(pathBtm, paintBtm);
    //second bottom


    Paint paintBtm1 = Paint();
    Path pathBtm1 = Path();

    double endXBtm1 = x;
    double endYBtm1 = y * 0.84;

    double firstXBtm1 = x * .2;
    double firstYBtm1 = y * 1;

    double secondXBtm1 = x * .8;
    double secondYBtm1 = y * .83;

    paintBtm1.color = color.withOpacity(0.5);
    pathBtm1 = Path();
    pathBtm1.moveTo(0, y * 0.84);
    pathBtm1.cubicTo(firstXBtm1, firstYBtm1, secondXBtm1, secondYBtm1, endXBtm1, endYBtm1);
    pathBtm1.lineTo(x, y);
    pathBtm1.lineTo(0, y);

    canvas.drawPath(pathBtm1, paintBtm1);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
