import 'package:equatable/equatable.dart';

import '../models/address.dart';
import '../utils/app_enums.dart';

class Trip extends Equatable {
  final int id;
  final TripStatus? status;
  final Address pickUpAddress;
  final Address dropOffAddress;
  final int createdDate;
  final double calculatedDistance;
  final double calculatedDuration;
  final String? driverName;
  final double? captainProfit;

  const Trip({
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

  @override
  List<Object?> get props => [
        id,
        status,
        pickUpAddress,
        dropOffAddress,
        createdDate,
        calculatedDistance,
        calculatedDuration,
        driverName,
        captainProfit,
      ];

  Trip copyWith({
    int? id,
    TripStatus? status,
    Address? pickUpAddress,
    Address? dropOffAddress,
    int? createdDate,
    double? calculatedDistance,
    double? calculatedDuration,
    String? driverName,
    double? captainProfit,
  }) {
    return Trip(
      id: id ?? this.id,
      status: status ?? this.status,
      pickUpAddress: pickUpAddress ?? this.pickUpAddress,
      dropOffAddress: dropOffAddress ?? this.dropOffAddress,
      createdDate: createdDate ?? this.createdDate,
      calculatedDistance: calculatedDistance ?? this.calculatedDistance,
      calculatedDuration: calculatedDuration ?? this.calculatedDuration,
      driverName: driverName ?? this.driverName,
      captainProfit: captainProfit ?? this.captainProfit,
    );
  }
}
