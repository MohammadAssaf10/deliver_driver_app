import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/entities/trip.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/models/location_request.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../domain/entities/available_trips.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl extends BaseRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepositoryImpl(super._networkInfo, this._homeRemoteDataSource);

  @override
  Future<Either<Failure, Trip?>> getCurrentTrip() async => await requestApi(
    () async => await _homeRemoteDataSource.getCurrentTrip(),
    (tripModel) {
      if (tripModel == null) return null;
      return tripModel.toDomain();
    },
  );

  @override
  Future<Either<Failure, AvailableTrips>> getAvailableTrips(int page) async =>
      await requestApi(
        () async => await _homeRemoteDataSource.getAvailableTrips(page),
        (availableTripsModel) {
          return availableTripsModel.toDomain();
        },
      );

  @override
  Future<Either<Failure, void>> acceptTrip({
    required int tripId,
    required LocationRequest locationRequest,
  }) async => await requestApi(
    () async => await _homeRemoteDataSource.acceptTrip(
      tripId: tripId,
      locationRequest: locationRequest,
    ),
    (_) {
      return;
    },
  );
}
