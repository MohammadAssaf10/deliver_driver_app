import '../../../../../core/data_source/remote/base_remote_data_source.dart';
import '../../../../../core/models/location_request.dart';
import '../../../../../core/models/trip_model.dart';
import '../../models/available_trips_model.dart';

abstract class MainRemoteDataSource extends BaseRemoteDataSource {
  Future<TripModel?> getCurrentTrip();

  Future<AvailableTripsModel> getAvailableTrips(int page);

  Future<void> acceptTrip({
    required int tripId,
    required LocationRequest locationRequest,
  });
}
