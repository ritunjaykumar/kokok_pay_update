import 'package:kokok_pay/screens/base/base_view_model.dart';

class ResultEdlProvider extends BaseViewModel{
  ResultEdlProvider(super.context, this._screenType);
  final String _screenType;

  String get screenType => _screenType;
}