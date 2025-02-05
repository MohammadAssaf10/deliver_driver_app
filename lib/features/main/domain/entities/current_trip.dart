import 'package:equatable/equatable.dart';

import '../../../../core/models/address.dart';
import '../../../../core/utils/app_enums.dart';

class CurrentTrip extends Equatable {
  final int id;
  final TripStatus tripStatus;
  final Address pickUpAddress;
  final Address dropOffAddress;
  final double calculatedDistance;
  final double calculatedDuration;
  final String? driverName;
  final String createdDate;
  const CurrentTrip({
    required this.id,
    required this.tripStatus,
    required this.pickUpAddress,
    required this.dropOffAddress,
    required this.calculatedDistance,
    required this.calculatedDuration,
    this.driverName,
    required this.createdDate,
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
        createdDate,
      ];
}
