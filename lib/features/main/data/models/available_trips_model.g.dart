// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_trips_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableTripsModel _$AvailableTripsModelFromJson(Map<String, dynamic> json) =>
    AvailableTripsModel(
      trips: (json['trips'] as List<dynamic>)
          .map((e) => TripModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
