import 'package:injectable/injectable.dart';

import '../../../../core/repositories/base_repository_impl.dart';
import '../data_sources/remote/map_remote_data_source.dart';

@lazySingleton
class MapRepository extends BaseRepositoryImpl {
  final MapRemoteDataSource _mapDataSource;

  MapRepository(this._mapDataSource, super._networkInfo);
}
