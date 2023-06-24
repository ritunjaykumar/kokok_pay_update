import 'package:flutter/material.dart';
import '../../screens/base/base_view_model.dart';
import '../../models/enums/enums.dart';
import '/application/application.dart';
import '/service/storage/shared_preferences.dart';

class AppSettingProvider extends BaseViewModel {
  final LocalStorage _localStorage = instance<LocalStorage>();
  ThemeMode _themeMode = ThemeMode.system;

  AppLanguage _appLanguage;

  AppSettingProvider(super.context) : _appLanguage = AppLanguage.defaultLang {
    _init();
  }

  void _init() async {
    _themeMode = _localStorage.getThemeMode();
    _appLanguage = _localStorage.getAppLanguage();
  }

  void changeThemeMode(ThemeMode themeMode) async {
    if (themeMode != _themeMode) {
      _themeMode = themeMode;
      _localStorage.saveThemeMode(themeMode);
      notifyListeners();
    }
  }

  void changeAppLanguage(AppLanguage appLanguage) {
    if (_appLanguage != appLanguage) {
      _appLanguage = appLanguage;
      _localStorage.saveAapLanguage(appLanguage);
      notifyListeners();
    }
  }

  ThemeMode get themeMode => _themeMode;

  AppLanguage get appLanguage => _appLanguage;

  Locale getLocal() {
    return Locale(appLanguage.language, appLanguage.countryCode);
  }

  /*void detectSystemLanguage(String langCode) {
    AppLanguage selectedLang = AppLanguage.getAppLanguage(langCode);
    if (firstTime*/ /* && selectedLang == AppLanguage.defaultLang*/ /*) {
      firstTime = false;
      systemLanguage = AppLanguage.getAppLanguage(langCode);
    }
  }*/

  void updateHeaderLang(String langCode) {
    AppLanguage selectedLang = AppLanguage.getAppLanguage(langCode);
    dioImpl.headerLang = selectedLang;
    // //todo
    //
    // print('system lang: $systemLanguage');
    // print('selected lang-country code: ${selectedLang.countryCode}');
    // print('selected lang-country lang: ${selectedLang.language}');
  }
}
