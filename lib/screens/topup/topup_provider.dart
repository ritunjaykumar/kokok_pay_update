import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:kokok_pay/screens/base/base_view_model.dart';
import 'package:kokok_pay/service/toast/toast_data.dart';

class TopupProvider extends BaseViewModel{
  TopupProvider(super.context);




  Future<String?> readContact() async {
    if (await FlutterContactPicker.hasPermission()) {
      return await _getMobileNumber();
    } else {
      var status = await FlutterContactPicker.requestPermission();
      if(status){
        return await _getMobileNumber();
      }else{
        nativeToast.showToast(ToastData.failed(message: 'contact permission denied'));
        return null;
      }
    }
  }

  Future<String?> _getMobileNumber() async{
    final FullContact contact = await FlutterContactPicker.pickFullContact();
    return contact.phones[0].number;
  }

}