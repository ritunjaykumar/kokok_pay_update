// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MobileVerifyReqDto _$MobileVerifyReqDtoFromJson(Map<String, dynamic> json) =>
    MobileVerifyReqDto(
      json['otpRefId'] as String,
      json['otp'] as String,
      json['deviceLanguage'] as String,
      json['playerId'] as String,
      json['modelNo'] as String,
      json['appVersion'] as String,
      json['deviceVersion'] as String,
      json['platForm'] as String,
    );

Map<String, dynamic> _$MobileVerifyReqDtoToJson(MobileVerifyReqDto instance) =>
    <String, dynamic>{
      'otpRefId': instance.otpRefId,
      'otp': instance.otp,
      'deviceLanguage': instance.language,
      'playerId': instance.playerId,
      'modelNo': instance.modelNo,
      'appVersion': instance.appVersion,
      'deviceVersion': instance.deviceVersion,
      'platForm': instance.platform,
    };

UserRegistrationReqDto _$UserRegistrationReqDtoFromJson(
        Map<String, dynamic> json) =>
    UserRegistrationReqDto(
      json['otpRefId'] as String,
      json['regOption'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['gender'] as String,
      json['email'] as String,
      json['address'] as String,
      json['nationality'] as String,
      json['district'] as String,
      json['province'] as String,
      json['dob'] as String,
    );

Map<String, dynamic> _$UserRegistrationReqDtoToJson(
        UserRegistrationReqDto instance) =>
    <String, dynamic>{
      'otpRefId': instance.otpRef,
      'regOption': instance.regOption,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'email': instance.email,
      'address': instance.address,
      'nationality': instance.nationality,
      'district': instance.district,
      'province': instance.province,
      'dob': instance.dob,
    };

NewPinReqDto _$NewPinReqDtoFromJson(Map<String, dynamic> json) => NewPinReqDto(
      json['userId'] as String,
      json['mpin'] as String,
    );

Map<String, dynamic> _$NewPinReqDtoToJson(NewPinReqDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'mpin': instance.mpin,
    };

LoginReqDto _$LoginReqDtoFromJson(Map<String, dynamic> json) => LoginReqDto(
      json['loginType'] as String,
      json['mpin'] as String,
      json['loginKey'] as String,
    );

Map<String, dynamic> _$LoginReqDtoToJson(LoginReqDto instance) =>
    <String, dynamic>{
      'loginType': instance.loginType,
      'mpin': instance.mpin,
      'loginKey': instance.salt,
    };

ResetMpinReqDto _$ResetMpinReqDtoFromJson(Map<String, dynamic> json) =>
    ResetMpinReqDto(
      json['otpRefId'] as String,
      json['otp'] as String,
      json['securityType'] as String,
      json['mpin'] as String,
    );

Map<String, dynamic> _$ResetMpinReqDtoToJson(ResetMpinReqDto instance) =>
    <String, dynamic>{
      'otpRefId': instance.otpRefId,
      'otp': instance.otp,
      'securityType': instance.securityType,
      'mpin': instance.mpin,
    };

QrReqDto _$QrReqDtoFromJson(Map<String, dynamic> json) => QrReqDto(
      json['txnAmount'] as String?,
      json['txnCurrency'] as String?,
      json['purposeOfTxn'] as String?,
      json['qrFor'] as String?,
      json['city'] as String?,
      json['mobileNumber'] as String?,
    );

Map<String, dynamic> _$QrReqDtoToJson(QrReqDto instance) => <String, dynamic>{
      'txnAmount': instance.amount,
      'txnCurrency': instance.currency,
      'purposeOfTxn': instance.purpose,
      'qrFor': instance.qrFor,
      'city': instance.city,
      'mobileNumber': instance.mobileNumber,
    };
