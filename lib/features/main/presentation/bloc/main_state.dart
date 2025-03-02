import 'package:built_value/built_value.dart';

import '../../../../core/entities/pagination_state_data.dart';
import '../../../../core/entities/trip.dart';
import '../../../../core/models/address.dart';

part 'main_state.g.dart';

abstract class MainState implements Built<MainState, MainStateBuilder> {
  bool get isLoading;

  bool get isError;

  int get pageIndex;

  Trip? get currentTrip;

  PaginationStateData<Trip> get trips;

  bool get isListenerAdded;

  Address? get currentAddress;

  bool? get acceptTripIsLoading;

  MainState._();

  factory MainState([void Function(MainStateBuilder) updates]) = _$MainState;

  factory MainState.initial() {
    return MainState(
      (b) => b
        ..isLoading = false
        ..isError = false
        ..pageIndex = 0
        ..currentTrip = null
        ..trips.replace(PaginationStateData<Trip>.initial())
        ..isListenerAdded = false
        ..currentAddress = null
        ..acceptTripIsLoading = null,
    );
  }
}
