import '../../../../../core/data_source/remote/base_remote_data_source.dart';
import '../../../../../core/models/location_request.dart';

abstract class MapRemoteDataSource extends BaseRemoteDataSource {
  Future<void> changeTripStatusToNext(LocationRequest locationRequest);
}
