import 'package:json_annotation/json_annotation.dart';

import 'trip_model.dart';

part 'available_trips_model.g.dart';

@JsonSerializable(createToJson: false)
class AvailableTripsModel {
  final List<TripModel> trips;

  AvailableTripsModel({
    required this.trips,
  });
  factory AvailableTripsModel.fromJson(Map<String, dynamic> json) =>
      _$AvailableTripsModelFromJson(json);

}
