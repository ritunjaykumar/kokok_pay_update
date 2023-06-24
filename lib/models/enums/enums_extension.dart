import 'package:flutter/material.dart';

extension OnThemeMode on ThemeMode {
  String getName() {
    switch (this) {
      case ThemeMode.system:
        return 'system';
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
    }
  }
}


