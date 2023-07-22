import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:kokok_pay/screens/base/base_view_model.dart';
import 'package:kokok_pay/service/toast/toast_data.dart';

class TransferProvider extends BaseViewModel {
  TransferProvider(super.context, this._consI);
  final String? _consI;

  Future<String?> readContact() async {
    if (await FlutterContactPicker.hasPermission()) {
      return await _getMobileNumber();
    } else {
      var status = await FlutterContactPicker.requestPermission();
      if(status){
        return await _getMobileNumber();
      }else{
        nativeToast.showToast(ToastData.failed(message: 'contact permission denied'));
      }
    }
  }


  String? get consI => _consI;

  Future<String?> _getMobileNumber() async{
    final FullContact contact = await FlutterContactPicker.pickFullContact();
    return contact.phones[0].number;
  }
}
