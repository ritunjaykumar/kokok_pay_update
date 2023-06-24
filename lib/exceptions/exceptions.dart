import 'package:flutter/cupertino.dart';

abstract class BaseException implements Exception {
  @protected
  String msg;

  BaseException(this.msg);

  @override
  String toString() {
    return '''error: $msg''';
  }
}

class GpsException extends BaseException {
  GpsException(super.msg);
}

class UnknownException extends BaseException {
  UnknownException(super.msg);
}

class PermissionException extends BaseException {
  bool openSettings;

  PermissionException(super.msg, {this.openSettings = false});
}

//
class BiometricException extends BaseException {
  BiometricException(super.msg);
}
