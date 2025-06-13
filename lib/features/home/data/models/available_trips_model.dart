import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/trip_model.dart';
import '../../domain/entities/available_trips.dart';

part 'available_trips_model.g.dart';

@JsonSerializable(createToJson: false)
class AvailableTripsModel {
  final List<TripModel> trips;

  AvailableTripsModel({
    required this.trips,
  });

  factory AvailableTripsModel.fromJson(Map<String, dynamic> json) =>
      _$AvailableTripsModelFromJson(json);

  AvailableTrips toDomain() => AvailableTrips(
        trips: trips.map((item) => item.toDomain()).toList(),
      );
}
