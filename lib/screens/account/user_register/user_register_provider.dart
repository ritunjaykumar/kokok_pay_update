import 'package:flutter/material.dart';

import '/models/model/error_model.dart';
import '/resources/routes_manager.dart';
import '/service/gps/gps.dart';
import '../../../exceptions/exceptions.dart';
import '../../../models/enums/enums.dart';
import '../../../models/model/models.dart';
import '../../../utils/data/state_list.dart';
import '../../../utils/util/country_list_view.dart';
import '../../base/base_view_model.dart';

class UserRegisterProvider extends BaseViewModel {
  UserRegisterProvider(super.context, this.mobileNo, this.otpRefId) {
    mobileNo = mobileNo ?? localStorage.getMobileNumber();
    otpRefId = otpRefId ?? localStorage.getOtpRefId();
    registrationData.otpRefId = otpRefId!;
    registrationData.gender = _gender.value;
  }

  final List<KeyPair<String>> stateLists = stateList;
  static const String defaultCountryName = 'Laos';
  String currentStateId = '1';
  String _currentCountryName = defaultCountryName;
  final RegistrationData registrationData = RegistrationData(otpRefId: '');

  String? mobileNo;
  String? otpRefId;
  bool _isAddress = false;

  Gender _gender = Gender.male;

  Gender get gender => _gender;

  bool get isAddress => _isAddress;

  List<String> getDistrict(String id) {
    for (Province p in districtList) {
      if (p.name == id) {
        return p.district;
      }
    }
    return [];
  }

  void showCountryBottomSheet(void Function(String) callback) {
    CountryList(context, (countryName) {
      callback(countryName);
      _currentCountryName = countryName;
    }).show();
  }

  void showStateBottomSheet(void Function(String, bool) callback) {
    StateListView(context, (value) {
      bool isClear = false;
      if (currentStateId != value.value) {
        currentStateId = value.value;
        isClear = true;
      }
      callback(value.key, isClear);
    }).show(stateLists);
  }

  void showDistrictBottomSheet(void Function(String) callback) {
    DistrictListView(context, (value) {
      callback(value);
    }).show(getDistrict(currentStateId));
  }

  bool isReadOnly() {
    return _currentCountryName == defaultCountryName;
  }

  void getCurrentLocation(void Function(CurrentLocationInfo) callback) async {
    try {
      var location = await CurrentLocationFactory().getCurrentLocationDetails(context);
      currentCountryName = location.country;
      callback(location);
    } catch (exception) {
      if (exception is PermissionException) {
        //show dialog here to open settings
      } else {
        BaseException b = exception as BaseException;
        //show error dialog here
      }
    }
  }

  void onClickNext() async {
    /*progressDialog.show();
    (await repository.userRegValidate(registrationData)).fold(
      (Failure failure) {
        progressDialog.dismiss();
        dialogUtil.showFailureDialog(context, failure);
      },
      (RegistrationData regData) {
        progressDialog.dismiss();
        regData.mobileNumber = mobileNo!;
        Navigator.of(context).pushReplacementNamed(
          Routes.confirmUserRegisterScreen,
          arguments: regData,
        );
      },
    );*/

    //delete it
    Navigator.of(context).pushReplacementNamed(
      Routes.confirmUserRegisterScreen,
      arguments: RegistrationData(
        otpRefId: 'kjhjkdhsfjsd',
        address: 'address',
        country: 'country',
        district: 'district',
        dob: '1995-02-17',
        emailId: 'ritunjay@cashlinkglobal.com',
        firstName: 'Ritunjay',
        lastName: 'Kumar',
        gender: 'MALE',
        mobileNumber: '8083816290',
        regOption: 'regOption',
        state: 'state'
      ),
    );
  }

  String get currentCountryName => _currentCountryName;

  set currentCountryName(String value) {
    _currentCountryName = value;
    notifyListeners();
  }

  set isAddress(bool value) {
    _isAddress = value;
    notifyListeners();
  }

  set gender(Gender value) {
    _gender = value;
    registrationData.gender = value.value;
    notifyListeners();
  }
}
