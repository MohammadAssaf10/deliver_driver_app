import 'package:equatable/equatable.dart';

import '../../../../core/entities/trip.dart';

class AvailableTrips extends Equatable{
  final List<Trip> trips;

  const AvailableTrips({required this.trips});

  @override
  List<Object?> get props => [trips];

}