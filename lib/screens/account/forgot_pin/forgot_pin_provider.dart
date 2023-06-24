import 'package:flutter/material.dart';
import 'package:kokok_pay/models/model/error_model.dart';
import 'package:kokok_pay/models/request/request_dto.dart';
import 'package:kokok_pay/screens/widgets/dialog/dialog_impl.dart';
import 'package:kokok_pay/service/toast/toast_data.dart';
import 'package:kokok_pay/utils/util/encryption.dart';

import '../../../application/application.dart';
import '/screens/base/base_view_model.dart';

class ForgotPinProvider extends BaseViewModel {
  ForgotPinProvider(super.context);

  final RSAEncryption encryption = instance<RSAEncryption>();
  final String _secType = 'FGMPIN';
  String otpRefId = '';

  void sendOtp() async {
   /* progressDialog.show();
    (await repository.sendOtp(_secType)).fold(
      (Failure failure) {
        progressDialog.dismiss();
        dialogUtil.showFailureDialog(context, failure);
      },
      (String otpRefId) {
        progressDialog.dismiss();
        this.otpRefId = otpRefId;
        nativeToast.showToast(
          ToastData.success(
            message: 'Otp has sent to registered mobile number',
          ),
        );
      },
    );*/

    //delete it
    otpRefId = 'otpRefId';
    nativeToast.showToast(
      ToastData.success(
        message: 'Otp has sent to registered mobile number',
      ),
    );
  }

  void resetMpin(String mpin, String otp) async {
    String hashedMpin = encryption.getHashedData(mpin);
    String encOtp = encryption.encryptData(otp);

    ResetMpinReqDto reqDto = ResetMpinReqDto(otpRefId, encOtp, _secType, hashedMpin);

    /*progressDialog.show();
    (await repository.resetMpin(reqDto)).fold(
      (Failure failure) {
        progressDialog.dismiss();
        dialogUtil.showFailureDialog(context, failure);
      },
      (void v) {
        progressDialog.dismiss();
        SuccessDialog successDialog = SuccessDialog(
          context,
          'mpin has changed successfully!',
          () {
            Navigator.of(context).pop();
          },
        );
        successDialog.show();
      },
    );*/
    progressDialog.dismiss();
    SuccessDialog successDialog = SuccessDialog(
      context,
      'mpin has changed successfully!',
          () {
        Navigator.of(context).pop();
      },
    );
    successDialog.show();
  }
}
