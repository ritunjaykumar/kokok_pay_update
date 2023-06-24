import 'package:dartz/dartz.dart';

import '/models/model/models.dart';
import '../../../models/model/error_model.dart';
import '../../../models/model/model_resp.dart';
import '../../../models/request/request_dto.dart';

abstract class Repository {
  Future<Either<Failure, MobileValidateResp>> mobileValidate(String mobileNo);

  Future<Either<Failure, MobileVerifyResp>> verifyMobile(MobileVerifyReqDto mobileVerifyReqDto);

  Future<Either<Failure, MobileValidateResp>> resendOtp(String otpRefId);

  Future<Either<Failure, AppStatusResp>> appStatus(String appVersion);

  Future<Either<Failure, RegistrationData>> userRegValidate(RegistrationData data);

  Future<Either<Failure, UserRegistrationResp>> userRegistration(RegistrationData data);

  Future<Either<Failure, void>> registerNewMpin(MpinData mpinData);

  Future<Either<Failure, LoginRes>> userLogin(LoginData loginData);

  Future<Either<Failure, String>> sendOtp(String secType);

  Future<Either<Failure, void>> resetMpin(ResetMpinReqDto mpinReq);

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, WalletBalanceResp>> getWalletBalance();

  Future<Either<Failure, List<StatementResp>>> getMiniStatement();

  Future<Either<Failure, UserProfileResp>> getUserDetails();

  Future<Either<Failure, String>> qrGenerate(QrReqDto qrReqDto);

  Future<Either<Failure, List<BankDataResp>>> getBankDetails();
}
