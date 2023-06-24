import 'package:json_annotation/json_annotation.dart';

part 'response_dto.g.dart';

@JsonSerializable()
class BaseDto {
  @JsonKey(name: "respStatus")
  String? respStatus;
  @JsonKey(name: "respCode")
  String? respCode;
  @JsonKey(name: "reason")
  String? reason;
  @JsonKey(name: "alertMessage")
  String? alert;
}

@JsonSerializable()
class MobileValidateRespDto extends BaseDto {
  @JsonKey(name: 'responseObj')
  MobileValidateRespData? data;

  MobileValidateRespDto(this.data);

  factory MobileValidateRespDto.fromJson(Map<String, dynamic> json) {
    return _$MobileValidateRespDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MobileValidateRespDtoToJson(this);
}

@JsonSerializable()
class MobileValidateRespData {
  String? otpRefId;
  String? otpFor;
  String? status;

  MobileValidateRespData(this.otpRefId, this.otpFor, this.status);

  factory MobileValidateRespData.fromJson(Map<String, dynamic> json) {
    return _$MobileValidateRespDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MobileValidateRespDataToJson(this);
}

//===========================================

@JsonSerializable()
class AppStatusRespDto extends BaseDto {
  @JsonKey(name: 'responseObj')
  AppStatusRespData? data;

  AppStatusRespDto(this.data);

  factory AppStatusRespDto.fromJson(Map<String, dynamic> json) => _$AppStatusRespDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AppStatusRespDtoToJson(this);
}

@JsonSerializable()
class AppStatusRespData {
  String? status;
  String? alert;

  AppStatusRespData(this.status, this.alert);

  factory AppStatusRespData.fromJson(Map<String, dynamic> json) =>
      _$AppStatusRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$AppStatusRespDataToJson(this);
}

//=====================================================================

@JsonSerializable()
class MobileVerifyRespDto extends BaseDto {
  @JsonKey(name: 'responseObj')
  MobileVerifyRespData? data;

  MobileVerifyRespDto(this.data);

  factory MobileVerifyRespDto.fromJson(Map<String, dynamic> json) =>
      _$MobileVerifyRespDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MobileVerifyRespDtoToJson(this);
}

@JsonSerializable()
class MobileVerifyRespData {
  @JsonKey(name: 'otpRefId')
  String? otpRefId;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'appVersion')
  String? appVersion;
  @JsonKey(name: 'modelNo')
  String? model;
  @JsonKey(name: 'deviceVersion')
  String? version;
  @JsonKey(name: 'platForm')
  String? platform;
  @JsonKey(name: 'deviceLanguage')
  String? language;
  @JsonKey(name: 'playerId')
  String? playerId;
  @JsonKey(name: 'userId')
  String? userId;

  MobileVerifyRespData(this.otpRefId, this.status, this.appVersion, this.model, this.version,
      this.platform, this.language, this.playerId, this.userId);

  factory MobileVerifyRespData.fromJson(Map<String, dynamic> json) =>
      _$MobileVerifyRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$MobileVerifyRespDataToJson(this);
}

//===========================================

@JsonSerializable()
class UserRegistrationValRespDto extends BaseDto {
  @JsonKey(name: 'responseObj')
  UserRegistrationValRespData? data;

  UserRegistrationValRespDto(this.data);

  factory UserRegistrationValRespDto.fromJson(Map<String, dynamic> json) =>
      _$UserRegistrationValRespDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegistrationValRespDtoToJson(this);
}

@JsonSerializable()
class UserRegistrationValRespData {
  @JsonKey(name: 'otpRefId')
  String? otpRef;
  @JsonKey(name: 'regOption')
  String? regOption;
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'nationality')
  String? nationality;
  @JsonKey(name: 'district')
  String? district;
  @JsonKey(name: 'province')
  String? province;
  @JsonKey(name: 'dob')
  String? dob;

  UserRegistrationValRespData(
      this.otpRef,
      this.regOption,
      this.firstName,
      this.lastName,
      this.gender,
      this.email,
      this.address,
      this.nationality,
      this.district,
      this.province,
      this.dob);

  factory UserRegistrationValRespData.fromJson(Map<String, dynamic> json) =>
      _$UserRegistrationValRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegistrationValRespDataToJson(this);
}

/////

@JsonSerializable()
class UserRegisterRespDto extends BaseDto {
  @JsonKey(name: 'responseObj')
  UserRegisterRespData? data;

  UserRegisterRespDto(this.data);

  factory UserRegisterRespDto.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterRespDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterRespDtoToJson(this);
}

@JsonSerializable()
class UserRegisterRespData {
  @JsonKey(name: 'otpRefId')
  String? otpRefId;
  @JsonKey(name: 'userId')
  String? userId;

  UserRegisterRespData(this.otpRefId, this.userId);

  factory UserRegisterRespData.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterRespDataToJson(this);
}

//
@JsonSerializable()
class NoResponseDto extends BaseDto {
  factory NoResponseDto.fromJson(Map<String, dynamic> json) => _$NoResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NoResponseDtoToJson(this);

  NoResponseDto();
}

///
@JsonSerializable()
class LoginResDto extends BaseDto {
  @JsonKey(name: 'responseObj')
  LoginResData? data;

  LoginResDto(this.data);

  factory LoginResDto.fromJson(Map<String, dynamic> json) => _$LoginResDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResDtoToJson(this);
}

@JsonSerializable()
class LoginResData {
  @JsonKey(name: 'loginType')
  String? loginType;
  @JsonKey(name: 'mobile')
  String? mobileNumber;
  @JsonKey(name: 'loginTime')
  String? loginTime;
  @JsonKey(name: 'userId')
  String? userId;
  @JsonKey(name: 'loginToken')
  String? loginToken;
  @JsonKey(name: 'name')
  String? fullName;
  @JsonKey(name: 'userType')
  String? userType;
  @JsonKey(name: 'kycStatus')
  String? kycStatus;
  @JsonKey(name: 'profileId')
  String? profileId;

  LoginResData(this.loginType, this.mobileNumber, this.loginTime, this.userId, this.loginToken,
      this.fullName, this.userType, this.kycStatus, this.profileId);

  factory LoginResData.fromJson(Map<String, dynamic> json) => _$LoginResDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResDataToJson(this);
}

//
@JsonSerializable()
class OtpResDto extends BaseDto {
  @JsonKey(name: 'responseObj')
  OtpResData? data;

  OtpResDto(this.data);

  factory OtpResDto.fromJson(Map<String, dynamic> json) => _$OtpResDtoFromJson(json);

  Map<String, dynamic> ToJson() => _$OtpResDtoToJson(this);
}

@JsonSerializable()
class OtpResData {
  @JsonKey(name: 'securityType')
  String? securityType;
  @JsonKey(name: 'otpRefId')
  String? otpRefId;
  @JsonKey(name: 'otpFlag')
  String? otpFlag;

  OtpResData(this.securityType, this.otpRefId, this.otpFlag);

  factory OtpResData.fromJson(Map<String, dynamic> json) => _$OtpResDataFromJson(json);

  Map<String, dynamic> toJson() => _$OtpResDataToJson(this);
}

//

@JsonSerializable()
class ResetMpinRespDto extends BaseDto {
  ResetMpinRespDto();

  factory ResetMpinRespDto.fromJson(Map<String, dynamic> json) => _$ResetMpinRespDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResetMpinRespDtoToJson(this);
}

//

@JsonSerializable()
class WalletBalanceRespDto extends BaseDto {
  @JsonKey(name: 'jsonObject')
  WalletBalanceRespData? data;

  WalletBalanceRespDto(this.data);

  factory WalletBalanceRespDto.fromJson(Map<String, dynamic> json) =>
      _$WalletBalanceRespDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WalletBalanceRespDtoToJson(this);
}

@JsonSerializable()
class WalletBalanceRespData {
  @JsonKey(name: 'walletBalance')
  String? wBalance;
  @JsonKey(name: 'walletCurrency')
  String? wCurrency;

  WalletBalanceRespData(this.wBalance, this.wCurrency);

  factory WalletBalanceRespData.fromJson(Map<String, dynamic> json) =>
      _$WalletBalanceRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$WalletBalanceRespDataToJson(this);
}

//

@JsonSerializable()
class StatementRespDto extends BaseDto {
  @JsonKey(name: 'responseObj')
  List<StatementRespData>? data;

  StatementRespDto(this.data);

  factory StatementRespDto.fromJson(Map<String, dynamic> json) => _$StatementRespDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StatementRespDtoToJson(this);
}

@JsonSerializable()
class StatementRespData {
  @JsonKey(name: 'txnAmount')
  String? amount;
  @JsonKey(name: 'txnCurrency')
  String? currency;
  @JsonKey(name: 'txnDesc')
  String? desc;
  @JsonKey(name: 'txnMode')
  String? mode;
  @JsonKey(name: 'txnStatus')
  String? status;
  @JsonKey(name: 'txnDate')
  String? date;
  @JsonKey(name: 'txnRefId')
  String? refId;
  @JsonKey(name: 'billRefId')
  String? billRefId;
  @JsonKey(name: 'remarks')
  String? remarks;
  @JsonKey(name: 'txnBalance')
  String? txnBalance;

  StatementRespData(this.amount, this.currency, this.desc, this.mode, this.status, this.date,
      this.refId, this.billRefId, this.remarks, this.txnBalance);

  factory StatementRespData.fromJson(Map<String, dynamic> json) =>
      _$StatementRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$StatementRespDataToJson(this);
}

//recent transaction

@JsonSerializable()
class RecentTxnRespDto extends BaseDto {
  @JsonKey(name: 'responseObj')
  List<RecentTxnRespData>? data;

  RecentTxnRespDto(this.data);

  factory RecentTxnRespDto.fromJson(Map<String, dynamic> json) => _$RecentTxnRespDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RecentTxnRespDtoToJson(this);
}

@JsonSerializable()
class RecentTxnRespData {
  @JsonKey(name: 'tokenId')
  String? tokenId;
  @JsonKey(name: 'txnAmount')
  String? amount;
  @JsonKey(name: 'txnBalance')
  String? balance;
  @JsonKey(name: 'txnCurrency')
  String? currency;
  @JsonKey(name: 'txnDate')
  String? date;
  @JsonKey(name: 'txnDesc')
  String? desc;
  @JsonKey(name: 'txnMode')
  String? txnMode;
  @JsonKey(name: 'txnRefId')
  String? refId;
  @JsonKey(name: 'txnStatus')
  String? status;

  RecentTxnRespData(this.tokenId, this.amount, this.balance, this.currency, this.date, this.desc,
      this.txnMode, this.refId, this.status);

  factory RecentTxnRespData.fromJson(Map<String, dynamic> json) =>
      _$RecentTxnRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$RecentTxnRespDataToJson(this);
}

//

@JsonSerializable()
class UserProfileRespDto extends BaseDto {
  @JsonKey(name: 'responseObj')
  UserProfileRespData? data;

  UserProfileRespDto(this.data);

  factory UserProfileRespDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileRespDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileRespDtoToJson(this);
}

@JsonSerializable()
class UserProfileRespData {
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'district')
  String? district;
  @JsonKey(name: 'dob')
  String? dob;
  @JsonKey(name: 'email')
  String? emailId;
  @JsonKey(name: 'fname')
  String? firstName;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'kycStatus')
  String? kycStatus;
  @JsonKey(name: 'lname')
  String? lastName;
  @JsonKey(name: 'mobile')
  String? mobile;
  @JsonKey(name: 'nationality')
  String? nationality;
  @JsonKey(name: 'userId')
  String? userId;
  @JsonKey(name: 'userType')
  String? userType;

  UserProfileRespData(
      this.address,
      this.district,
      this.dob,
      this.emailId,
      this.firstName,
      this.gender,
      this.kycStatus,
      this.lastName,
      this.mobile,
      this.nationality,
      this.userId,
      this.userType);

  factory UserProfileRespData.fromJson(Map<String, dynamic> json) =>
      _$UserProfileRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileRespDataToJson(this);
}

//

@JsonSerializable()
class QrRespDto extends BaseDto {
  @JsonKey(name: 'responseObj')
  QrRespData? data;

  QrRespDto(this.data);

  factory QrRespDto.fromJson(Map<String, dynamic> json) => _$QrRespDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QrRespDtoToJson(this);
}

@JsonSerializable()
class QrRespData {
  @JsonKey(name: 'qrString')
  String? qrString;

  QrRespData(this.qrString);

  factory QrRespData.fromJson(Map<String, dynamic> json) => _$QrRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$QrRespDataToJson(this);
}

//

@JsonSerializable()
class BankDataRespDto extends BaseDto {
  @JsonKey(name: 'responseObj')
  List<BankDataRespData?> data;

  BankDataRespDto(this.data);

  factory BankDataRespDto.fromJson(Map<String, dynamic> json) => _$BankDataRespDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BankDataRespDtoToJson(this);
}

@JsonSerializable()
class BankDataRespData {
  @JsonKey(name: 'entityIcon')
  String? icon;
  @JsonKey(name: 'entityIconUrl')
  String? url;
  @JsonKey(name: 'entityId')
  String? bankId;
  @JsonKey(name: 'entityName')
  String? name;
  @JsonKey(name: 'iosAppId')
  String? iosAppId;
  @JsonKey(name: 'iosId')
  String? iosId;
  @JsonKey(name: 'mdId')
  String? androidId;

  BankDataRespData(
      this.icon, this.url, this.bankId, this.name, this.iosAppId, this.iosId, this.androidId);

  factory BankDataRespData.fromJson(Map<String, dynamic> json) => _$BankDataRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$BankDataRespDataToJson(this);
}
