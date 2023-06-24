import 'package:kokok_pay/screens/base/base_view_model.dart';

class QrProvider extends BaseViewModel{
  QrProvider(super.context);
  final String _qrString = 'abcdefghijklmnopqrstuvwxyz';

  String get qrString => _qrString;
}