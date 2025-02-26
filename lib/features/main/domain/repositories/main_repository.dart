import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/location_request.dart';
import '../../../../core/repositories/base_repository.dart';
import '../../data/models/trip_model.dart';
import '../entities/current_trip.dart';

abstract class MainRepository extends BaseRepository{
  Future<Either<Failure, CurrentTrip?>> getCurrentTrip();
  Future<Either<Failure, List<TripModel>>> getAvailableTrips(int page);
  Future<Either<Failure, void>> acceptTrip({
    required int tripId,
    required LocationRequest locationRequest,
  });
}