import 'package:dartz/dartz.dart';

import '../../../../core/entities/trip.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/models/location_request.dart';
import '../../../../core/repositories/base_repository.dart';
import '../entities/available_trips.dart';

abstract class MainRepository extends BaseRepository {
  Future<Either<Failure, Trip?>> getCurrentTrip();

  Future<Either<Failure, AvailableTrips>> getAvailableTrips(int page);

  Future<Either<Failure, void>> acceptTrip({
    required int tripId,
    required LocationRequest locationRequest,
  });
}
