import 'package:flutter/cupertino.dart';
import 'package:kokok_pay/models/enums/enums.dart';

class KeyPair<T> {
  final String key;
  final T value;

  const KeyPair({
    required this.key,
    required this.value,
  });
}

class Province {
  final String name;
  final List<String> district;

  const Province(this.name, this.district);
}

class RegistrationData {
  String otpRefId;
  String mobileNumber;
  String firstName;
  String lastName;
  String emailId;
  String dob;
  String gender;
  String country;
  String state;
  String district;
  String address;
  String? regOption;

  RegistrationData({
    required this.otpRefId,
    this.mobileNumber = '',
    this.firstName = '',
    this.lastName = '',
    this.emailId = '',
    this.dob = '',
    this.gender = '',
    this.country = '',
    this.state = '',
    this.district = '',
    this.address = '',
    this.regOption,
  });
}

class YesNoDialogData {
  IconData? iconData;
  Widget? widget;
  String title;
  String subTitle;
  Color? iconColor;
  Color? titleColor;
  Color? subtitleColor;

  YesNoDialogData({
    required this.title,
    required this.subTitle,
    this.iconData,
    this.widget,
    this.iconColor,
    this.titleColor,
    this.subtitleColor,
  }) : assert((iconData == null && widget != null) || (widget == null && iconData != null));
}

class MpinData {
  String userId;
  String mpin;

  MpinData({required this.userId, required this.mpin});

  @override
  String toString() {
    return '''MpinData{
      userId: $userId,
       mpin: $mpin
    }''';
  }
}

class LoginData {
  LoginType loginType;
  String mpin;
  String loginSalt;

  LoginData([this.loginType = LoginType.mpin, this.mpin = '', this.loginSalt = '']);

  @override
  String toString() {
    return '''LoginData{
      loginType: $loginType, 
      mpin: $mpin, 
      loginSalt: $loginSalt
    }''';
  }
}

class CurrentUserDetails {
  String mobileNo;
  DateTime loginTime;
  String userId;
  String fullName;
  String userType;
  String kycStatus;
  String profileId;

  CurrentUserDetails({
    this.mobileNo = '',
    required this.loginTime,
    this.userId = '',
    this.fullName = '',
    this.userType = '',
    this.kycStatus = '',
    this.profileId = '',
  });
}
