// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseDto _$BaseDtoFromJson(Map<String, dynamic> json) => BaseDto()
  ..respStatus = json['respStatus'] as String?
  ..respCode = json['respCode'] as String?
  ..reason = json['reason'] as String?
  ..alert = json['alertMessage'] as String?;

Map<String, dynamic> _$BaseDtoToJson(BaseDto instance) => <String, dynamic>{
      'respStatus': instance.respStatus,
      'respCode': instance.respCode,
      'reason': instance.reason,
      'alertMessage': instance.alert,
    };

MobileValidateRespDto _$MobileValidateRespDtoFromJson(
        Map<String, dynamic> json) =>
    MobileValidateRespDto(
      json['responseObj'] == null
          ? null
          : MobileValidateRespData.fromJson(
              json['responseObj'] as Map<String, dynamic>),
    )
      ..respStatus = json['respStatus'] as String?
      ..respCode = json['respCode'] as String?
      ..reason = json['reason'] as String?
      ..alert = json['alertMessage'] as String?;

Map<String, dynamic> _$MobileValidateRespDtoToJson(
        MobileValidateRespDto instance) =>
    <String, dynamic>{
      'respStatus': instance.respStatus,
      'respCode': instance.respCode,
      'reason': instance.reason,
      'alertMessage': instance.alert,
      'responseObj': instance.data,
    };

MobileValidateRespData _$MobileValidateRespDataFromJson(
        Map<String, dynamic> json) =>
    MobileValidateRespData(
      json['otpRefId'] as String?,
      json['otpFor'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$MobileValidateRespDataToJson(
        MobileValidateRespData instance) =>
    <String, dynamic>{
      'otpRefId': instance.otpRefId,
      'otpFor': instance.otpFor,
      'status': instance.status,
    };

AppStatusRespDto _$AppStatusRespDtoFromJson(Map<String, dynamic> json) =>
    AppStatusRespDto(
      json['responseObj'] == null
          ? null
          : AppStatusRespData.fromJson(
              json['responseObj'] as Map<String, dynamic>),
    )
      ..respStatus = json['respStatus'] as String?
      ..respCode = json['respCode'] as String?
      ..reason = json['reason'] as String?
      ..alert = json['alertMessage'] as String?;

Map<String, dynamic> _$AppStatusRespDtoToJson(AppStatusRespDto instance) =>
    <String, dynamic>{
      'respStatus': instance.respStatus,
      'respCode': instance.respCode,
      'reason': instance.reason,
      'alertMessage': instance.alert,
      'responseObj': instance.data,
    };

AppStatusRespData _$AppStatusRespDataFromJson(Map<String, dynamic> json) =>
    AppStatusRespData(
      json['status'] as String?,
      json['alert'] as String?,
    );

Map<String, dynamic> _$AppStatusRespDataToJson(AppStatusRespData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'alert': instance.alert,
    };

MobileVerifyRespDto _$MobileVerifyRespDtoFromJson(Map<String, dynamic> json) =>
    MobileVerifyRespDto(
      json['responseObj'] == null
          ? null
          : MobileVerifyRespData.fromJson(
              json['responseObj'] as Map<String, dynamic>),
    )
      ..respStatus = json['respStatus'] as String?
      ..respCode = json['respCode'] as String?
      ..reason = json['reason'] as String?
      ..alert = json['alertMessage'] as String?;

Map<String, dynamic> _$MobileVerifyRespDtoToJson(
        MobileVerifyRespDto instance) =>
    <String, dynamic>{
      'respStatus': instance.respStatus,
      'respCode': instance.respCode,
      'reason': instance.reason,
      'alertMessage': instance.alert,
      'responseObj': instance.data,
    };

MobileVerifyRespData _$MobileVerifyRespDataFromJson(
        Map<String, dynamic> json) =>
    MobileVerifyRespData(
      json['otpRefId'] as String?,
      json['status'] as String?,
      json['appVersion'] as String?,
      json['modelNo'] as String?,
      json['deviceVersion'] as String?,
      json['platForm'] as String?,
      json['deviceLanguage'] as String?,
      json['playerId'] as String?,
      json['userId'] as String?,
    );

Map<String, dynamic> _$MobileVerifyRespDataToJson(
        MobileVerifyRespData instance) =>
    <String, dynamic>{
      'otpRefId': instance.otpRefId,
      'status': instance.status,
      'appVersion': instance.appVersion,
      'modelNo': instance.model,
      'deviceVersion': instance.version,
      'platForm': instance.platform,
      'deviceLanguage': instance.language,
      'playerId': instance.playerId,
      'userId': instance.userId,
    };

UserRegistrationValRespDto _$UserRegistrationValRespDtoFromJson(
        Map<String, dynamic> json) =>
    UserRegistrationValRespDto(
      json['responseObj'] == null
          ? null
          : UserRegistrationValRespData.fromJson(
              json['responseObj'] as Map<String, dynamic>),
    )
      ..respStatus = json['respStatus'] as String?
      ..respCode = json['respCode'] as String?
      ..reason = json['reason'] as String?
      ..alert = json['alertMessage'] as String?;

Map<String, dynamic> _$UserRegistrationValRespDtoToJson(
        UserRegistrationValRespDto instance) =>
    <String, dynamic>{
      'respStatus': instance.respStatus,
      'respCode': instance.respCode,
      'reason': instance.reason,
      'alertMessage': instance.alert,
      'responseObj': instance.data,
    };

UserRegistrationValRespData _$UserRegistrationValRespDataFromJson(
        Map<String, dynamic> json) =>
    UserRegistrationValRespData(
      json['otpRefId'] as String?,
      json['regOption'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['gender'] as String?,
      json['email'] as String?,
      json['address'] as String?,
      json['nationality'] as String?,
      json['district'] as String?,
      json['province'] as String?,
      json['dob'] as String?,
    );

Map<String, dynamic> _$UserRegistrationValRespDataToJson(
        UserRegistrationValRespData instance) =>
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

UserRegisterRespDto _$UserRegisterRespDtoFromJson(Map<String, dynamic> json) =>
    UserRegisterRespDto(
      json['responseObj'] == null
          ? null
          : UserRegisterRespData.fromJson(
              json['responseObj'] as Map<String, dynamic>),
    )
      ..respStatus = json['respStatus'] as String?
      ..respCode = json['respCode'] as String?
      ..reason = json['reason'] as String?
      ..alert = json['alertMessage'] as String?;

Map<String, dynamic> _$UserRegisterRespDtoToJson(
        UserRegisterRespDto instance) =>
    <String, dynamic>{
      'respStatus': instance.respStatus,
      'respCode': instance.respCode,
      'reason': instance.reason,
      'alertMessage': instance.alert,
      'responseObj': instance.data,
    };

UserRegisterRespData _$UserRegisterRespDataFromJson(
        Map<String, dynamic> json) =>
    UserRegisterRespData(
      json['otpRefId'] as String?,
      json['userId'] as String?,
    );

Map<String, dynamic> _$UserRegisterRespDataToJson(
        UserRegisterRespData instance) =>
    <String, dynamic>{
      'otpRefId': instance.otpRefId,
      'userId': instance.userId,
    };

NoResponseDto _$NoResponseDtoFromJson(Map<String, dynamic> json) =>
    NoResponseDto()
      ..respStatus = json['respStatus'] as String?
      ..respCode = json['respCode'] as String?
      ..reason = json['reason'] as String?
      ..alert = json['alertMessage'] as String?;

Map<String, dynamic> _$NoResponseDtoToJson(NoResponseDto instance) =>
    <String, dynamic>{
      'respStatus': instance.respStatus,
      'respCode': instance.respCode,
      'reason': instance.reason,
      'alertMessage': instance.alert,
    };

LoginResDto _$LoginResDtoFromJson(Map<String, dynamic> json) => LoginResDto(
      json['responseObj'] == null
          ? null
          : LoginResData.fromJson(json['responseObj'] as Map<String, dynamic>),
    )
      ..respStatus = json['respStatus'] as String?
      ..respCode = json['respCode'] as String?
      ..reason = json['reason'] as String?
      ..alert = json['alertMessage'] as String?;

Map<String, dynamic> _$LoginResDtoToJson(LoginResDto instance) =>
    <String, dynamic>{
      'respStatus': instance.respStatus,
      'respCode': instance.respCode,
      'reason': instance.reason,
      'alertMessage': instance.alert,
      'responseObj': instance.data,
    };

LoginResData _$LoginResDataFromJson(Map<String, dynamic> json) => LoginResData(
      json['loginType'] as String?,
      json['mobile'] as String?,
      json['loginTime'] as String?,
      json['userId'] as String?,
      json['loginToken'] as String?,
      json['name'] as String?,
      json['userType'] as String?,
      json['kycStatus'] as String?,
      json['profileId'] as String?,
    );

Map<String, dynamic> _$LoginResDataToJson(LoginResData instance) =>
    <String, dynamic>{
      'loginType': instance.loginType,
      'mobile': instance.mobileNumber,
      'loginTime': instance.loginTime,
      'userId': instance.userId,
      'loginToken': instance.loginToken,
      'name': instance.fullName,
      'userType': instance.userType,
      'kycStatus': instance.kycStatus,
      'profileId': instance.profileId,
    };

OtpResDto _$OtpResDtoFromJson(Map<String, dynamic> json) => OtpResDto(
      json['responseObj'] == null
          ? null
          : OtpResData.fromJson(json['responseObj'] as Map<String, dynamic>),
    )
      ..respStatus = json['respStatus'] as String?
      ..respCode = json['respCode'] as String?
      ..reason = json['reason'] as String?
      ..alert = json['alertMessage'] as String?;

Map<String, dynamic> _$OtpResDtoToJson(OtpResDto instance) => <String, dynamic>{
      'respStatus': instance.respStatus,
      'respCode': instance.respCode,
      'reason': instance.reason,
      'alertMessage': instance.alert,
      'responseObj': instance.data,
    };

OtpResData _$OtpResDataFromJson(Map<String, dynamic> json) => OtpResData(
      json['securityType'] as String?,
      json['otpRefId'] as String?,
      json['otpFlag'] as String?,
    );

Map<String, dynamic> _$OtpResDataToJson(OtpResData instance) =>
    <String, dynamic>{
      'securityType': instance.securityType,
      'otpRefId': instance.otpRefId,
      'otpFlag': instance.otpFlag,
    };

ResetMpinRespDto _$ResetMpinRespDtoFromJson(Map<String, dynamic> json) =>
    ResetMpinRespDto()
      ..respStatus = json['respStatus'] as String?
      ..respCode = json['respCode'] as String?
      ..reason = json['reason'] as String?
      ..alert = json['alertMessage'] as String?;

Map<String, dynamic> _$ResetMpinRespDtoToJson(ResetMpinRespDto instance) =>
    <String, dynamic>{
      'respStatus': instance.respStatus,
      'respCode': instance.respCode,
      'reason': instance.reason,
      'alertMessage': instance.alert,
    };

WalletBalanceRespDto _$WalletBalanceRespDtoFromJson(
        Map<String, dynamic> json) =>
    WalletBalanceRespDto(
      json['jsonObject'] == null
          ? null
          : WalletBalanceRespData.fromJson(
              json['jsonObject'] as Map<String, dynamic>),
    )
      ..respStatus = json['respStatus'] as String?
      ..respCode = json['respCode'] as String?
      ..reason = json['reason'] as String?
      ..alert = json['alertMessage'] as String?;

Map<String, dynamic> _$WalletBalanceRespDtoToJson(
        WalletBalanceRespDto instance) =>
    <String, dynamic>{
      'respStatus': instance.respStatus,
      'respCode': instance.respCode,
      'reason': instance.reason,
      'alertMessage': instance.alert,
      'jsonObject': instance.data,
    };

WalletBalanceRespData _$WalletBalanceRespDataFromJson(
        Map<String, dynamic> json) =>
    WalletBalanceRespData(
      json['walletBalance'] as String?,
      json['walletCurrency'] as String?,
    );

Map<String, dynamic> _$WalletBalanceRespDataToJson(
        WalletBalanceRespData instance) =>
    <String, dynamic>{
      'walletBalance': instance.wBalance,
      'walletCurrency': instance.wCurrency,
    };

StatementRespDto _$StatementRespDtoFromJson(Map<String, dynamic> json) =>
    StatementRespDto(
      (json['responseObj'] as List<dynamic>?)
          ?.map((e) => StatementRespData.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..respStatus = json['respStatus'] as String?
      ..respCode = json['respCode'] as String?
      ..reason = json['reason'] as String?
      ..alert = json['alertMessage'] as String?;

Map<String, dynamic> _$StatementRespDtoToJson(StatementRespDto instance) =>
    <String, dynamic>{
      'respStatus': instance.respStatus,
      'respCode': instance.respCode,
      'reason': instance.reason,
      'alertMessage': instance.alert,
      'responseObj': instance.data,
    };

StatementRespData _$StatementRespDataFromJson(Map<String, dynamic> json) =>
    StatementRespData(
      json['txnAmount'] as String?,
      json['txnCurrency'] as String?,
      json['txnDesc'] as String?,
      json['txnMode'] as String?,
      json['txnStatus'] as String?,
      json['txnDate'] as String?,
      json['txnRefId'] as String?,
      json['billRefId'] as String?,
      json['remarks'] as String?,
      json['txnBalance'] as String?,
    );

Map<String, dynamic> _$StatementRespDataToJson(StatementRespData instance) =>
    <String, dynamic>{
      'txnAmount': instance.amount,
      'txnCurrency': instance.currency,
      'txnDesc': instance.desc,
      'txnMode': instance.mode,
      'txnStatus': instance.status,
      'txnDate': instance.date,
      'txnRefId': instance.refId,
      'billRefId': instance.billRefId,
      'remarks': instance.remarks,
      'txnBalance': instance.txnBalance,
    };

RecentTxnRespDto _$RecentTxnRespDtoFromJson(Map<String, dynamic> json) =>
    RecentTxnRespDto(
      (json['responseObj'] as List<dynamic>?)
          ?.map((e) => RecentTxnRespData.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..respStatus = json['respStatus'] as String?
      ..respCode = json['respCode'] as String?
      ..reason = json['reason'] as String?
      ..alert = json['alertMessage'] as String?;

Map<String, dynamic> _$RecentTxnRespDtoToJson(RecentTxnRespDto instance) =>
    <String, dynamic>{
      'respStatus': instance.respStatus,
      'respCode': instance.respCode,
      'reason': instance.reason,
      'alertMessage': instance.alert,
      'responseObj': instance.data,
    };

RecentTxnRespData _$RecentTxnRespDataFromJson(Map<String, dynamic> json) =>
    RecentTxnRespData(
      json['tokenId'] as String?,
      json['txnAmount'] as String?,
      json['txnBalance'] as String?,
      json['txnCurrency'] as String?,
      json['txnDate'] as String?,
      json['txnDesc'] as String?,
      json['txnMode'] as String?,
      json['txnRefId'] as String?,
      json['txnStatus'] as String?,
    );

Map<String, dynamic> _$RecentTxnRespDataToJson(RecentTxnRespData instance) =>
    <String, dynamic>{
      'tokenId': instance.tokenId,
      'txnAmount': instance.amount,
      'txnBalance': instance.balance,
      'txnCurrency': instance.currency,
      'txnDate': instance.date,
      'txnDesc': instance.desc,
      'txnMode': instance.txnMode,
      'txnRefId': instance.refId,
      'txnStatus': instance.status,
    };

UserProfileRespDto _$UserProfileRespDtoFromJson(Map<String, dynamic> json) =>
    UserProfileRespDto(
      json['responseObj'] == null
          ? null
          : UserProfileRespData.fromJson(
              json['responseObj'] as Map<String, dynamic>),
    )
      ..respStatus = json['respStatus'] as String?
      ..respCode = json['respCode'] as String?
      ..reason = json['reason'] as String?
      ..alert = json['alertMessage'] as String?;

Map<String, dynamic> _$UserProfileRespDtoToJson(UserProfileRespDto instance) =>
    <String, dynamic>{
      'respStatus': instance.respStatus,
      'respCode': instance.respCode,
      'reason': instance.reason,
      'alertMessage': instance.alert,
      'responseObj': instance.data,
    };

UserProfileRespData _$UserProfileRespDataFromJson(Map<String, dynamic> json) =>
    UserProfileRespData(
      json['address'] as String?,
      json['district'] as String?,
      json['dob'] as String?,
      json['email'] as String?,
      json['fname'] as String?,
      json['gender'] as String?,
      json['kycStatus'] as String?,
      json['lname'] as String?,
      json['mobile'] as String?,
      json['nationality'] as String?,
      json['userId'] as String?,
      json['userType'] as String?,
    );

Map<String, dynamic> _$UserProfileRespDataToJson(
        UserProfileRespData instance) =>
    <String, dynamic>{
      'address': instance.address,
      'district': instance.district,
      'dob': instance.dob,
      'email': instance.emailId,
      'fname': instance.firstName,
      'gender': instance.gender,
      'kycStatus': instance.kycStatus,
      'lname': instance.lastName,
      'mobile': instance.mobile,
      'nationality': instance.nationality,
      'userId': instance.userId,
      'userType': instance.userType,
    };

QrRespDto _$QrRespDtoFromJson(Map<String, dynamic> json) => QrRespDto(
      json['responseObj'] == null
          ? null
          : QrRespData.fromJson(json['responseObj'] as Map<String, dynamic>),
    )
      ..respStatus = json['respStatus'] as String?
      ..respCode = json['respCode'] as String?
      ..reason = json['reason'] as String?
      ..alert = json['alertMessage'] as String?;

Map<String, dynamic> _$QrRespDtoToJson(QrRespDto instance) => <String, dynamic>{
      'respStatus': instance.respStatus,
      'respCode': instance.respCode,
      'reason': instance.reason,
      'alertMessage': instance.alert,
      'responseObj': instance.data,
    };

QrRespData _$QrRespDataFromJson(Map<String, dynamic> json) => QrRespData(
      json['qrString'] as String?,
    );

Map<String, dynamic> _$QrRespDataToJson(QrRespData instance) =>
    <String, dynamic>{
      'qrString': instance.qrString,
    };

BankDataRespDto _$BankDataRespDtoFromJson(Map<String, dynamic> json) =>
    BankDataRespDto(
      (json['responseObj'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : BankDataRespData.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..respStatus = json['respStatus'] as String?
      ..respCode = json['respCode'] as String?
      ..reason = json['reason'] as String?
      ..alert = json['alertMessage'] as String?;

Map<String, dynamic> _$BankDataRespDtoToJson(BankDataRespDto instance) =>
    <String, dynamic>{
      'respStatus': instance.respStatus,
      'respCode': instance.respCode,
      'reason': instance.reason,
      'alertMessage': instance.alert,
      'responseObj': instance.data,
    };

BankDataRespData _$BankDataRespDataFromJson(Map<String, dynamic> json) =>
    BankDataRespData(
      json['entityIcon'] as String?,
      json['entityIconUrl'] as String?,
      json['entityId'] as String?,
      json['entityName'] as String?,
      json['iosAppId'] as String?,
      json['iosId'] as String?,
      json['mdId'] as String?,
    );

Map<String, dynamic> _$BankDataRespDataToJson(BankDataRespData instance) =>
    <String, dynamic>{
      'entityIcon': instance.icon,
      'entityIconUrl': instance.url,
      'entityId': instance.bankId,
      'entityName': instance.name,
      'iosAppId': instance.iosAppId,
      'iosId': instance.iosId,
      'mdId': instance.androidId,
    };
