import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/address.dart';

part 'trip_model.g.dart';
@JsonSerializable(createToJson: false)
class TripModel {
  final int id;
  final Address pickUpAddress;
  final Address dropOffAddress;
  final double calculatedDistance;
  final double calculatedDuration;
  final double? captainProfit;

  TripModel({
    required this.id,
    required this.pickUpAddress,
    required this.dropOffAddress,
    required this.calculatedDistance,
    required this.calculatedDuration,
    required this.captainProfit,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);
}
