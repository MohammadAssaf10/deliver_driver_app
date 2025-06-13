// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinancialModel _$FinancialModelFromJson(Map<String, dynamic> json) =>
    FinancialModel(
      totalEarnings: json['totalEarnings'] as num,
      payments: (json['payments'] as List<dynamic>)
          .map((e) => PaymentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
