const String _lottieDir = 'assets/lottie/';
const String _resourceDir = 'assets/resource/';
const String _imageDir = 'assets/images/';
const String _bankDir = 'assets/bank/';
const String _utilLogo = 'assets/util_logo/';

class LottieFile {
  static const String progressLottie = '${_lottieDir}progress_lottie.json';
  static const String successLottie = '${_lottieDir}success_lottie.json';
  static const String successLottie2 = '${_lottieDir}success_lottie_2.json';
  static const String successLottie3 = '${_lottieDir}success_lottie_3.json';
  static const String failedLottie = '${_lottieDir}failed_lottie.json';
  static const String errorLottie = '${_lottieDir}error_lottie.json';
  static const String networkErrorLottie = '${_lottieDir}network_error_lottie.json';
  static const String notFoundLottie = '${_lottieDir}not_found.json';
  static const String contactUs = '${_lottieDir}contact_us.json';

  LottieFile._();
}

class ResourceFile {
  ResourceFile._();

  static const String appLogo = '${_resourceDir}app_logo.png';
}

class ImagesFile {
  ImagesFile._();

  static const String bankLogo = '${_imageDir}bank_logo.png';
  static const String startLogo = '${_imageDir}app_start.png';
  static const String loginBg = '${_imageDir}login_bg.png';
  static const String forgotPassword = '${_imageDir}forgot_pass.png';
  static const String homeBackground = '${_imageDir}home_background.jpg';
  static const String scanQr = '${_imageDir}scan_qr.png';
  static const String homeQr = '${_imageDir}home_qr.png';
  static const String addMoney = '${_imageDir}add_money.png';
  static const String laoQRLogo = '${_imageDir}lao_qr_logo.png';
  static const String avatar = '${_imageDir}avatar.jpg';

  // static const String placeholder = '${_imageDir}placeholder.jpg';
  static const String placeholder = '${_imageDir}avatar.png';
  static const String myPic = avatar;

  // static const String myPic = '${_imageDir}my_pic.png';
  static const String kokKokLogo = '${_imageDir}kokkok_logo.png';
  static const String edlBanner = '${_imageDir}edl_image.jpeg';
  static const String waterDrop = '${_imageDir}water_drop.png';
  static const String electricity = '${_imageDir}electricity.png';
}

class BankLogoAsset {
  static const String bankOfChina = '${_bankDir}bank_of_china.png';
  static const String bcel = '${_bankDir}bcel.png';
  static const String bic = '${_bankDir}bic.png';
  static const String ib = '${_bankDir}ib.png';
  static const String ldb = '${_bankDir}ldb.png';
  static const String vietinBank = '${_bankDir}vietin_bank.png';
}

class UtilLogo {
  static const String edl = '${_utilLogo}edl.png';
  static const String etl = '${_utilLogo}etl.png';
  static const String ltc = '${_utilLogo}ltc.png';
  static const String nampapa = '${_utilLogo}nampapa.png';
  static const String nampapaBanner = '${_utilLogo}nampapa_banner.png';
  static const String unitel = '${_utilLogo}unitel.png';
  static const String insurance = '${_utilLogo}insurance.png';
  static const String leasing = '${_utilLogo}leasing.png';
  static const String tax = '${_utilLogo}tax.png';
}
