import 'package:equatable/equatable.dart';

import '../../../../core/models/address.dart';
import '../../../../core/utils/app_enums.dart';
import '../../data/models/trip_model.dart';

class CurrentTrip extends Equatable {
  final int id;
  final TripStatus tripStatus;
  final Address pickUpAddress;
  final Address dropOffAddress;
  final double calculatedDistance;
  final double calculatedDuration;
  final String? driverName;
  final String createdDateAsString;
  final int createdDateAsInt;
  final double? captainProfit;

  const CurrentTrip({
    required this.id,
    required this.tripStatus,
    required this.pickUpAddress,
    required this.dropOffAddress,
    required this.calculatedDistance,
    required this.calculatedDuration,
    this.driverName,
    required this.createdDateAsString,
    required this.createdDateAsInt,
    required this.captainProfit,
  });

  @override
  List<Object?> get props => [
        id,
        tripStatus,
        pickUpAddress,
        dropOffAddress,
        calculatedDistance,
        calculatedDuration,
        driverName,
        createdDateAsString,
        createdDateAsInt,
      ];

  TripModel toTripModel() => TripModel(
        id: id,
        pickUpAddress: pickUpAddress,
        dropOffAddress: dropOffAddress,
        calculatedDistance: calculatedDistance,
        calculatedDuration: calculatedDuration,
        createdAt: createdDateAsInt,
        captainProfit: captainProfit,
        tripStatus: tripStatus,
      );
}
