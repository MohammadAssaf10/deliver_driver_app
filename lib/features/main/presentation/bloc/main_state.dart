import 'package:built_value/built_value.dart';

import '../../../../core/entities/pagination_state_data.dart';
import '../../../../core/models/address.dart';
import '../../data/models/trip_model.dart';
import '../../domain/entities/current_trip.dart';

part 'main_state.g.dart';

abstract class MainState implements Built<MainState, MainStateBuilder> {
  bool get isLoading;

  bool get isError;

  int get pageIndex;

  CurrentTrip? get currentTrip;

  PaginationStateData<TripModel> get trips;

  bool get isListenerAdded;

  Address? get currentAddress;

  bool? get acceptTripIsLoading;

  MainState._();

  factory MainState([void Function(MainStateBuilder) updates]) = _$MainState;

  factory MainState.initial() {
    return MainState(
          (b) =>
      b
        ..isLoading = false
        ..isError = false
        ..pageIndex = 0
        ..currentTrip = null
        ..trips.replace(PaginationStateData<TripModel>.initial())
        ..isListenerAdded = false
        ..currentAddress = null
        ..acceptTripIsLoading = null,
    );
  }
}
