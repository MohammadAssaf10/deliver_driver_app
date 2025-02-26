import 'package:injectable/injectable.dart';

import '../../../../core/data_source/remote/base_remote_data_source_impl.dart';
import '../../../../core/network/endpoints.dart';
import 'register_vehicle_remote_data_source.dart';

@LazySingleton(as: RegisterVehicleRemoteDataSource)
class RegisterVehicleRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements RegisterVehicleRemoteDataSource {
  @override
  Future<void> registerVehicle({
    required String vehicleImage,
    required String licenseImage,
  }) async {
    await performPutRequest(
      endpoint: Endpoints.registerVehicle,
      body: {
        "vehicleImage": vehicleImage,
        "licenseImage": licenseImage,
      },
    );
  }
}
