import 'package:kokok_pay/application/application.dart';
import 'package:kokok_pay/models/enums/enums.dart';
import 'package:kokok_pay/models/model/models.dart';

import '/utils/extensions/string_extension.dart';
import '../model/model_resp.dart';
import '../response/response_dto.dart';

extension MobileValidateRespDtoMapper on MobileValidateRespDto {
  MobileValidateResp toData() {
    MobileValidateResp mobResp;
    MobileValidateRespData? mvrd = data;
    if (mvrd != null) {
      mobResp = MobileValidateResp(
        mvrd.otpRefId.notNull(),
        mvrd.otpFor.notNull(),
        mvrd.otpFor.notNull(),
      );
    } else {
      mobResp = MobileValidateResp('', '', '');
    }
    return mobResp;
  }
}

extension AppStatusRespDtoMapper on AppStatusRespDto {
  AppStatusResp toData() {
    AppStatusResp appStatus;
    AppStatusRespData? asrd = data;
    if (asrd != null) {
      appStatus = AppStatusResp(asrd.status.notNull(), alert.notNull());
    } else {
      appStatus = AppStatusResp('', '');
    }
    return appStatus;
  }
}

extension MobileVerifyRespDtoMapper on MobileVerifyRespDto {
  MobileVerifyResp toData() {
    MobileVerifyResp mobileVerifyResp;
    MobileVerifyRespData? mvrd = data;
    if (mvrd != null) {
      mobileVerifyResp = MobileVerifyResp(
        appVersion: mvrd.appVersion.notNull(),
        status: mvrd.status.notNull(),
        deviceVersion: mvrd.version.notNull(),
        modelNo: mvrd.model.notNull(),
        otpRefId: mvrd.otpRefId.notNull(),
        platform: mvrd.platform.notNull(),
        playerId: mvrd.playerId.notNull(),
        userId: mvrd.userId.notNull(),
        deviceLanguage: mvrd.language.notNull(),
      );
    } else {
      mobileVerifyResp = MobileVerifyResp(
        appVersion: '',
        status: '',
        deviceVersion: '',
        modelNo: '',
        otpRefId: '',
        platform: '',
        playerId: '',
        userId: '',
        deviceLanguage: '',
      );
    }
    return mobileVerifyResp;
  }
}

///
extension UserRegistrationRespDtoMapper on UserRegistrationValRespDto {
  RegistrationData toData() {
    RegistrationData registrationData;
    UserRegistrationValRespData? urrd = data;
    if (urrd != null) {
      registrationData = RegistrationData(
        otpRefId: urrd.otpRef.notNull(),
        regOption: urrd.regOption.notNull(),
        address: urrd.address.notNull(),
        country: urrd.nationality.notNull(),
        district: urrd.district.notNull(),
        dob: urrd.dob.notNull(),
        emailId: urrd.email.notNull(),
        firstName: urrd.firstName.notNull(),
        gender: urrd.gender.notNull(),
        lastName: urrd.lastName.notNull(),
        state: urrd.province.notNull(),
      );
    } else {
      registrationData = RegistrationData(otpRefId: '', regOption: '');
    }
    return registrationData;
  }
}

///
extension UserRegisterRespDtoMapper on UserRegisterRespDto {
  UserRegistrationResp toData() {
    UserRegistrationResp userRegistrationResp;
    UserRegisterRespData? urrd = data;
    if (urrd != null) {
      userRegistrationResp = UserRegistrationResp(
        userId: urrd.userId.notNull(),
        otpRefId: urrd.otpRefId.notNull(),
      );
    } else {
      userRegistrationResp = UserRegistrationResp(userId: '', otpRefId: '');
    }
    return userRegistrationResp;
  }
}

///
extension LoginRespDtoMapper on LoginResDto {
  LoginRes toData() {
    LoginRes loginRes;
    LoginResData? lrd = data;
    if (lrd != null) {
      loginRes = LoginRes(
        loginType: lrd.loginType.notNull(),
        mobile: lrd.mobileNumber.notNull(),
        loginTime: lrd.loginTime.notNull(),
        userId: lrd.userId.notNull(),
        loginToken: lrd.loginToken.notNull(),
        name: lrd.fullName.notNull(),
        userType: lrd.userType.notNull(),
        kycStatus: lrd.kycStatus.notNull(),
        profileId: lrd.profileId.notNull(),
      );
    } else {
      loginRes = LoginRes(
        loginType: '',
        mobile: '',
        loginTime: '',
        userId: '',
        loginToken: '',
        name: '',
        userType: '',
        kycStatus: '',
        profileId: '',
      );
    }
    return loginRes;
  }
}

//
extension OtpResDtoMapper on OtpResDto {
  String toData() {
    OtpResData? data = this.data;
    if (data != null) {
      return data.otpRefId.notNull();
    }
    return '';
  }
}

extension WalletBalanceRespDtoMapper on WalletBalanceRespDto {
  WalletBalanceResp toData() {
    WalletBalanceRespData? wbrd = data;
    if (wbrd != null) {
      try {
        double amount = double.parse(wbrd.wBalance ?? '0');
        int currency = int.parse(wbrd.wCurrency ?? '418');
        return WalletBalanceResp(amount, currency);
      } catch (err) {
        return WalletBalanceResp(0, 418);
      }
    } else {
      return WalletBalanceResp(0, 418);
    }
  }
}

//
extension StatementRespDtoMapper on StatementRespDto {
  List<StatementResp> toData() {
    List<StatementResp> statements = [];
    List<StatementRespData>? strd = data;
    if (strd != null) {
      for (StatementRespData srd in strd) {
        double amount = 0;
        double balance = 0;
        int currency = 0;
        try {
          amount = double.parse(srd.amount ?? '0');
        } catch (_) {}
        try {
          balance = double.parse(srd.txnBalance ?? '0');
        } catch (_) {}

        try {
          currency = int.parse(srd.currency ?? '418');
        } catch (_) {}

        DateTime dateTime = DateTime.now();

        try {
          dateTime = DateTime.parse(srd.date ?? DateTime.now().toIso8601String());
        } catch (_) {}

        statements.add(StatementResp(
            amount,
            currency,
            srd.desc.notNull(),
            TxnMode.getTxnStatus(srd.mode.notNull()),
            srd.status.notNull(),
            dateTime,
            srd.refId.notNull(),
            srd.billRefId.notNull()));
      }
    }
    return statements;
  }
}

//
extension RecentTxnRespDtoMapper on RecentTxnRespDto {
  List<RecentTxnResp> toData() {
    List<RecentTxnResp> txnResp = [];
    List<RecentTxnRespData>? rtrds = data;
    if (data != null) {
      for (RecentTxnRespData txnData in rtrds!) {
        double amount = 0;
        double balance = 0;
        int currency = 0;
        try {
          amount = double.parse(txnData.amount ?? '0');
        } catch (_) {}
        try {
          balance = double.parse(txnData.balance ?? '0');
        } catch (_) {}

        try {
          currency = int.parse(txnData.currency ?? '418');
        } catch (_) {}

        DateTime dateTime = DateTime.now();

        try {
          dateTime = DateTime.parse(txnData.date ?? DateTime.now().toIso8601String());
        } catch (_) {}

        txnResp.add(RecentTxnResp(
            txnData.tokenId.notNull(),
            amount,
            balance,
            currency,
            dateTime,
            txnData.desc.notNull(),
            TxnMode.getTxnStatus(txnData.txnMode.notNull()),
            txnData.refId.notNull(),
            txnData.status.notNull()));
      }
    }
    return txnResp;
  }
}

///
extension UserProfileRespDtoMapper on UserProfileRespDto {
  UserProfileResp toData() {
    UserProfileRespData? uprd = data;
    if (uprd != null) {
      DateTime dob;
      try {
        dob = DateTime.parse(uprd.dob.notNull());
      } catch (err) {
        dob = DateTime.now();
      }

      return UserProfileResp(
        address: uprd.address.notNull(),
        district: uprd.district.notNull(),
        dob: dob,
        email: uprd.emailId.notNull(),
        firstName: uprd.firstName.notNull(),
        gender: Gender.getGender(uprd.gender.notNull()),
        kycStatus: uprd.kycStatus.notNull(),
        lastName: uprd.lastName.notNull(),
        mobile: uprd.mobile.notNull(),
        nationality: uprd.nationality.notNull(),
        userId: uprd.userId.notNull(),
        userType: uprd.userType.notNull(),
      );
    } else {
      return UserProfileResp(
          address: '',
          district: '',
          dob: DateTime.now(),
          email: '',
          firstName: '',
          gender: Gender.male,
          kycStatus: '',
          lastName: '',
          mobile: '',
          nationality: '',
          userId: '',
          userType: '');
    }
  }
}

//
extension QrRespDtoMapper on QrRespDto {
  String toData() {
    QrRespData? qrd = data;
    if (qrd != null) {
      return qrd.qrString.notNull();
    } else {
      return '';
    }
  }
}

//
extension BankDataRespDtoMapper on BankDataRespDto {
  List<BankDataResp> toData() {
    List<BankDataRespData?> bdrd = data;
    List<BankDataResp> bankDataResps = [];
    for (BankDataRespData? d in bdrd) {
      if (d != null) {
        bankDataResps.add(BankDataResp(
          icon: d.icon.notNull(),
          url: d.url.notNull(),
          bankId: d.bankId.notNull(),
          name: d.name.notNull(),
          iosAppId: d.iosAppId.notNull(),
          iosId: d.iosId.notNull(),
          androidId: d.androidId.notNull(),
        ));
      }
    }
    return bankDataResps;
  }
}
