import 'package:flutter/material.dart';
import 'package:kokok_pay/models/model/error_model.dart';
import 'package:kokok_pay/service/toast/toast_data.dart';

import '../../../models/model/model_resp.dart';
import '../../../resources/routes_manager.dart';
import '/models/enums/enums.dart';

import '../../../models/model/models.dart';
import '/screens/base/base_view_model.dart';

class ConfirmationUserRegisterProvider extends BaseViewModel {
  final RegistrationData _registrationData;

  ConfirmationUserRegisterProvider(super.context, this._registrationData)
      : _gender = Gender.getGender(_registrationData.gender);

  RegistrationData get registrationData => _registrationData;

  Gender _gender;

  Gender get gender => _gender;

  set gender(Gender value) {
    _gender = value;
    _registrationData.gender = _gender.value;
    notifyListeners();
  }

  void registration() async {
    /*progressDialog.show();
    (await repository.userRegistration(_registrationData)).fold(
      (Failure failure) {
        progressDialog.dismiss();
        dialogUtil.showFailureDialog(context, failure);
      },
      (UserRegistrationResp userRegistration) {
        progressDialog.dismiss();
        localStorage.saveOtpRefId(userRegistration.otpRefId);
        localStorage.saveUserId(userRegistration.userId);
        nativeToast.showToast(
          ToastData.success(message: 'User registered successful'),
        );
        Navigator.of(context).pushReplacementNamed(
          Routes.pinRegisterScreen,
          arguments: userRegistration,
        );
      },
    );*/

//delete
    Navigator.of(context).pushReplacementNamed(
      Routes.pinRegisterScreen,
      arguments: UserRegistrationResp(userId: 'khudsjah', otpRefId: 'sdfkskjfhskjh'),
    );
  }
}
