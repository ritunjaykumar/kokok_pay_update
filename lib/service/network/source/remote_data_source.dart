import '../../../models/model/models.dart';
import '/service/network/api/api.dart';
import '../../../models/request/request_dto.dart';
import '../../../models/response/response_dto.dart';

abstract class RemoteDataSource {
  Future<MobileValidateRespDto> mobileValidate(String mobileNo);

  Future<MobileValidateRespDto> resendOtp(String otpRefId);

  Future<AppStatusRespDto> appStatus(String appVersion);

  Future<MobileVerifyRespDto> verifyMobile(MobileVerifyReqDto mobileVerifyReqDto);

  Future<UserRegistrationValRespDto> validateUserReg(RegistrationData registrationData);

  Future<UserRegisterRespDto> userRegistration(RegistrationData registrationData);

  Future<NoResponseDto> newPinRegistration(MpinData mpinData);

  Future<LoginResDto> loginUser(LoginData loginData);

  Future<OtpResDto> sendOtp(String secType);

  Future<ResetMpinRespDto> resetMpin(ResetMpinReqDto reqDto);

  Future<NoResponseDto> logout();

  Future<WalletBalanceRespDto> getWalletBalance();

  Future<StatementRespDto> getMiniStatement();

  Future<UserProfileRespDto> getUserProfile();

  Future<QrRespDto> qrGenerate(QrReqDto qrReqDto);

  Future<BankDataRespDto> getBankData();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  const RemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<MobileValidateRespDto> mobileValidate(String mobileNo) {
    return apiClient.validateMobile(mobileNo);
  }

  @override
  Future<MobileValidateRespDto> resendOtp(String otpRefId) {
    return apiClient.resendOtp(otpRefId);
  }

  @override
  Future<AppStatusRespDto> appStatus(String appVersion) {
    return apiClient.appStatus(appVersion);
  }

  @override
  Future<MobileVerifyRespDto> verifyMobile(MobileVerifyReqDto mobileVerifyReqDto) {
    return apiClient.verifyMobile(mobileVerifyReqDto);
  }

  @override
  Future<UserRegistrationValRespDto> validateUserReg(RegistrationData registrationData) {
    return apiClient.userRegValidation(
      UserRegistrationReqDto(
        registrationData.otpRefId,
        'MANUAL',
        registrationData.firstName,
        registrationData.lastName,
        registrationData.gender,
        registrationData.emailId,
        registrationData.address,
        registrationData.country,
        registrationData.district,
        registrationData.state,
        registrationData.dob,
      ),
    );
  }

  @override
  Future<UserRegisterRespDto> userRegistration(RegistrationData registrationData) {
    return apiClient.userRegistration(
      UserRegistrationReqDto(
        registrationData.otpRefId,
        registrationData.regOption ?? 'MANUAL',
        registrationData.firstName,
        registrationData.lastName,
        registrationData.gender,
        registrationData.emailId,
        registrationData.address,
        registrationData.country,
        registrationData.district,
        registrationData.state,
        registrationData.dob,
      ),
    );
  }

  @override
  Future<NoResponseDto> newPinRegistration(MpinData mpinData) {
    return apiClient.registerNewMpin(NewPinReqDto(mpinData.userId, mpinData.mpin));
  }

  @override
  Future<LoginResDto> loginUser(LoginData loginData) {
    return apiClient.userLogin(LoginReqDto(
      loginData.loginType.type,
      loginData.mpin,
      loginData.loginSalt,
    ));
  }

  @override
  Future<ResetMpinRespDto> resetMpin(ResetMpinReqDto reqDto) {
    return apiClient.updateMpin(reqDto);
  }

  @override
  Future<OtpResDto> sendOtp(String secType) {
    return apiClient.sendOtp(secType);
  }

  @override
  Future<NoResponseDto> logout() {
    return apiClient.logout();
  }

  @override
  Future<WalletBalanceRespDto> getWalletBalance() {
    return apiClient.walletAmount();
  }

  @override
  Future<StatementRespDto> getMiniStatement() {
    return apiClient.getMiniStatement();
  }

  @override
  Future<UserProfileRespDto> getUserProfile() {
    return apiClient.getUserProfile();
  }

  @override
  Future<QrRespDto> qrGenerate(QrReqDto qrReqDto) {
    return apiClient.qrGenerate(qrReqDto);
  }

  @override
  Future<BankDataRespDto> getBankData() {
    return apiClient.getBankData();
  }
}
