import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/app_functions.dart';
import '../../data/repositories/register_vehicle_repository.dart';
import 'register_vehicle_event.dart';
import 'register_vehicle_state.dart';

@injectable
class RegisterVehicleBloc
    extends Bloc<RegisterVehicleEvent, RegisterVehicleState> {
  final ImagePicker _imagePicker;
  final RegisterVehicleRepository _registerVehicleRepository;

  void selectLicenseImage(ImageSource imageSource) =>
      add(SelectLicenseImage((b) => b..imageSource = imageSource));

  void selectVehicleImage(ImageSource imageSource) =>
      add(SelectVehicleImage((b) => b..imageSource = imageSource));

  void registerVehicle()=>add(RegisterVehicle());

  RegisterVehicleBloc(
    this._imagePicker,
    this._registerVehicleRepository,
  ) : super(RegisterVehicleState.initial()) {
    on<SelectLicenseImage>((event, emit) async {
      final XFile? licenseImage =
          await _imagePicker.pickImage(source: event.imageSource);
      if (licenseImage != null) {
        emit(state.rebuild((b) => b..licenseImage = licenseImage));
      }
    });
    on<SelectVehicleImage>((event, emit) async {
      final XFile? vehicleImage =
          await _imagePicker.pickImage(source: event.imageSource);
      if (vehicleImage != null) {
        emit(state.rebuild((b) => b..vehicleImage = vehicleImage));
      }
    });
    on<RegisterVehicle>((event, emit) async {
      if (state.licenseImage == null || state.vehicleImage == null) return;
      emit(state.rebuild(
        (b) => b
          ..isLoading = true
          ..isError = false
          ..isSuccess = false,
      ));
      final result = await _registerVehicleRepository.registerVehicle(
        licenseImage: state.licenseImage!,
        vehicleImage: state.vehicleImage!,
      );
      result.fold((failure) {
        showToastMessage(failure.errorMessage, isError: true);
        emit(state.rebuild(
          (b) => b
            ..isError = true
            ..isLoading = false
            ..isSuccess = false,
        ));
      }, (data) {
        emit(state.rebuild(
          (b) => b
            ..isError = false
            ..isLoading = false
            ..isSuccess = true,
        ));
      });
    }, transformer: droppable());
  }
}
