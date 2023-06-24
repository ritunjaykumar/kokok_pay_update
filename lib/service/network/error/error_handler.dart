import 'package:dio/dio.dart';

import '../../../models/model/error_model.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unAuthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  unknown;
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handlerError(error);
    } else {
      failure = DataSource.unknown.getFailure();
    }
  }

  Failure _handlerError(DioException error) {
    switch(error.type){

      case DioExceptionType.connectionTimeout:
        return DataSource.connectTimeout.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioExceptionType.badCertificate:
        //todo for bad certificate
        return DataSource.receiveTimeout.getFailure();
      case DioExceptionType.badResponse:
        return DataSource.badRequest.getFailure();
      case DioExceptionType.cancel:
        //todo for cancel request
        return DataSource.badRequest.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.connectTimeout.getFailure();
      case DioExceptionType.unknown:
        return DataSource.unknown.getFailure();
    }



   /* switch (error.type) {
      case DioErrorType.connectionTimeout:
        return DataSource.connectTimeout.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case ResponseCode.badRequest:
            return DataSource.badRequest.getFailure();
          case ResponseCode.forbidden:
            return DataSource.forbidden.getFailure();
          case ResponseCode.unAuthorised:
            return DataSource.unAuthorised.getFailure();
          case ResponseCode.notFound:
            return DataSource.notFound.getFailure();
          case ResponseCode.internalServerError:
            return DataSource.internalServerError.getFailure();
          default:
            return DataSource.unknown.getFailure();
        }
      case DioErrorType.cancel:
        return DataSource.cancel.getFailure();
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        break;
      case DioExceptionType.badResponse:
        // TODO: Handle this case.
        break;
      case DioExceptionType.connectionError:
        return DataSource.connectTimeout.getFailure();
      case DioExceptionType.unknown:
        // TODO: Handle this case.
        break;
    }*/
  }
}

class ResponseCode {
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int forbidden = 403;
  static const int unAuthorised = 401;
  static const int notFound = 404;
  static const int internalServerError = 500;
  static const int cancel = -8;
  static const int unknownError = -1;
  static const int connectTimeout = -2;
  static const int sendTimeout = -3;
  static const int cacheError = -5;
  static const int receiveTimeout = -6;
  static const int noInternetConnection = -7;
}

class ResponseMessage {
  static const String success = 'AppString.success';
  static const String noContent = 'AppString.noContent';
  static const String badRequest = 'AppString.badRequest';
  static const String forbidden = 'AppString.forbidden';
  static const String unAuthorised = 'AppString.unAuthorised';
  static const String notFound = 'AppString.notFound';
  static const String internalServerError = 'AppString.internalServerError';
  static const String unknownError = 'AppString.unknownError';
  static const String connectTimeout = 'AppString.connectTimeout';
  static const String cancel = 'AppString.cancel';
  static const String noInternetConnection = 'AppString.noInternetConnection';
  static const String sendTimeout = 'AppString.sendTimeOut';
  static const String cacheError = 'AppString.cacheError';
  static const String receiveTimeout = 'AppString.receiveTimeout';
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unAuthorised:
        return Failure(ResponseCode.unAuthorised, ResponseMessage.unAuthorised);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return Failure(
            ResponseCode.connectTimeout, ResponseMessage.connectTimeout);
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return Failure(
            ResponseCode.receiveTimeout, ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      default:
        return Failure(ResponseCode.unknownError, ResponseMessage.unknownError);
    }
  }
}
