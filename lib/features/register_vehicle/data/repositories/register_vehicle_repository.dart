import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_functions.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/shared_preferences_helper.dart';
import '../data_sources/register_vehicle_remote_data_source.dart';

@lazySingleton
class RegisterVehicleRepository extends BaseRepositoryImpl {
  final RegisterVehicleRemoteDataSource _registerVehicleRemoteDataSource;
  final FirebaseStorage _firebaseStorage;

  RegisterVehicleRepository(
    this._registerVehicleRemoteDataSource,
    this._firebaseStorage,
    super._networkInfo,
  );

  Future<Either<Failure, void>> registerVehicle({
    required XFile licenseImage,
    required XFile vehicleImage,
  }) async =>
      await requestApi(() async {
        final Reference licenseRef =
            _firebaseStorage.ref().child('driver/${licenseImage.name}');
        final Reference vehicleRef =
            _firebaseStorage.ref().child('driver/${vehicleImage.name}');
        await licenseRef.putFile(File(licenseImage.path));
        await vehicleRef.putFile(File(vehicleImage.path));
        final String licenseUrl = await licenseRef.getDownloadURL();
        final String vehicleUrl = await vehicleRef.getDownloadURL();
        dPrint('licenseUrl: $licenseUrl}', stringColor: StringColor.blue);
        dPrint('vehicleUrl: $vehicleUrl}', stringColor: StringColor.blue);
        await _registerVehicleRemoteDataSource.registerVehicle(
          vehicleImage: vehicleUrl,
          licenseImage: licenseUrl,
        );
      }, (_) {
        SharedPreferencesHelper.setData(LocalStorageKeys.isVehicleRegistered, true);
        return;
      });
}
