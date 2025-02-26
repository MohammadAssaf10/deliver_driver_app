import '../../../../core/data_source/remote/base_remote_data_source.dart';

abstract class RegisterVehicleRemoteDataSource extends BaseRemoteDataSource{
  Future<void> registerVehicle({required String vehicleImage,required String licenseImage});
}