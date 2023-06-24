import 'package:flutter/services.dart';
import 'package:kokok_pay/application/application.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

import '../../exceptions/exceptions.dart';

class AppBiometric {
  final bool isBiometricAvailable;
  final bool isBiometricEnrolled;
  final LocalAuthentication auth;
  final bool configured;

  AppBiometric({
    required this.auth,
    required this.isBiometricAvailable,
    required this.isBiometricEnrolled,
    this.configured = false,
  });

  bool showBiometricButton() {
    return configured && isBiometricAvailable;
  }

  bool canUserEnableBiometric() {
    return showBiometricButton() && isBiometricEnrolled;
  }

  Future<bool> authenticateBiometric({String? title, String? msg}) async {
    if (configured == false) {
      throw BiometricException('Biometric has not been initialized, try again');
    }
    if (isBiometricAvailable == false) {
      throw BiometricException('The device does not support Biometric');
    }
    if (isBiometricEnrolled == false) {
      throw BiometricException('Please Enable the Biometric in your device');
    }
    try {
      final bool authorised = await auth.authenticate(
        localizedReason: title ?? 'Please authenticate to show account balance',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
        authMessages: <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: msg ?? 'Oops! Biometric authentication required!',
            cancelButton: 'No thanks',
          ),
          const IOSAuthMessages(
            cancelButton: 'No thanks',
          ),
        ],
      );
      logger.i('biometric authorised: $authorised');
      return authorised;
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        throw BiometricException('please enrolled the biometric');
      } else if (e.code == auth_error.lockedOut || e.code == auth_error.permanentlyLockedOut) {
        throw BiometricException('biometric is locked, close and try again');
      } else {
        throw BiometricException(e.message ?? 'something went wrong try again');
      }
    } catch (error) {
      logger.i('biometric error: $error');
      throw BiometricException('something went wrong try again');
    }
  }
}
