import 'package:flutter/material.dart';

class HomeBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double x = size.width;
    double y = size.height;
    path.lineTo(0, y * .45);
    path.quadraticBezierTo(x * .3, y * .95, x, y);
    path.lineTo(x, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class HomeBackgroundClipperBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double x = size.width;
    double y = size.height;
    double curveX = x * 0.25;
    double curveY = y * .85;

    path.quadraticBezierTo(curveX, curveY, x, y);
    path.lineTo(0, y);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
