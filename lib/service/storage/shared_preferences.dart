import 'package:flutter/material.dart';
import '/models/enums/enums.dart';
import '/application/application.dart';
import '/models/enums/enums_extension.dart';
import '/utils/extensions/string_extension.dart';
import '/utils/methods/support_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _LocalStorageKey {
  static const String themeModeKey = 'themeModeKey';
  static const String appLanguage = 'appLanguage';
  static const String appFirstTime = 'appFirstTime';
  static const String mobile = 'mobile';
  static const String otpRefId = 'otpRefId';
  static const String userId = 'userId';
  static const String biometricEnable = 'biometricEnable';

  _LocalStorageKey._();
}

class LocalStorage {
  final SharedPreferences _preferences;

  LocalStorage(this._preferences);

  ThemeMode getThemeMode() {
    String? language = _preferences.getString(_LocalStorageKey.themeModeKey);
    ThemeMode themeMode = SupportMethods.getThemeMode(language.notNull());
    logger.i('themeMode: $themeMode');
    return themeMode;
  }

  void saveThemeMode(ThemeMode themeMode) async {
    logger.i('saving themeMode: ${themeMode.getName()}');
    var status = await _preferences.setString(_LocalStorageKey.themeModeKey, themeMode.getName());
    logger.i(status ? 'themeMode saved' : 'themeMode not saved');
  }

  AppLanguage getAppLanguage() {
    String? appLang = _preferences.getString(_LocalStorageKey.appLanguage);
    AppLanguage appLanguage = AppLanguage.getAppLanguage(appLang.notNull());
    logger.i('app language: ${appLanguage.name}: ${appLanguage.language}');
    return appLanguage;
  }

  void saveAapLanguage(AppLanguage appLanguage) async {
    logger.i('saving appLanguage: ${appLanguage.name}: ${appLanguage.language}');
    var status = await _preferences.setString(_LocalStorageKey.appLanguage, appLanguage.language);
    logger.i(status ? 'appLanguage saved' : 'appLanguage not saved');
  }

  void setIsDeviceRegistered() async {
    logger.i('saving is device registered');
    final status = await _preferences.setBool(_LocalStorageKey.appFirstTime, true);
    logger.i(status ? 'is device registered: true' : 'does not is device registered');
  }

  bool isDeviceRegistered() {
    final value = _preferences.getBool(_LocalStorageKey.appFirstTime);
    logger.i('is device registered: $value');
    return value ?? false;
  }

  void saveMobileNumber(String mobile) async {
    logger.i('saving mobile number: $mobile');
    final status = await _preferences.setString(_LocalStorageKey.mobile, mobile);
    logger.i(status ? 'mobile number saved' : 'mobile number did not save');
  }

  String? getMobileNumber() {
    final mobileNumber = _preferences.getString(_LocalStorageKey.mobile);
    logger.i('mobile number: $mobileNumber');
    return mobileNumber;
  }

  void saveOtpRefId(String otpRefId) async {
    logger.i('saving otp ref id: $otpRefId');
    final status = await _preferences.setString(_LocalStorageKey.otpRefId, otpRefId);
    logger.i(status ? 'otp ref id saved' : 'otp ref id did not save');
  }

  String? getOtpRefId() {
    final otpRefId = _preferences.getString(_LocalStorageKey.otpRefId);
    logger.i('otp ref id: $otpRefId');
    return otpRefId;
  }

  void saveUserId(String userId) async {
    logger.i('saving user id: $userId');
    final status = await _preferences.setString(_LocalStorageKey.userId, userId);
    logger.i(status ? 'user id saved' : 'user id did not save');
  }

  String? getUserId() {
    final userId = _preferences.getString(_LocalStorageKey.userId);
    logger.i('user id: $userId');
    return userId;
  }

  void saveBiometricEnable([bool biometric = true]) async {
    logger.i('saving saving biometric status: $biometric');
    final status = await _preferences.setBool(_LocalStorageKey.biometricEnable, biometric);
    logger.i(status ? 'biometric data saved' : 'biometric data did not save');
  }

  bool getBiometricEnable() {
    final biometricStatus = _preferences.getBool(_LocalStorageKey.biometricEnable);
    logger.i('biometric status: $biometricStatus');
    return biometricStatus ?? false;
  }

  //===========================================================================
  Future<void> clearPreference() async {
    _preferences.clear();
  }
}
