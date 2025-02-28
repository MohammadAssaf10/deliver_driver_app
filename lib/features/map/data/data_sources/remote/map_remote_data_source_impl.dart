import 'package:injectable/injectable.dart';

import '../../../../../core/data_source/remote/base_remote_data_source_impl.dart';
import 'map_remote_data_source.dart';

@LazySingleton(as: MapRemoteDataSource)
class MapRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements MapRemoteDataSource {}
