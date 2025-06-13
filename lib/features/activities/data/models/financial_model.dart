import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/financial.dart';
import 'payment_model.dart';

part 'financial_model.g.dart';

@JsonSerializable(createToJson: false)
class FinancialModel {
  final num totalEarnings;
  final List<PaymentModel> payments;

  FinancialModel({required this.totalEarnings, required this.payments});

  factory FinancialModel.fromJson(Map<String, dynamic> json) =>
      _$FinancialModelFromJson(json);

  Financial toDomain() => Financial(
    totalEarnings: totalEarnings,
    payments: payments.map((item) => item.toDomain()).toList(),
  );
}
