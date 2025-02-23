import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/shared_preferences_helper.dart';
import '../../../sign_in/data/repositories/sign_in_repository.dart';
import '../data_sources/remote/verification_code_remote_data_source.dart';

@lazySingleton
class VerificationCodeRepository extends BaseRepository {
  final VerificationCodeRemoteDataSource _verificationCodeRemoteDataSource;

  VerificationCodeRepository(
    this._verificationCodeRemoteDataSource,
  );

  Future<Either<Failure, void>> generateVerificationCode() async =>
      await requestApi(
        () async =>
            await _verificationCodeRemoteDataSource.generateVerificationCode(),
        (_) async {
          return;
        },
      );

  Future<Either<Failure, String>> getVerificationCode() async =>
      await requestApi(
        () async =>
            await _verificationCodeRemoteDataSource.getVerificationCode(),
        (verificationCode) async {
          return verificationCode;
        },
      );

  Future<Either<Failure, void>> verifyPhoneNumber(String code) async =>
      await requestApi(
        () async =>
            await _verificationCodeRemoteDataSource.verifyPhoneNumber(code),
        (_) async {
          SharedPreferencesHelper.setData(
              LocalStorageKeys.isPhoneNumberVerified, true);
          return;
        },
      );
}
