import '../../../../../core/data_source/remote/base_remote_data_source.dart';
import '../../models/available_trips_model.dart';
import '../../models/current_trip_model.dart';

abstract class MainRemoteDataSource extends BaseRemoteDataSource {
  Future<CurrentTripModel?> getCurrentTrip();
  Future<AvailableTripsModel> getAvailableTrips(int page);
}
