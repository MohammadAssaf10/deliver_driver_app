import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/payment.dart';

part 'payment_model.g.dart';

@JsonSerializable(createToJson: false)
class PaymentModel {
  final num createdDate;
  final num value;
  final num paymentMethod;
  final num paymentType;
  final num tripId;

  PaymentModel({
    required this.createdDate,
    required this.value,
    required this.paymentMethod,
    required this.paymentType,
    required this.tripId,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  Payment toDomain() =>
      Payment(createdDate: createdDate, tripId: tripId, value: value);
}
