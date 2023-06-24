enum AppLanguage {
  defaultLang('de'),
  english('en'),
  lao('lo');

  const AppLanguage(this.language);

  final String language;

  static AppLanguage getAppLanguage(String langCode) {
    for (AppLanguage appLang in AppLanguage.values) {
      if (langCode == appLang.language) {
        return appLang;
      }
    }
    return AppLanguage.defaultLang;
  }

  String? get countryCode {
    if (this == AppLanguage.lao) return 'LA';
    if (this == AppLanguage.english) return 'US';
    return null;
  }

  String get formatLanguage {
    return '$language-$countryCode';
  }
}

enum ResponseStatus {
  success('SUCCESS'),
  fail('FAIL');

  const ResponseStatus(this.status);

  final String status;
}

enum PlatformType {
  android('Android'),
  ios('IOS'),
  others('oth');

  final String type;

  const PlatformType(this.type);
}

enum Gender {
  male('MALE'),
  female('FEMALE');

  final String value;

  const Gender(this.value);

  static Gender getGender(String v) {
    for (Gender g in Gender.values) {
      if (g.value == v) {
        return g;
      }
    }
    return Gender.male;
  }
}

enum AppStatus {
  mpin('F'),
  registration('R'),
  login('A'),
  otpVerification('I'),
  blocked('B'),
  kyc('K'),
  changePin('E'),
  error('');

  const AppStatus(this.status);

  final String status;

  static AppStatus getAppStatus(String s) {
    for (AppStatus as in AppStatus.values) {
      if (as.status == s) {
        return as;
      }
    }
    return AppStatus.error;
  }
}

enum OtpFor {
  newMob('NEWMOB'),
  extMob('EXTMOB');

  const OtpFor(this.type);

  final String type;

  static OtpFor fromString(String value) {
    for (OtpFor otpFor in OtpFor.values) {
      if (otpFor.type == value) {
        return otpFor;
      }
    }
    return OtpFor.newMob;
  }
}

//
enum LoginType {
  mpin('MP'),
  biometric('FP');

  final String type;

  const LoginType(this.type);
}

enum TxnMode {
  credit('CR'),
  debit('DR'),
  unknown('UN');

  final String type;

  const TxnMode(this.type);

  String getMessage() {
    switch (this) {
      case TxnMode.credit:
        return 'CASHIN';
      case TxnMode.debit:
        return 'CASHOUT';
      case TxnMode.unknown:
        return 'Unknown';
    }
  }

  static TxnMode getTxnStatus(String status) {
    for (TxnMode txnStatus in TxnMode.values) {
      if (txnStatus.type == status) {
        return txnStatus;
      }
    }
    return TxnMode.unknown;
  }
}
