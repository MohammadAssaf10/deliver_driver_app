import 'package:built_value/built_value.dart';

part 'main_event.g.dart';

abstract class MainEvent {}

abstract class SetPageIndex extends MainEvent
    implements Built<SetPageIndex, SetPageIndexBuilder> {
  int get pageIndex;

  SetPageIndex._();

  factory SetPageIndex([void Function(SetPageIndexBuilder) updates]) =
      _$SetPageIndex;
}

abstract class GetCurrentTrip extends MainEvent
    implements Built<GetCurrentTrip, GetCurrentTripBuilder> {
  GetCurrentTrip._();

  factory GetCurrentTrip([void Function(GetCurrentTripBuilder) updates]) =
      _$GetCurrentTrip;
}

abstract class GetAvailableTrips extends MainEvent
    implements Built<GetAvailableTrips, GetAvailableTripsBuilder> {
  GetAvailableTrips._();

  factory GetAvailableTrips([void Function(GetAvailableTripsBuilder) updates]) =
      _$GetAvailableTrips;
}

abstract class GetCurrentLocation extends MainEvent
    implements Built<GetCurrentLocation, GetCurrentLocationBuilder> {
  GetCurrentLocation._();

  factory GetCurrentLocation(
          [void Function(GetCurrentLocationBuilder) updates]) =
      _$GetCurrentLocation;
}

abstract class AcceptTrip extends MainEvent
    implements Built<AcceptTrip, AcceptTripBuilder> {
  int get tripId;

  AcceptTrip._();

  factory AcceptTrip([void Function(AcceptTripBuilder) updates]) = _$AcceptTrip;
}
