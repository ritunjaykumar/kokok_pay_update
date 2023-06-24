import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SupportMethods {
  static ThemeMode getThemeMode(String name) {
    switch (name) {
      case 'system':
        return ThemeMode.system;
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  static void closeKeyboard() {
    if (FocusManager.instance.primaryFocus!.hasFocus) {
      FocusManager.instance.primaryFocus!.unfocus();
    }else {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
  }

  SupportMethods._();
}
