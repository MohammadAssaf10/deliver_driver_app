import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/sign_in_entity.dart';

part 'sign_in_model.g.dart';

@JsonSerializable(createToJson: false)
class SignInModel {
  final int id;
  final bool isPhoneNumberVerified;
  final bool isVehicleRegistered;
  final String token;

  SignInModel({
    required this.id,
    required this.token,
    required this.isPhoneNumberVerified,
    required this.isVehicleRegistered,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);

  SignInEntity toDomain() {
    return SignInEntity(
      isPhoneNumberVerified: isPhoneNumberVerified,
      isVehicleRegistered: isVehicleRegistered,
    );
  }
}
