import 'package:flutter/material.dart';
import 'package:kokok_pay/screens/card/card_screen.dart';
import 'package:kokok_pay/screens/dashboard/dashboard_screen.dart';
import 'package:kokok_pay/screens/edl/edl_screen.dart';
import 'package:kokok_pay/screens/favorite/favorite_screen.dart';
import 'package:kokok_pay/screens/insurance/insurance_screen.dart';
import 'package:kokok_pay/screens/qr/qr_screen/qr_amount_screen.dart';
import 'package:kokok_pay/screens/qr/qr_screen/qr_screen.dart';
import 'package:kokok_pay/screens/result/edl/result_edl_screen.dart';
import 'package:kokok_pay/screens/result/topup/topup_result_screen.dart';
import 'package:kokok_pay/screens/result/transfer/result_transfer_screen.dart';
import 'package:kokok_pay/screens/scanner/details/scanner_detail_screen.dart';
import 'package:kokok_pay/screens/scanner/qr_scanner_screen.dart';
import 'package:kokok_pay/screens/support/support_screen.dart';
import 'package:kokok_pay/screens/topup/topup_screen.dart';
import 'package:kokok_pay/screens/transfer/transfer_screen.dart';
import 'package:kokok_pay/screens/wallet/wallet_screen.dart';

import '/screens/account/forgot_pin/forgot_pin_screen.dart';
import '/screens/account/login/login_screen.dart';
import '/screens/before/policy/policy_screen.dart';
import '/screens/before/start/start_screen.dart';
import '/screens/unknown/unknown_screen.dart';
import '../example/user_details_screen.dart';
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
  static const String userDetailsScreen = 'userDetailsScreen';
  static const String walletScreen = 'walletScreen';
  static const String dashboardScreen = 'dashboardScreen';
  static const String qrScannerScreen = 'qrScannerScreen';
  static const String scannerDetailScreen = 'scannerDetailScreen';
  static const String resultScreen = 'resultScreen';
  static const String cardScreen = 'cardScreen';
  static const String transferScreen = 'transferScreen';
  static const String edlScreen = 'edlScreen';
  static const String resultEdlScreen = 'resultEdlScreen';
  static const String supportScreen = 'supportScreen';
  static const String favoriteScreen = 'favoriteScreen';
  static const String topupScreen = 'topupScreen';
  static const String topupResultScreen = 'topupResultScreen';
  static const String insuranceScreen = 'insuranceScreen';
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
      case Routes.qrAmountScreen:
        return MaterialPageRoute(builder: (_) => const QrAmountScreen());
      case Routes.walletScreen:
        return MaterialPageRoute(builder: (_) => const WalletScreen());
      case Routes.dashboardScreen:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case Routes.qrScannerScreen:
        return MaterialPageRoute(builder: (_) => const QrScannerScreen());
      case Routes.scannerDetailScreen:
        return MaterialPageRoute(builder: (_) => const ScannerDetailScreen());
      case Routes.resultScreen:
        return MaterialPageRoute(builder: (_) => const ResultTransferScreen());
      case Routes.cardScreen:
        return MaterialPageRoute(builder: (_) => const CardScreen());
      /*case Routes.transferScreen:
        return MaterialPageRoute(builder: (_) => const TransferScreen());*/
      /*case Routes.edlScreen:
        return MaterialPageRoute(builder: (_) => const EdlScreen());*/
       case Routes.insuranceScreen:
        return MaterialPageRoute(builder: (_) => const InsuranceScreen());
      case Routes.supportScreen:
        return MaterialPageRoute(builder: (_) => const SupportScreen());
      case Routes.favoriteScreen:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      case Routes.topupScreen:
        return MaterialPageRoute(builder: (_) => const TopupScreen());
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
      Routes.userDetailsScreen: (_) => const UserDetailsScreen(),
      Routes.edlScreen: (_) => const EdlScreen(),
      Routes.transferScreen: (_) => const TransferScreen(),
      Routes.resultEdlScreen: (_) => const ResultEdlScreen(),
      Routes.topupResultScreen: (_) => const TopupResultScreen(),
    };
  }
}
