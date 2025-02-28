import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/models/address.dart';
import '../../../main/data/models/trip_model.dart';

part 'map_state.g.dart';

abstract class MapState implements Built<MapState, MapStateBuilder> {
  bool get isLoading;

  Address? get currentAddress;

  TripModel? get trip;

  BuiltSet<Marker> get markers;

  bool get isPanelOpen;

  bool get acceptTripIsLoading;

  GoogleMapController? get googleMapController;

  MapState._();

  factory MapState([void Function(MapStateBuilder) updates]) = _$MapState;

  factory MapState.initial() => MapState(
        (b) => b
          ..isLoading = false
          ..markers.replace({})
          ..currentAddress = null
          ..isPanelOpen = false
          ..googleMapController = null
          ..acceptTripIsLoading = false
          ..trip = null,
      );
}
