import 'package:built_value/built_value.dart';

import '../../../../core/entities/pagination_state_data.dart';
import '../../../../core/entities/trip.dart';
import '../../../../core/models/address.dart';
import '../../../../core/utils/app_enums.dart';

part 'home_state.g.dart';

abstract class HomeState implements Built<HomeState, HomeStateBuilder> {
  BlocStatus get tripStatus;

  Trip? get currentTrip;

  PaginationStateData<Trip> get trips;
  bool get isListenerAdded;

  BlocStatus get acceptTripStatus;
  Address? get currentAddress;

  HomeState._();
  factory HomeState([void Function(HomeStateBuilder) updates]) = _$HomeState;

  factory HomeState.initial() => HomeState(
    (b) => b
      ..tripStatus = BlocStatus.loading
      ..currentTrip = null
      ..trips.replace(PaginationStateData<Trip>.initial())
      ..isListenerAdded = false
      ..acceptTripStatus = BlocStatus.initial
      ..currentAddress = null,
  );
}
