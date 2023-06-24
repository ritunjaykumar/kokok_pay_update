import '../../service/network/error/error_handler.dart';
import '../enums/enums.dart';

class Failure {
  dynamic respCode;
  String message;
  ResponseStatus status;

  Failure(this.respCode, this.message, [this.status = ResponseStatus.fail]);

  Failure.defaultError()
      : this(
          ResponseCode.unknownError,
          ResponseMessage.unknownError,
        );

  @override
  String toString() {
    return '''Failure{code: $respCode, message: $message}, status: ${status.status}}''';
  }
}
