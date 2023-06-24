import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../models/request/request_dto.dart';
import '../../../models/response/response_dto.dart';
import '../dio_config/dio_config.dart';

part 'api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST('/mobile/validate')
  Future<MobileValidateRespDto> validateMobile(
    @Field('mobile') String mobileNo,
  );

  @POST('/mobile/verify')
  Future<MobileVerifyRespDto> verifyMobile(@Body() MobileVerifyReqDto mobileVerifyReqDto);

  @POST('/otp/resend')
  Future<MobileValidateRespDto> resendOtp(@Field('otpRefId') String otpRefId);

  @GET('/status/app/{appVersion}')
  Future<AppStatusRespDto> appStatus(@Path("appVersion") String appVersion);

  @POST('/user/validate/register')
  Future<UserRegistrationValRespDto> userRegValidation(@Body() UserRegistrationReqDto userReg);

  @POST('/user/register')
  Future<UserRegisterRespDto> userRegistration(@Body() UserRegistrationReqDto userReg);

  @POST('/user/security/new')
  Future<NoResponseDto> registerNewMpin(@Body() NewPinReqDto newPinReq);

  @POST('/user/login')
  Future<LoginResDto> userLogin(@Body() LoginReqDto loginData);

  @POST('/user/security/register')
  Future<OtpResDto> sendOtp(@Field('securityType') String secType);

  @POST('/user/security/update')
  Future<ResetMpinRespDto> updateMpin(@Body() ResetMpinReqDto resetMpin);

  @GET('/user/logout')
  Future<NoResponseDto> logout();

  @POST('/wallet/balance')
  Future<WalletBalanceRespDto> walletAmount();

  @GET('/wallet/statement/mini')
  Future<StatementRespDto> getMiniStatement();

  @GET('/transactions/recent/list/{tag}')
  Future<RecentTxnRespDto> getRecentTransaction(@Path('tag') String flag);

  @GET('/user/profile/info')
  Future<UserProfileRespDto> getUserProfile();

  @POST('/qr/generate/customer')
  Future<QrRespDto> qrGenerate(@Body() QrReqDto qrReqDto);

  @GET('/inter-entity/list/QRIN')
  Future<BankDataRespDto> getBankData();
}
