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
      tripStatus: $enumDecodeNullable(_$TripStatusEnumMap, json['tripStatus']),
    );

const _$TripStatusEnumMap = {
  TripStatus.waiting: 'waiting',
  TripStatus.onWayToPickupRider: 'onWayToPickupRider',
  TripStatus.driverArrivedToPickupRider: 'driverArrivedToPickupRider',
  TripStatus.delivering: 'delivering',
  TripStatus.delivered: 'delivered',
  TripStatus.cancelled: 'cancelled',
};
