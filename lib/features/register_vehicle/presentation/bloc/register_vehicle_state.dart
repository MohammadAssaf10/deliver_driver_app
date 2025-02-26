import 'package:built_value/built_value.dart';
import 'package:image_picker/image_picker.dart';

part 'register_vehicle_state.g.dart';

abstract class RegisterVehicleState
    implements Built<RegisterVehicleState, RegisterVehicleStateBuilder> {
  bool get isLoading;

  bool get isSuccess;

  bool get isError;

  XFile? get licenseImage;

  XFile? get vehicleImage;

  RegisterVehicleState._();

  factory RegisterVehicleState(
          [void Function(RegisterVehicleStateBuilder) updates]) =
      _$RegisterVehicleState;

  factory RegisterVehicleState.initial() => RegisterVehicleState(
        (b) => b
          ..isLoading = false
          ..isSuccess = false
          ..isError = false
          ..licenseImage = null
          ..vehicleImage = null
      );
}
