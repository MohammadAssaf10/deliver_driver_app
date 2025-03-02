import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/location_request.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../data_sources/remote/map_remote_data_source.dart';

@lazySingleton
class MapRepository extends BaseRepositoryImpl {
  final MapRemoteDataSource _mapDataSource;

  MapRepository(this._mapDataSource, super._networkInfo);

  Future<Either<Failure, void>> changeTripStatusToNext(
          LocationRequest locationRequest) async =>
      await requestApi(
        () async =>
            await _mapDataSource.changeTripStatusToNext(locationRequest),
        (_) {
          return;
        },
      );
}
