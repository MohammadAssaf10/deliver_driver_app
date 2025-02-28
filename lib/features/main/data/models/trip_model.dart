import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/address.dart';
import '../../../../core/utils/app_enums.dart';

part 'trip_model.g.dart';

@JsonSerializable(createToJson: false)
class TripModel {
  final int id;
  final Address pickUpAddress;
  final Address dropOffAddress;
  final double calculatedDistance;
  final double calculatedDuration;
  final double? captainProfit;
  final int createdAt;
  final TripStatus? tripStatus;

  TripModel({
    required this.id,
    required this.pickUpAddress,
    required this.dropOffAddress,
    required this.calculatedDistance,
    required this.calculatedDuration,
    required this.captainProfit,
    required this.createdAt,
    this.tripStatus,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);

  TripModel copyWith({
    int? id,
    Address? pickUpAddress,
    Address? dropOffAddress,
    double? calculatedDistance,
    double? calculatedDuration,
    double? captainProfit,
    int? createdAt,
    TripStatus? tripStatus,
  }) {
    return TripModel(
      id: id ?? this.id,
      pickUpAddress: pickUpAddress ?? this.pickUpAddress,
      dropOffAddress: dropOffAddress ?? this.dropOffAddress,
      calculatedDistance: calculatedDistance ?? this.calculatedDistance,
      calculatedDuration: calculatedDuration ?? this.calculatedDuration,
      captainProfit: captainProfit ?? this.captainProfit,
      createdAt: createdAt ?? this.createdAt,
      tripStatus: tripStatus ?? this.tripStatus,
    );
  }
}
