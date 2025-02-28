import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../domain/entities/current_trip.dart';
import '../../../../core/models/address.dart';

part 'current_trip_model.g.dart';

@JsonSerializable(createToJson: false)
class CurrentTripModel {
  final int id;
  final int status;
  final Address pickUpAddress;
  final Address dropOffAddress;
  final int createdDate;
  final double calculatedDistance;
  final double calculatedDuration;
  final String? driverName;
  final double? captainProfit;

  CurrentTripModel({
    required this.id,
    required this.status,
    required this.pickUpAddress,
    required this.dropOffAddress,
    required this.createdDate,
    required this.calculatedDistance,
    required this.calculatedDuration,
    required this.driverName,
    required this.captainProfit,
  });

  factory CurrentTripModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentTripModelFromJson(json);

  CurrentTrip toDomain() {
    return CurrentTrip(
      id: id,
      tripStatus: Constant.tripStatusMap[status]!,
      pickUpAddress: pickUpAddress,
      dropOffAddress: dropOffAddress,
      calculatedDistance: calculatedDistance,
      calculatedDuration: calculatedDuration,
      driverName: driverName,
      createdDateAsInt: createdDate,
      createdDateAsString: createdDate.convertToStringDateTime(),
      captainProfit: captainProfit,
    );
  }
}
