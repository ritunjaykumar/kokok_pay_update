import 'package:flutter/material.dart';
import 'package:kokok_pay/screens/qr/qr_screen/qr_screen.dart';

import '../example/user_details_screen.dart';
import '../screens/qr/qr_screen/qr_amount_screen.dart';
import '/screens/account/forgot_pin/forgot_pin_screen.dart';
import '/screens/account/login/login_screen.dart';
import '/screens/before/policy/policy_screen.dart';
import '/screens/before/start/start_screen.dart';
import '/screens/unknown/unknown_screen.dart';
import '../screens/account/device_register/device_register_screen.dart';
import '../screens/account/pin_register/pin_register_screen.dart';
import '../screens/account/user_register/confirmation_user_register_screen.dart';
import '../screens/account/user_register/user_register_screen.dart';
import '../screens/before/splash/splash_screen.dart';
import '../screens/before/update/update_screen.dart';
import '../screens/home/home_screen.dart';

class Routes {
  Routes._internal();

  static const String homeScreen = 'homeScreen';
  static const String unknownScreen = 'unknownScreen';
  static const String splashScreen = 'splashScreen';
  static const String policyScreen = 'policyScreen';
  static const String deviceRegistrationScreen = 'deviceRegistrationScreen';
  static const String userRegisterScreen = 'UserRegisterScreen';
  static const String confirmUserRegisterScreen = 'confirmUserRegisterScreen';
  static const String pinRegisterScreen = 'pinRegisterScreen';
  static const String startScreen = 'startScreen';
  static const String updateScreen = 'updateScreen';
  static const String loginScreen = 'loginScreen';
  static const String forgotPin = 'forgotPin';
  static const String qrScreen = 'qrScreen';
  static const String qrAmountScreen = 'qrAmountScreen';
  static const String userDetailsScreen = 'UserDetailsScreen';

}

class RouteResource {
  RouteResource._internal();

  static final RouteResource _singleton = RouteResource._internal();

  factory RouteResource() {
    return _singleton;
  }

  //if ypu want to pass data use material route
  static Route<dynamic> getGeneratedRoutes(RouteSettings route) {
    switch (route.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.deviceRegistrationScreen:
        return MaterialPageRoute(builder: (_) => const DeviceRegisterScreen());
      case Routes.startScreen:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case Routes.updateScreen:
        return MaterialPageRoute(builder: (_) => const UpdateScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.forgotPin:
        return MaterialPageRoute(builder: (_) => const ForgotPinScreen());
      case Routes.qrScreen:
        return MaterialPageRoute(builder: (_) => const QrScreen());
      default:
        return MaterialPageRoute(builder: (_) => const UnknownScreen());
    }
  }

  //If you want to pass value from one page to another page use routes
  // Navigator.of(context).something
  static Map<String, Widget Function(BuildContext)> getStaticRoute(BuildContext context) {
    return {
      Routes.policyScreen: (_) => const PolicyScreen(),
      Routes.userRegisterScreen: (_) => const UserRegisterScreen(),
      Routes.confirmUserRegisterScreen: (_) => const ConfirmationUserRegisterScreen(),
      Routes.pinRegisterScreen: (_) => const PinRegisterScreen(),
      Routes.qrAmountScreen: (_) => const QrAmountScreen(),
      Routes.userDetailsScreen: (_) => const UserDetailsScreen(),
    };
  }
}
