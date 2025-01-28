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
  final Address dropOfAddress;
  final int createdDate;
  final double calculatedDistance;
  final double calculatedDuration;
  final String? driverName;
  CurrentTripModel({
    required this.id,
    required this.status,
    required this.pickUpAddress,
    required this.dropOfAddress,
    required this.createdDate,
    required this.calculatedDistance,
    required this.calculatedDuration,
    required this.driverName,
  });

  factory CurrentTripModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentTripModelFromJson(json);

  CurrentTrip toDomain() {
    return CurrentTrip(
      id: id,
      tripStatus: Constant.tripStatusMap[status]!,
      pickUpAddress: pickUpAddress,
      dropOfAddress: dropOfAddress,
      calculatedDistance: calculatedDistance,
      calculatedDuration: calculatedDuration,
      driverName: driverName,
      createdDate: createdDate.convertToStringDateTime(),
    );
  }
}
