import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '/models/enums/enums.dart';
import '/service/device/device_info.dart';
import 'dio_intercepter.dart';

const String _contentTypeJson = 'application/json';
const String _contentType = 'Content-Type';
const String _accept = 'accept';
const String _deviceId = 'DEVICE_ID';
const String deviceDate = 'DEVICE_DATE';
const String _acceptLanguage = 'Accept-Language';
const String _sessionId = 'AUTH_TOKEN';
const String baseUrl = 'https://kkuat.kokkokpay.com/mobile-server/v1.0.1';
const int _connectTimeoutMillisecond = 1000 * 30;
const int _receiveTimeoutMillisecond = 1000 * 30;
const int _sendTimeoutMillisecond = 1000 * 30;

class DioConfig {
  final DeviceInfo deviceInfo;

  const DioConfig(this.deviceInfo);

  Future<Dio> initDio() async {
    Dio dio = Dio();
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: _connectTimeoutMillisecond),
      receiveTimeout: const Duration(milliseconds: _receiveTimeoutMillisecond),
      sendTimeout: const Duration(milliseconds: _sendTimeoutMillisecond),
      responseType: ResponseType.json,
      headers: _getHeader(),
    );

    _configLog(dio);

    return dio;
  }

  Map<String, dynamic> _getHeader() {
    Map<String, String> headers = {
      _contentType: _contentTypeJson,
      _accept: _contentTypeJson,
      _deviceId: deviceInfo.deviceId
    };
    return headers;
  }

  void _configLog(Dio dio) {
    if (kReleaseMode) {
      if (kDebugMode) {
        print('release mode no logs');
      }
    } else {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
          request: true,
          requestBody: true,
        ),
      );
    }
  }
}

class DioImpl {
  final Dio dio;

  const DioImpl(this.dio);

  set header(Map<String, dynamic> header) {
    Map<String, dynamic> curHeader = dio.options.headers;
    curHeader.addAll(header);
    dio.options.headers = curHeader;
  }

  set headerLang(AppLanguage appLanguage) {
    String appLang;
    if (appLanguage == AppLanguage.lao) {
      appLang = '${appLanguage.language == 'lo' ? 'la' : appLanguage.language}-${appLanguage.countryCode}';
    } else {
      appLang = '${appLanguage.language}-${appLanguage.countryCode}';
    }
    dio.options.headers[_acceptLanguage] = appLang;
  }

  set sessionId(String sessionId) {
    dio.options.headers[_sessionId] = sessionId;
  }

  void setTime() {
    DateTime now = DateTime.now();
    dio.options.headers[deviceDate] = now.toString();
  }
}
