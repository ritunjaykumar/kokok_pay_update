import 'package:flutter/material.dart';
import 'package:kokok_pay/application/application.dart';
import 'package:kokok_pay/models/model/error_model.dart';
import 'package:kokok_pay/service/biometric/biometric.dart';
import 'package:kokok_pay/utils/util/encryption.dart';

import '../../../resources/routes_manager.dart';
import '/models/model/models.dart';
import '/screens/base/base_view_model.dart';
import '/screens/widgets/dialog/dialog_impl.dart';

class PinRegisterProvider extends BaseViewModel {
  PinRegisterProvider(super.context, this.userId, this.otpRefId) {
    userId = userId ?? localStorage.getUserId();
    otpRefId = otpRefId ?? localStorage.getOtpRefId();
  }

  final AppBiometric appBiometric = instance<AppBiometric>();

  final RSAEncryption encryption = instance<RSAEncryption>();
  String? userId;
  String? otpRefId;

  void onClickNext(String mpin) async {
    /*var hashedMpin = encryption.getHashedData(mpin);

    progressDialog.show();
    (await repository.registerNewMpin(MpinData(userId: userId!, mpin: hashedMpin))).fold(
      (Failure failure) {
        progressDialog.dismiss();
        dialogUtil.showFailureDialog(context, failure);
      },
      (void v) {
        progressDialog.dismiss();
        _showDialog();
      },
    );*/


    //delete
    _showDialog();
  }

  void _showDialog() {
    if (appBiometric.showBiometricButton()) {
      YesNoDialogData yesNoDialogData = YesNoDialogData(
        title: 'Set Biometric',
        subTitle: 'Do you want enable biometric login?',
        iconColor: Colors.green,
        iconData: Icons.fingerprint_sharp,
      );

      YesNoDialog yesNoDialog = YesNoDialog(context, yesNoDialogData, _clickOnYes, _routeLogin);
      yesNoDialog.show();
    } else {
      _routeLogin();
    }
  }

  void _clickOnYes() {
    _routeLogin();
    localStorage.saveBiometricEnable();
  }

  void _routeLogin() {
    Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
  }
}
