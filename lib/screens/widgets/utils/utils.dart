import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static UnderlineInputBorder getUnderLineInputBoarder(Color color) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
