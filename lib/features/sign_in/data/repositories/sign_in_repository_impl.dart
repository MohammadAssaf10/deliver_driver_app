import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/shared_preferences_helper.dart';
import '../../domain/entities/sign_in_entity.dart';
import '../../domain/repositories/sign_in_repository.dart';
import '../data_sources/remote/sign_in_remote_data_source.dart';
import '../models/sign_in_model.dart';
import '../models/sign_in_request.dart';

@LazySingleton(as: SignInRepository)
class SignInRepositoryImpl extends BaseRepositoryImpl implements SignInRepository{
  final SignInRemoteDataSource _signInRemoteDataSource;

  SignInRepositoryImpl(this._signInRemoteDataSource, super._networkInfo);

  @override
  Future<Either<Failure, SignInEntity>> signIn(SignInRequest signInRequest) async {
    return await requestApi<SignInEntity, SignInModel>(
      <SignInModel>() async =>
          await _signInRemoteDataSource.signIn(signInRequest),
      (signInModel) {
        Future.wait([
          SharedPreferencesHelper.setData(
              LocalStorageKeys.isPhoneNumberVerified,
              signInModel.isPhoneNumberVerified),
          SharedPreferencesHelper.setData(LocalStorageKeys.isVehicleRegistered,
              signInModel.isVehicleRegistered),
          SharedPreferencesHelper.setSecuredString(
            LocalStorageKeys.userToken,
            signInModel.token,
          ),
          SharedPreferencesHelper.setSecuredString(
            LocalStorageKeys.phoneNumber,
            signInRequest.phoneNumber,
          ),
          SharedPreferencesHelper.setSecuredString(
            LocalStorageKeys.password,
            signInRequest.password,
          ),
        ]);

        return signInModel.toDomain();
      },
    );
  }
}
