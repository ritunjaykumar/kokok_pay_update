import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_dto.g.dart';

@JsonSerializable()
class MobileVerifyReqDto {
  @JsonKey(name: 'otpRefId')
  String otpRefId;
  @JsonKey(name: 'otp')
  String otp;
  @JsonKey(name: 'deviceLanguage')
  String language;
  @JsonKey(name: 'playerId')
  String playerId;
  @JsonKey(name: 'modelNo')
  String modelNo;
  @JsonKey(name: 'appVersion')
  String appVersion;
  @JsonKey(name: 'deviceVersion')
  String deviceVersion;
  @JsonKey(name: 'platForm')
  String platform;

  MobileVerifyReqDto(
    this.otpRefId,
    this.otp,
    this.language,
    this.playerId,
    this.modelNo,
    this.appVersion,
    this.deviceVersion,
    this.platform,
  );

  factory MobileVerifyReqDto.fromJson(Map<String, dynamic> json) =>
      _$MobileVerifyReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MobileVerifyReqDtoToJson(this);
}

///{"otpRefId":"202302152008079657","regOption":"MANUAL","firstName":"RituG",
///"lastName":"kumar","gender":"MALE","email":"rituG@gmail.com","address":"Mountain View,94043",
///"nationality":"United States","district":"Chennai","province":"California","dob":"17/05/1996"}"

//

@JsonSerializable()
class UserRegistrationReqDto {
  @JsonKey(name: 'otpRefId')
  String otpRef;
  @JsonKey(name: 'regOption')
  String regOption;
  @JsonKey(name: 'firstName')
  String firstName;
  @JsonKey(name: 'lastName')
  String lastName;
  @JsonKey(name: 'gender')
  String gender;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'address')
  String address;
  @JsonKey(name: 'nationality')
  String nationality;
  @JsonKey(name: 'district')
  String district;
  @JsonKey(name: 'province')
  String province;
  @JsonKey(name: 'dob')
  String dob;

  UserRegistrationReqDto(this.otpRef, this.regOption, this.firstName, this.lastName, this.gender,
      this.email, this.address, this.nationality, this.district, this.province, this.dob);

  factory UserRegistrationReqDto.fromJson(Map<String, dynamic> json) =>
      _$UserRegistrationReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegistrationReqDtoToJson(this);
}

///
@JsonSerializable()
class NewPinReqDto {
  @JsonKey(name: 'userId')
  String userId;
  @JsonKey(name: 'mpin')
  String mpin;

  NewPinReqDto(this.userId, this.mpin);

  factory NewPinReqDto.fromJson(Map<String, dynamic> json) => _$NewPinReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NewPinReqDtoToJson(this);
}

///
@JsonSerializable()
class LoginReqDto {
  @JsonKey(name: 'loginType')
  String loginType;
  @JsonKey(name: 'mpin')
  String mpin;
  @JsonKey(name: 'loginKey')
  String salt;

  LoginReqDto(this.loginType, this.mpin, this.salt);

  factory LoginReqDto.fromJson(Map<String, dynamic> json) => _$LoginReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginReqDtoToJson(this);
}

////
@JsonSerializable()
class ResetMpinReqDto {
  @JsonKey(name: 'otpRefId')
  String otpRefId;
  @JsonKey(name: 'otp')
  String otp;
  @JsonKey(name: 'securityType')
  String securityType;
  @JsonKey(name: 'mpin')
  String mpin;

  ResetMpinReqDto(this.otpRefId, this.otp, this.securityType, this.mpin);

  factory ResetMpinReqDto.fromJson(Map<String, dynamic> json) => _$ResetMpinReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResetMpinReqDtoToJson(this);
}

//

@JsonSerializable()
class QrReqDto {
  @JsonKey(name: 'txnAmount')
  String? amount;
  @JsonKey(name: 'txnCurrency')
  String? currency;
  @JsonKey(name: 'purposeOfTxn')
  String? purpose;
  @JsonKey(name: 'qrFor')
  String? qrFor;
  @JsonKey(name: 'city')
  String? city;
  @JsonKey(name: 'mobileNumber')
  String? mobileNumber;


  QrReqDto(this.amount, this.currency, this.purpose, this.qrFor, this.city, this.mobileNumber);

  factory QrReqDto.fromJson(Map<String, dynamic> json) => _$QrReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QrReqDtoToJson(this);
}
