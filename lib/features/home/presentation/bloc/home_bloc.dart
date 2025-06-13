import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

import '../../../../core/entities/pagination_state_data.dart';
import '../../../../core/models/address.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_functions.dart';
import '../../../../generated/l10n.dart';
import '../../domain/repositories/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Location _location;
  final HomeRepository _homeRepository;
  final ScrollController controller = ScrollController();

  void getCurrentTrip() => add(GetCurrentTrip());

  void getCurrentLocation() => add(GetCurrentLocation());

  void acceptTrip(int tripId) => add(AcceptTrip((b) => b..tripId = tripId));

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }

  HomeBloc(this._homeRepository, this._location) : super(HomeState.initial()) {
    on<GetCurrentLocation>((event, emit) async {
      final bool isLocationServiceEnabled =
          await _ensureLocationServiceEnabled();
      if (!isLocationServiceEnabled) {
        return;
      }

      final LocationData locationData = await _location.getLocation();
      if (locationData.latitude == null || locationData.longitude == null) {
        return;
      }

      final Address currentAddress = Address(
        markerState: MarkerState.currentLocation,
        latitude: locationData.latitude!,
        longitude: locationData.longitude!,
      );

      emit(state.rebuild((b) => b..currentAddress = currentAddress));
    }, transformer: droppable());
    on<GetCurrentTrip>((event, emit) async {
      emit(
        state.rebuild(
          (b) => b
            ..tripStatus = BlocStatus.loading
            ..trips.replace(PaginationStateData.initial()),
        ),
      );
      final result = await _homeRepository.getCurrentTrip();
      result.fold(
        (failure) {
          emit(state.rebuild((b) => b..tripStatus = BlocStatus.error));
        },
        (data) {
          emit(
            state.rebuild(
              (b) => b
                ..tripStatus = data == null
                    ? BlocStatus.loading
                    : BlocStatus.success
                ..currentTrip = data,
            ),
          );
          if (data == null) {
            add(GetAvailableTrips());
          }
        },
      );
    });
    on<GetAvailableTrips>((event, emit) async {
      if (state.trips.currentPage != 1) {
        emit(state.rebuild((b) => b..trips.isLoading = true));
      }
      final result = await _homeRepository.getAvailableTrips(
        state.trips.currentPage,
      );
      result.fold(
        (failure) {
          if (state.trips.currentPage > 1) {
            showToastMessage(failure.errorMessage, isError: true);
          }
          emit(
            state.rebuild(
              (b) => b
                ..trips.isLoading = false
                ..tripStatus = state.trips.currentPage == 1
                    ? BlocStatus.error
                    : state.tripStatus,
            ),
          );
        },
        (data) {
          emit(
            state.rebuild(
              (b) => b
                ..tripStatus = BlocStatus.success
                ..trips.isLoading = false
                ..trips.items.addAll(data.trips)
                ..trips.currentPage = b.trips.currentPage! + 1
                ..trips.isFinished = data.trips.isEmpty,
            ),
          );
          if (!state.isListenerAdded) {
            controller.addListener(() {
              if (state.trips.shouldGetMoreData(controller)) {
                add(GetAvailableTrips());
              }
            });
            emit(state.rebuild((b) => b..isListenerAdded = true));
          }
        },
      );
    }, transformer: droppable());

    on<AcceptTrip>((event, emit) async {
      emit(state.rebuild((b) => b..acceptTripStatus = BlocStatus.loading));
      if (state.currentAddress == null) {
        final bool isLocationServiceEnabled =
            await _ensureLocationServiceEnabled();
        if (!isLocationServiceEnabled) {
          emit(state.rebuild((b) => b..acceptTripStatus = BlocStatus.error));
          emit(state.rebuild((b) => b..acceptTripStatus = BlocStatus.initial));
          return;
        }

        final LocationData locationData = await _location.getLocation();
        if (locationData.latitude == null || locationData.longitude == null) {
          emit(state.rebuild((b) => b..acceptTripStatus = BlocStatus.error));
          emit(state.rebuild((b) => b..acceptTripStatus = BlocStatus.initial));
          return;
        }

        final Address currentAddress = Address(
          markerState: MarkerState.currentLocation,
          latitude: locationData.latitude!,
          longitude: locationData.longitude!,
        );

        emit(state.rebuild((b) => b..currentAddress = currentAddress));
      }
      final result = await _homeRepository.acceptTrip(
        tripId: event.tripId,
        locationRequest: state.currentAddress!.toLocationRequest(),
      );
      result.fold(
        (failure) {
          showToastMessage(failure.errorMessage, isError: true);
          emit(state.rebuild((b) => b..acceptTripStatus = BlocStatus.error));
        },
        (_) {
          emit(state.rebuild((b) => b..acceptTripStatus = BlocStatus.success));
          getCurrentTrip();
        },
      );
      emit(state.rebuild((b) => b..acceptTripStatus = BlocStatus.initial));
    }, transformer: droppable());
  }

  Future<bool> _ensureLocationServiceEnabled() async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        showToastMessage(S.current.pleaseTurnOnLocationServiceAndTryAgain);
        return false;
      }
    }

    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted != PermissionStatus.granted) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        showToastMessage(
          S.current.pleaseAllowAppToAccessYourCurrentLocationAndTryAgain,
        );
        return false;
      }
    }
    return true;
  }
}
