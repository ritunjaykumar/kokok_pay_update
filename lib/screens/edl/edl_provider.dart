import 'package:kokok_pay/screens/base/base_view_model.dart';

class EdlProvider extends BaseViewModel{
  EdlProvider(super.context, this._consId);
  final String? _consId;

  String? get consId => _consId;
}