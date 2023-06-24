import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:encrypt/encrypt.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:get_it/get_it.dart';
import 'package:kokok_pay/models/model/models.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resources/certificate_manager.dart';
import '../service/biometric/biometric.dart';
import '/application/push_notification_configuration.dart';
import '/models/enums/enums.dart';
import '/service/device/device_info.dart';
import '/service/device/package_info.dart';
import '/service/network/api/api.dart';
import '/service/network/dio_config/dio_config.dart';
import '/service/network/internet/internet.dart';
import '/service/network/repository/repository_impl.dart';
import '/service/storage/shared_preferences.dart';
import '/utils/extensions/string_extension.dart';
import '/utils/util/encryption.dart';
import '../screens/widgets/dialog/dialog_util.dart';
import '../service/network/source/remote_data_source.dart';

final GetIt instance = GetIt.instance;
late final Logger logger;

Future<void> onApplicationStart() async {
  //registering the current user
  instance.registerLazySingleton(() => CurrentUserDetails(loginTime: DateTime.now()));
  //registering log
  _logInit();
  //loading public key
  _loadPublicKey();
  //registering the dialog util
  instance.registerSingleton<DialogUtil>(DialogUtil());
  //registering package info
  _initializePackage();
  //initialized push notifications
  _initPushNotification();
  //initializing biometric
  _initBiometric();
  //registering the shared preference
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerSingleton<LocalStorage>(LocalStorage(sharedPrefs));
  //device registering
  await registeringDeviceInfo();
  //registering the dio package
  await dioRegister();
  //register internet status
  InternetStatus internetStatus = InternetStatus();
  instance.registerSingleton<InternetStatus>(internetStatus);

  //register data source
  instance.registerSingleton<RemoteDataSourceImpl>(RemoteDataSourceImpl(instance<ApiClient>()));
  //registering repository

  instance.registerSingleton<RepositoryImpl>(
      RepositoryImpl(instance<InternetStatus>(), instance<RemoteDataSourceImpl>()));
}

Future<void> dioRegister() async {
  DioConfig dioConfig = DioConfig(instance());
  Dio dio = await dioConfig.initDio();
  //pining ssl
  /*(dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    SecurityContext sc = SecurityContext();
    //file is the path of certificate
    sc.setTrustedCertificates(CertificateResource.certificate);
    HttpClient httpClient = HttpClient(context: sc);
    return httpClient;
  };*/

  //bypassing the certificate
  // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
  //   client.badCertificateCallback = (X509Certificate cert, String host, int port) {
  //     return true;
  //   };
  // };
  DioImpl dioImpl = DioImpl(dio);
  instance.registerSingleton<DioImpl>(dioImpl);
  //register api client
  ApiClient apiClient = ApiClient(dio);
  instance.registerSingleton<ApiClient>(apiClient);
}

Future<void> registeringDeviceInfo() async {
  String udid = await FlutterUdid.consistentUdid;
  PlatformType platformType = _getPlatform();
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String osVersion;
  String productName;
  if (platformType == PlatformType.android) {
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    // print('androidInfo: $androidInfo');
    osVersion = androidInfo.version.release;
    productName = androidInfo.product;
  } else {
    IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    osVersion = iosDeviceInfo.utsname.release!;
    productName = iosDeviceInfo.utsname.nodename!;
  }

  DeviceInfo deviceInfo = DeviceInfo(platformType, udid, osVersion, productName);
  logger.i('device info: $deviceInfo');
  instance.registerSingleton<DeviceInfo>(deviceInfo);
}

void _logInit() {
  logger = Logger(
    output: ConsoleOutput(),
    filter: DevelopmentFilter(),
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true, // Should each log print contain a timestamp
    ),
  );
}

void _initializePackage() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  AppPackageInfo api = AppPackageInfo(
    appName: packageInfo.appName,
    packageName: packageInfo.packageName,
    version: packageInfo.version,
    buildNumber: packageInfo.buildNumber,
  );
  instance.registerSingleton<AppPackageInfo>(api);
}

PlatformType _getPlatform() {
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return PlatformType.android;
    case TargetPlatform.iOS:
      return PlatformType.ios;
    default:
      return PlatformType.others;
  }
}

Future<void> _initPushNotification() async {
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!
      .createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.instance.getToken().then((value) {
    String? token = value;
    FirebaseInfo firebaseInfo = FirebaseInfo(token.notNull());
    instance.registerSingleton<FirebaseInfo>(firebaseInfo);
  });
}

Future<void> _loadPublicKey() async {
  final publicPem = await rootBundle.loadString(CertificateResource.publicCertificate);
  RSAPublicKey publicKey = RSAKeyParser().parse(publicPem) as RSAPublicKey;
  RSAEncryption rsaEncryption = RSAEncryption(publicKey);
  instance.registerSingleton<RSAEncryption>(rsaEncryption);
}

Future<void> _initBiometric() async {
  final LocalAuthentication auth = LocalAuthentication();
  bool enrolled = false;
  bool deviceSupported = false;
  bool configured = false;
  try {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    deviceSupported = canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    if (deviceSupported) {
      final List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
      if (availableBiometrics.isNotEmpty) {
        enrolled = true;
        configured = true;
        logger.i('biometric has enabled');
      } else {
        logger.e('biometric has not been enable');
      }
    } else {
      logger.e('device does not support biometric');
    }
  } on PlatformException catch (err) {
    logger.e('biometric error: ${err.message}');
  } catch (error) {
    logger.e('biometric error: ${error.toString()}');
  }
  AppBiometric appBiometric = AppBiometric(
    auth: auth,
    isBiometricAvailable: deviceSupported,
    isBiometricEnrolled: enrolled,
    configured: configured,
  );

  instance.registerLazySingleton<AppBiometric>(() => appBiometric);
}

/// ssl alternative
/// String PEM='XXXXX'; // certificate content
// (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
//   client.badCertificateCallback=(X509Certificate cert, String host, int port){
//     if(cert.pem==PEM){ // Verify the certificate
//       return true;
//     }
//     return false;
//   };
// };
