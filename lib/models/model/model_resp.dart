import 'package:kokok_pay/models/enums/enums.dart';

class MobileValidateResp {
  String otpRefId;
  String otpFor;
  String status;

  MobileValidateResp(this.otpRefId, this.otpFor, this.status);

  @override
  String toString() {
    return '''MobileValidateResp{otpRefId: $otpRefId, otpFor: $otpFor, status: $status}''';
  }
}

class AppStatusResp {
  String status;
  String alert;

  AppStatusResp(this.status, this.alert);
}

class MobileVerifyResp {
  String appVersion;
  String deviceLanguage;
  String deviceVersion;
  String modelNo;
  String otpRefId;
  String platform;
  String playerId;
  String status;
  String userId;

  MobileVerifyResp({
    required this.appVersion,
    required this.deviceLanguage,
    required this.deviceVersion,
    required this.modelNo,
    required this.otpRefId,
    required this.platform,
    required this.playerId,
    required this.status,
    required this.userId,
  });

  @override
  String toString() {
    return '''MobileVerifyResp{
      appVersion: $appVersion, 
      deviceLanguage: $deviceLanguage, 
      deviceVersion: $deviceVersion, 
      modelNo: $modelNo, 
      otpRefId: $otpRefId, 
      platform: $platform, 
      playerId: $playerId, 
      status: $status, 
      userId: $userId
    }''';
  }
}

class UserRegistrationResp {
  String userId;
  String otpRefId;

  UserRegistrationResp({
    required this.userId,
    required this.otpRefId,
  });

  @override
  String toString() {
    return '''UserRegistrationRes{userId: $userId, otpRefId: $otpRefId}''';
  }
}

//
class LoginRes {
  String loginType;
  String mobile;
  String loginTime;
  String userId;
  String loginToken;
  String name;
  String userType;
  String kycStatus;
  String profileId;

  LoginRes(
      {required this.loginType,
      required this.mobile,
      required this.loginTime,
      required this.userId,
      required this.loginToken,
      required this.name,
      required this.userType,
      required this.kycStatus,
      required this.profileId});

  @override
  String toString() {
    return '''LoginRes{
      loginType: $loginType, 
      mobile: $mobile, 
      loginTime: $loginTime, 
      userId: $userId, 
      loginToken: $loginToken, 
      name: $name, 
      userType: $userType, 
      kycStatus: $kycStatus, 
      profileId: $profileId
    }''';
  }
}

//
class WalletBalanceResp {
  double amount;
  int currency;

  WalletBalanceResp(this.amount, this.currency);

  @override
  String toString() {
    return 'WalletBalance{amount: $amount, currency: $currency}';
  }
}

class StatementResp {
  final double txnAmount;
  final int txnCurrency;
  final String txnDesc;
  final TxnMode txnMode;
  final String txnStatus;
  final DateTime txnDate;
  final String txnRefId;
  final String billRefId;

  StatementResp(this.txnAmount, this.txnCurrency, this.txnDesc, this.txnMode, this.txnStatus,
      this.txnDate, this.txnRefId, this.billRefId);

  @override
  String toString() {
    return '''MiniStatementResp{
      txnAmount: $txnAmount, 
      txnCurrency: $txnCurrency, 
      txnDesc: $txnDesc, 
      txnMode: $txnMode, 
      txnStatus: $txnStatus, 
      txnDate: $txnDate, 
      txnRefId: $txnRefId, 
      billRefId: $billRefId
    }''';
  }
}

//
class RecentTxnResp {
  String tokenId;
  double amount;
  double balance;
  int currency;
  DateTime date;
  String desc;
  TxnMode txnMode;
  String refId;
  String status;

  RecentTxnResp(this.tokenId, this.amount, this.balance, this.currency, this.date, this.desc,
      this.txnMode, this.refId, this.status);

  @override
  String toString() {
    return '''RecentTxnResp{
          tokenId: $tokenId, 
          amount: $amount, 
          balance: $balance, 
          currency: $currency, 
          date: $date, 
          desc: $desc, 
          txnMode: $txnMode, 
          refId: $refId, 
          status: $status
        }''';
  }
}

//
class UserProfileResp {
  String address;
  String district;
  DateTime dob;
  String email;
  String firstName;
  Gender gender;
  String kycStatus;
  String lastName;
  String mobile;
  String nationality;
  String userId;
  String userType;

  UserProfileResp(
      {required this.address,
      required this.district,
      required this.dob,
      required this.email,
      required this.firstName,
      required this.gender,
      required this.kycStatus,
      required this.lastName,
      required this.mobile,
      required this.nationality,
      required this.userId,
      required this.userType});

  @override
  String toString() {
    return '''UserProfile{
      address: $address, 
      district: $district, 
      dob: $dob, 
      email: $email, 
      firstName: $firstName, 
      gender: $gender, 
      kycStatus: $kycStatus, 
      lastName: $lastName, 
      mobile: $mobile, 
      nationality: $nationality, 
      userId: $userId, 
      userType: $userType
    }''';
  }
}

class BankDataResp {
  String icon;
  String url;
  String bankId;
  String name;
  String iosAppId;
  String iosId;
  String androidId;

  BankDataResp({
    required this.icon,
    required this.url,
    required this.bankId,
    required this.name,
    required this.iosAppId,
    required this.iosId,
    required this.androidId,
  });

  @override
  String toString() {
    return '''BankDataResp{
      icon: $icon, 
      url: $url, 
      bankId: $bankId, 
      name: $name, 
      iosAppId: $iosAppId, 
      iosId: $iosId, 
      androidId: $androidId
    }''';
  }
}
