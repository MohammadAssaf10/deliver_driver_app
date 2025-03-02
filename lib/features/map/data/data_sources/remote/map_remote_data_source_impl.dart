import 'package:injectable/injectable.dart';

import '../../../../../core/data_source/remote/base_remote_data_source_impl.dart';
import '../../../../../core/models/location_request.dart';
import '../../../../../core/network/endpoints.dart';
import 'map_remote_data_source.dart';

@LazySingleton(as: MapRemoteDataSource)
class MapRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements MapRemoteDataSource {
  @override
  Future<void> changeTripStatusToNext(LocationRequest locationRequest) async {
    await performPutRequest(
      endpoint: Endpoints.nextTripStatus,
      body: {
        "longitude": locationRequest.longitude,
        "latitude": locationRequest.latitude,
      },
    );
  }
}
