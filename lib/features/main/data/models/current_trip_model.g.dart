// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentTripModel _$CurrentTripModelFromJson(Map<String, dynamic> json) =>
    CurrentTripModel(
      id: (json['id'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      pickUpAddress:
          Address.fromJson(json['pickUpAddress'] as Map<String, dynamic>),
      dropOfAddress:
          Address.fromJson(json['dropOfAddress'] as Map<String, dynamic>),
      createdDate: (json['createdDate'] as num).toInt(),
      calculatedDistance: (json['calculatedDistance'] as num).toDouble(),
      calculatedDuration: (json['calculatedDuration'] as num).toDouble(),
      driverName: json['driverName'] as String?,
    );
