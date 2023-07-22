import 'package:flutter/material.dart';

class CustomIcon {
  CustomIcon._();

  static const _kFontFam = 'FaceIcon';
  static const String? _kFontPkg = null;
  static const IconData face = IconData(
    0xe800,
    fontFamily: _kFontFam,
    fontPackage: _kFontPkg,
  );
  static const IconData bill = IconData(
    0xe800,
    fontFamily: 'Bill',
    fontPackage: _kFontPkg,
  );
}
