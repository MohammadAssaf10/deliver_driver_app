import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/location_request.dart';
import '../../../../core/repositories/base_repository.dart';
import '../../domain/entities/current_trip.dart';
import '../data_sources/remote/main_remote_data_source.dart';
import '../models/trip_model.dart';

@lazySingleton
class MainRepository extends BaseRepository {
  final MainRemoteDataSource _mainRemoteDataSource;

  MainRepository(this._mainRemoteDataSource);

  Future<Either<Failure, CurrentTrip?>> getCurrentTrip() async =>
      await requestApi(
        () async => await _mainRemoteDataSource.getCurrentTrip(),
        (currentTripModel) async {
          if (currentTripModel == null) return null;
          return currentTripModel.toDomain();
        },
      );

  Future<Either<Failure, List<TripModel>>> getAvailableTrips(int page) async =>
      await requestApi(
        () async => await _mainRemoteDataSource.getAvailableTrips(page),
        (availableTripsModel) async {
          return availableTripsModel.trips;
        },
      );

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
