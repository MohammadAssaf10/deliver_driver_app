import 'package:json_annotation/json_annotation.dart';

import '../entities/trip.dart';
import '../utils/constant.dart';
import 'address.dart';

part 'trip_model.g.dart';

@JsonSerializable(createToJson: false)
class TripModel {
  final int id;
  final int? status;
  final Address pickUpAddress;
  final Address dropOffAddress;
  final int createdDate;
  final double calculatedDistance;
  final double calculatedDuration;
  final String? driverName;
  final double? captainProfit;

  TripModel({
    required this.id,
    this.status,
    required this.pickUpAddress,
    required this.dropOffAddress,
    required this.createdDate,
    required this.calculatedDistance,
    required this.calculatedDuration,
    this.driverName,
    this.captainProfit,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);

  Trip toDomain() => Trip(
        id: id,
        status: Constant.tripStatusMap[status],
        pickUpAddress: pickUpAddress,
        dropOffAddress: dropOffAddress,
        createdDate: createdDate,
        calculatedDistance: calculatedDistance,
        calculatedDuration: calculatedDuration,
        driverName: driverName,
        captainProfit: captainProfit,
      );
}
