import 'package:flutter/services.dart';
import '../../application/application.dart';
import '/service/toast/toast_data.dart';

const String _methodName = 'showToast';

class NativeToastService {
  final MethodChannel channel = const MethodChannel('com.kokkok.pay/toastMessageChannel');

  const NativeToastService._();

  static const NativeToastService _nativeToastService = NativeToastService._();

  factory NativeToastService() {
    return _nativeToastService;
  }

  void showToast(ToastData toastData) async {
    final value = await channel.invokeMethod(_methodName, {
      'message': toastData.message,
      'position': toastData.position.position,
      'type': toastData.type.type,
    });
    logger.i('toast acknowledgement: $value');
  }
}
