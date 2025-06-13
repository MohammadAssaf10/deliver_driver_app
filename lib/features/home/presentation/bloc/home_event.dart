import 'package:built_value/built_value.dart';

part 'home_event.g.dart';

abstract class HomeEvent {}

abstract class GetCurrentTrip extends HomeEvent
    implements Built<GetCurrentTrip, GetCurrentTripBuilder> {
  GetCurrentTrip._();

  factory GetCurrentTrip([void Function(GetCurrentTripBuilder) updates]) =
      _$GetCurrentTrip;
}

abstract class GetAvailableTrips extends HomeEvent
    implements Built<GetAvailableTrips, GetAvailableTripsBuilder> {
  GetAvailableTrips._();

  factory GetAvailableTrips([void Function(GetAvailableTripsBuilder) updates]) =
      _$GetAvailableTrips;
}

abstract class GetCurrentLocation extends HomeEvent
    implements Built<GetCurrentLocation, GetCurrentLocationBuilder> {

  GetCurrentLocation._();

  factory GetCurrentLocation([
    void Function(GetCurrentLocationBuilder) updates,
  ]) = _$GetCurrentLocation;
}

abstract class AcceptTrip extends HomeEvent
    implements Built<AcceptTrip, AcceptTripBuilder> {
  int get tripId;

  AcceptTrip._();

  factory AcceptTrip([void Function(AcceptTripBuilder) updates]) = _$AcceptTrip;
}
