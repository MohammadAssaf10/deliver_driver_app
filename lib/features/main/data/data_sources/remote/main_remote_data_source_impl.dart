import 'package:injectable/injectable.dart';

import '../../../../../core/data_source/remote/base_remote_data_source_impl.dart';
import '../../../../../core/models/location_request.dart';
import '../../../../../core/network/endpoints.dart';
import '../../models/available_trips_model.dart';
import '../../models/current_trip_model.dart';
import 'main_remote_data_source.dart';

@LazySingleton(as: MainRemoteDataSource)
class MainRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements MainRemoteDataSource {
  @override
  Future<CurrentTripModel?> getCurrentTrip() async {
    final result = await performGetRequest(
      endpoint: Endpoints.currentTrip,
    );
    if (result.data == null) return null;
    return CurrentTripModel.fromJson(result.data);
  }

  @override
  Future<AvailableTripsModel> getAvailableTrips(int page) async {
    final result = await performGetRequest(
      endpoint: Endpoints.availableTrips,
      queryParameters: {
        "Page": page,
      },
    );
    return AvailableTripsModel.fromJson(result.data);
  }

  @override
  Future<void> acceptTrip({
    required int tripId,
    required LocationRequest locationRequest,
  }) async {
    await performPutRequest(
      endpoint: Endpoints.acceptTrip,
      body: {
        "tripId": tripId,
        "driverAddress": {
          "longitude": locationRequest.longitude,
          "latitude": locationRequest.latitude,
        }
      },
    );
  }
}
