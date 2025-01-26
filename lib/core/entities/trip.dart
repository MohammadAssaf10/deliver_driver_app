import 'package:equatable/equatable.dart';

import '../models/address.dart';
import '../utils/app_enums.dart';

class Trip extends Equatable {
  final int id;
  final TripStatus tripStatus;
  final Address pickUpAddress;
  final Address dropOfAddress;
  final double calculatedDistance;
  final double calculatedDuration;
  final String? driverName;
  final String createdDate;

  const Trip({
    required this.id,
    required this.tripStatus,
    required this.pickUpAddress,
    required this.dropOfAddress,
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
        dropOfAddress,
        calculatedDistance,
        calculatedDuration,
        driverName,
        createdDate,
      ];
}
