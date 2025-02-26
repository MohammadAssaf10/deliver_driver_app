import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/location_request.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../domain/entities/current_trip.dart';
import '../../domain/repositories/main_repository.dart';
import '../data_sources/remote/main_remote_data_source.dart';
import '../models/trip_model.dart';

@LazySingleton(as: MainRepository)
class MainRepositoryImpl extends BaseRepositoryImpl implements MainRepository {
  final MainRemoteDataSource _mainRemoteDataSource;

  MainRepositoryImpl(this._mainRemoteDataSource, super._networkInfo);

  @override
  Future<Either<Failure, CurrentTrip?>> getCurrentTrip() async =>
      await requestApi(
        () async => await _mainRemoteDataSource.getCurrentTrip(),
        (currentTripModel) {
          if (currentTripModel == null) return null;
          return currentTripModel.toDomain();
        },
      );

  @override
  Future<Either<Failure, List<TripModel>>> getAvailableTrips(int page) async =>
      await requestApi(
        () async => await _mainRemoteDataSource.getAvailableTrips(page),
        (availableTripsModel) {
          return availableTripsModel.trips;
        },
      );

  @override
  Future<Either<Failure, void>> acceptTrip({
    required int tripId,
    required LocationRequest locationRequest,
  }) async =>
      await requestApi(
        () async => await _mainRemoteDataSource.acceptTrip(
          tripId: tripId,
          locationRequest: locationRequest,
        ),
        (_) async {
          return;
        },
      );
}
