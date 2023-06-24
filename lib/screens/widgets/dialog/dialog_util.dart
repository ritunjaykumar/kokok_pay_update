import 'package:flutter/cupertino.dart';
import 'package:kokok_pay/exceptions/exceptions.dart';
import 'package:kokok_pay/models/model/error_model.dart';

import '/screens/widgets/dialog/dialog_impl.dart';

class DialogUtil {
  void showErrorDialog(BuildContext context, String msg) {
    ErrorDialog errorDialog = ErrorDialog(context, msg);
    errorDialog.show();
  }

  void showFailureDialog(BuildContext context, Failure failure){
    showErrorDialog(context, failure.message);
  }
}
