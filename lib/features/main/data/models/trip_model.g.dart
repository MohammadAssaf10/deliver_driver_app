// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripModel _$TripModelFromJson(Map<String, dynamic> json) => TripModel(
      id: (json['id'] as num).toInt(),
      pickUpAddress:
          Address.fromJson(json['pickUpAddress'] as Map<String, dynamic>),
      dropOffAddress:
          Address.fromJson(json['dropOffAddress'] as Map<String, dynamic>),
      calculatedDistance: (json['calculatedDistance'] as num).toDouble(),
      calculatedDuration: (json['calculatedDuration'] as num).toDouble(),
      captainProfit: (json['captainProfit'] as num?)?.toDouble(),
      createdAt: (json['createdAt'] as num).toInt(),
    );
