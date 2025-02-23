import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository.dart';
import '../../domain/entities/profile.dart';
import '../data_sources/profile_remote_data_source.dart';

@lazySingleton
class ProfileRepository extends BaseRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepository(this._profileRemoteDataSource);

  Future<Either<Failure, Profile>> getProfile() async => await requestApi(
        () async => await _profileRemoteDataSource.getProfile(),
        (profileModel) async{
          return profileModel.toDomain();
        },
      );
}
