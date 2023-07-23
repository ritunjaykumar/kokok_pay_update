import 'package:kokok_pay/screens/base/base_view_model.dart';

class EdlProvider extends BaseViewModel{
  EdlProvider(super.context, this._consId, this.screenType);
  final String? _consId;
  final String screenType;

  String? get consId => _consId;
}