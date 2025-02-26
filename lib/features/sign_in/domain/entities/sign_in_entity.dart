import 'package:equatable/equatable.dart';

class SignInEntity extends Equatable {
  final bool isPhoneNumberVerified;
  final bool isVehicleRegistered;

  const SignInEntity(
      {required this.isPhoneNumberVerified, required this.isVehicleRegistered});

  factory SignInEntity.initial() => const SignInEntity(
      isPhoneNumberVerified: false, isVehicleRegistered: false);

  @override
  List<Object?> get props => [isVehicleRegistered, isPhoneNumberVerified];
}
