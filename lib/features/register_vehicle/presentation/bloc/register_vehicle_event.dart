import 'package:built_value/built_value.dart';
import 'package:image_picker/image_picker.dart';

part 'register_vehicle_event.g.dart';

abstract class RegisterVehicleEvent {}

abstract class RegisterVehicle extends RegisterVehicleEvent
    implements Built<RegisterVehicle, RegisterVehicleBuilder> {
  RegisterVehicle._();

  factory RegisterVehicle([void Function(RegisterVehicleBuilder) updates]) =
      _$RegisterVehicle;
}


abstract class SelectLicenseImage extends RegisterVehicleEvent
    implements Built<SelectLicenseImage, SelectLicenseImageBuilder> {
  ImageSource get imageSource;

  SelectLicenseImage._();

  factory SelectLicenseImage(
          [void Function(SelectLicenseImageBuilder) updates]) =
      _$SelectLicenseImage;
}

abstract class SelectVehicleImage extends RegisterVehicleEvent
    implements Built<SelectVehicleImage, SelectVehicleImageBuilder> {
  ImageSource get imageSource;

  SelectVehicleImage._();

  factory SelectVehicleImage(
          [void Function(SelectVehicleImageBuilder) updates]) =
      _$SelectVehicleImage;
}
