import 'package:built_value/built_value.dart';

import '../../../main/data/models/trip_model.dart';

part 'map_event.g.dart';

abstract class MapEvent {}

abstract class GetCurrentLocation extends MapEvent
    implements Built<GetCurrentLocation, GetCurrentLocationBuilder> {
  GetCurrentLocation._();

  factory GetCurrentLocation(
          [void Function(GetCurrentLocationBuilder) updates]) =
      _$GetCurrentLocation;
}

abstract class ChangeIsPanelOpenState extends MapEvent
    implements Built<ChangeIsPanelOpenState, ChangeIsPanelOpenStateBuilder> {
  bool get isPanelOpen;

  ChangeIsPanelOpenState._();

  factory ChangeIsPanelOpenState(
          [void Function(ChangeIsPanelOpenStateBuilder) updates]) =
      _$ChangeIsPanelOpenState;
}

abstract class AcceptTrip extends MapEvent
    implements Built<AcceptTrip, AcceptTripBuilder> {
  int get tripId;

  AcceptTrip._();

  factory AcceptTrip([void Function(AcceptTripBuilder) updates]) = _$AcceptTrip;
}

abstract class GetAddressDetails extends MapEvent
    implements Built<GetAddressDetails, GetAddressDetailsBuilder> {
  TripModel get trip;

  GetAddressDetails._();

  factory GetAddressDetails([void Function(GetAddressDetailsBuilder) updates]) =
      _$GetAddressDetails;
}
