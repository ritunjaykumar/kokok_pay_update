import 'package:dartz/dartz.dart';
import 'package:kokok_pay/models/model/models.dart';

import '/application/application.dart';
import '/models/enums/enums.dart';
import '/models/mapper/response_mapper.dart';
import '/models/model/error_model.dart';
import '/models/request/request_dto.dart';
import '/service/network/internet/internet.dart';
import '/service/network/repository/repository.dart';
import '/utils/extensions/string_extension.dart';
import '../../../models/model/model_resp.dart';
import '../../../models/response/response_dto.dart';
import '../error/error_handler.dart';
import '../source/remote_data_source.dart';

class RepositoryImpl implements Repository {
  final InternetStatus _internetStatus;
  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._internetStatus, this._remoteDataSource);

  @override
  Future<Either<Failure, MobileValidateResp>> mobileValidate(String mobileNo) async {
    try {
      if (await _internetStatus.isConnected()) {
        MobileValidateRespDto mobileValidateRespDto =
            await _remoteDataSource.mobileValidate(mobileNo);
        if (mobileValidateRespDto.respStatus == ResponseStatus.success.status) {
          return Right(mobileValidateRespDto.toData());
        } else {
          return Left(Failure(8, mobileValidateRespDto.reason.noResponse()));
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    } catch (error) {
      logger.i('error: ${error.toString()}');
      return Left(DataSource.unknown.getFailure());
    }
  }

  @override
  Future<Either<Failure, MobileValidateResp>> resendOtp(String otpRefId) async {
    try {
      if (await _internetStatus.isConnected()) {
        MobileValidateRespDto mobileValidateRespDto = await _remoteDataSource.resendOtp(otpRefId);
        if (mobileValidateRespDto.respStatus == ResponseStatus.success.status) {
          return Right(mobileValidateRespDto.toData());
        } else {
          return Left(Failure(8, mobileValidateRespDto.reason.noResponse()));
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    } catch (error) {
      logger.i('error: ${error.toString()}');
      return Left(DataSource.unknown.getFailure());
    }
  }

  @override
  Future<Either<Failure, AppStatusResp>> appStatus(String appVersion) async {
    try {
      if (await _internetStatus.isConnected()) {
        AppStatusRespDto appStatusRespDto = await _remoteDataSource.appStatus(appVersion);
        if (appStatusRespDto.respStatus == ResponseStatus.success.status) {
          return Right(appStatusRespDto.toData());
        } else {
          return Left(Failure(8, appStatusRespDto.reason.noResponse()));
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    } catch (error) {
      logger.i('error: ${error.toString()}');
      return Left(DataSource.unknown.getFailure());
    }
  }

  @override
  Future<Either<Failure, MobileVerifyResp>> verifyMobile(
      MobileVerifyReqDto mobileVerifyReqDto) async {
    try {
      if (await _internetStatus.isConnected()) {
        MobileVerifyRespDto mobileVerifyRespDto =
            await _remoteDataSource.verifyMobile(mobileVerifyReqDto);

        if (mobileVerifyRespDto.respStatus == ResponseStatus.success.status) {
          return Right(mobileVerifyRespDto.toData());
        } else {
          return Left(Failure(8, mobileVerifyRespDto.reason.noResponse()));
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    } catch (error) {
      logger.i('error: ${error.toString()}');
      return Left(DataSource.unknown.getFailure());
    }
  }

  @override
  Future<Either<Failure, RegistrationData>> userRegValidate(RegistrationData data) async {
    try {
      if (await _internetStatus.isConnected()) {
        UserRegistrationValRespDto userRegistrationResp =
            await _remoteDataSource.validateUserReg(data);

        if (userRegistrationResp.respStatus == ResponseStatus.success.status) {
          return Right(userRegistrationResp.toData());
        } else {
          return Left(Failure(8, userRegistrationResp.reason.noResponse()));
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    } catch (error) {
      logger.i('error: ${error.toString()}');
      return Left(DataSource.unknown.getFailure());
    }
  }

  @override
  Future<Either<Failure, UserRegistrationResp>> userRegistration(RegistrationData data) async {
    try {
      if (await _internetStatus.isConnected()) {
        UserRegisterRespDto userRegisterResp = await _remoteDataSource.userRegistration(data);

        if (userRegisterResp.respStatus == ResponseStatus.success.status) {
          return Right(userRegisterResp.toData());
        } else {
          return Left(Failure(8, userRegisterResp.reason.noResponse()));
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    } catch (error) {
      logger.i('error: ${error.toString()}');
      return Left(DataSource.unknown.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> registerNewMpin(MpinData mpinData) async {
    try {
      if (await _internetStatus.isConnected()) {
        NoResponseDto newPinResDto = await _remoteDataSource.newPinRegistration(mpinData);

        if (newPinResDto.respStatus == ResponseStatus.success.status) {
          void a;
          return Right(a);
        } else {
          return Left(Failure(8, newPinResDto.reason.noResponse()));
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    } catch (error) {
      logger.i('error: ${error.toString()}');
      return Left(DataSource.unknown.getFailure());
    }
  }

  @override
  Future<Either<Failure, LoginRes>> userLogin(LoginData loginData) async {
    try {
      if (await _internetStatus.isConnected()) {
        LoginResDto loginResDto = await _remoteDataSource.loginUser(loginData);

        if (loginResDto.respStatus == ResponseStatus.success.status) {
          return Right(loginResDto.toData());
        } else {
          return Left(Failure(8, loginResDto.reason.noResponse()));
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    } catch (error) {
      logger.i('error: ${error.toString()}');
      return Left(DataSource.unknown.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> resetMpin(ResetMpinReqDto mpinReq) async {
    try {
      if (await _internetStatus.isConnected()) {
        ResetMpinRespDto resetMpinRespDto = await _remoteDataSource.resetMpin(mpinReq);
        if (resetMpinRespDto.respStatus == ResponseStatus.success.status) {
          void a;
          return Right(a);
        } else {
          return Left(Failure(8, resetMpinRespDto.reason.noResponse()));
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    } catch (error) {
      logger.i('error: ${error.toString()}');
      return Left(DataSource.unknown.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> sendOtp(String secType) async {
    try {
      if (await _internetStatus.isConnected()) {
        OtpResDto otpResDto = await _remoteDataSource.sendOtp(secType);
        if (otpResDto.respStatus == ResponseStatus.success.status) {
          if (otpResDto.data!.otpFlag == 'Y') {
            return Right(otpResDto.toData());
          } else {
            return Left(Failure(8, 'Unable to send Otp try again!'));
          }
        } else {
          return Left(Failure(8, otpResDto.reason.noResponse()));
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    } catch (error) {
      logger.i('error: ${error.toString()}');
      return Left(DataSource.unknown.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      if (await _internetStatus.isConnected()) {
        NoResponseDto noResponseDto = await _remoteDataSource.logout();

        if (noResponseDto.respStatus == ResponseStatus.success.status) {
          void unused;
          return Right(unused);
        } else {
          return Left(Failure(8, noResponseDto.reason.noResponse()));
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    } catch (error) {
      logger.i('error: ${error.toString()}');
      return Left(DataSource.unknown.getFailure());
    }
  }

  @override
  Future<Either<Failure, WalletBalanceResp>> getWalletBalance() async {
    try {
      if (await _internetStatus.isConnected()) {
        WalletBalanceRespDto walletBalanceRespDto = await _remoteDataSource.getWalletBalance();
        if (walletBalanceRespDto.respStatus == ResponseStatus.success.status) {
          return Right(walletBalanceRespDto.toData());
        } else {
          return Left(Failure(8, walletBalanceRespDto.reason.noResponse()));
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    } catch (error) {
      logger.i('error: ${error.toString()}');
      return Left(DataSource.unknown.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<StatementResp>>> getMiniStatement() async {
    try {
      if (await _internetStatus.isConnected()) {
        StatementRespDto statementRespDto = await _remoteDataSource.getMiniStatement();

        if (statementRespDto.respStatus == ResponseStatus.success.status) {
          return Right(statementRespDto.toData());
        } else {
          return Left(Failure(8, statementRespDto.reason.noResponse()));
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    } catch (error) {
      logger.i('error: ${error.toString()}');
      return Left(DataSource.unknown.getFailure());
    }
  }

  @override
  Future<Either<Failure, UserProfileResp>> getUserDetails() async {
    try {
      if (await _internetStatus.isConnected()) {
        UserProfileRespDto userProfileRespDto = await _remoteDataSource.getUserProfile();

        if (userProfileRespDto.respStatus == ResponseStatus.success.status) {
          return Right(userProfileRespDto.toData());
        } else {
          return Left(Failure(8, userProfileRespDto.reason.noResponse()));
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    } catch (error) {
      logger.i('error: ${error.toString()}');
      return Left(DataSource.unknown.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> qrGenerate(QrReqDto qrReqDto) async {
    try {
      if (await _internetStatus.isConnected()) {
        QrRespDto qrRespDto = await _remoteDataSource.qrGenerate(qrReqDto);

        if (qrRespDto.respStatus == ResponseStatus.success.status) {
          return Right(qrRespDto.toData());
        } else {
          return Left(Failure(8, qrRespDto.reason.noResponse()));
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    } catch (error) {
      logger.i('error: ${error.toString()}');
      return Left(DataSource.unknown.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<BankDataResp>>> getBankDetails() async {
    try {
      if (await _internetStatus.isConnected()) {
        BankDataRespDto bankDataRespDto = await _remoteDataSource.getBankData();

        if (bankDataRespDto.respStatus == ResponseStatus.success.status) {
          return Right(bankDataRespDto.toData());
        } else {
          return Left(Failure(8, bankDataRespDto.reason.noResponse()));
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    } catch (error) {
      logger.i('error: ${error.toString()}');
      return Left(DataSource.unknown.getFailure());
    }
  }
}
