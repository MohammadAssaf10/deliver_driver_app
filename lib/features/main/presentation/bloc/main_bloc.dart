import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

import '../../../../core/di/di.dart';
import '../../../../core/entities/pagination_state_data.dart';
import '../../../../core/models/address.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_functions.dart';
import '../../../../generated/l10n.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../../domain/repositories/main_repository.dart';
import '../pages/home_body.dart';
import 'main_event.dart';
import 'main_state.dart';

@injectable
class MainBloc extends Bloc<MainEvent, MainState> {
  final PageController pageController = PageController();
  final ScrollController controller = ScrollController();

  final List<Widget> pages = [
    const HomeBody(),
    Container(),
    BlocProvider(
      create: (context) => getIt<ProfileBloc>()..getProfile(),
      child: const ProfilePage(),
    ),
  ];
  final MainRepository _mainRepository;
  final Location _location;

  void setPageIndex(int pageIndex) =>
      add(SetPageIndex((b) => b..pageIndex = pageIndex));

  void getCurrentTrip() => add(GetCurrentTrip());

  void getAvailableTrips() => add(GetAvailableTrips());

  void getCurrentLocation({void Function()? onComplete}) =>
      add(GetCurrentLocation((b) => b..onComplete = onComplete));

  void acceptTrip(int tripId) => add(AcceptTrip((b) => b..tripId = tripId));

  MainBloc(
    this._mainRepository,
    this._location,
  ) : super(MainState.initial()) {
    on<SetPageIndex>((event, emit) {
      emit(state.rebuild((b) => b..pageIndex = event.pageIndex));
    });
    on<GetCurrentLocation>(
      (event, emit) async {
        if (event.onComplete != null) {
          emit(state.rebuild((b) => b..acceptTripIsLoading = true));
        }
        final bool isLocationServiceEnabled =
            await _ensureLocationServiceEnabled();
        if (!isLocationServiceEnabled) {
          if (event.onComplete != null) {
            await Future.delayed(const Duration(seconds: 1));
            emit(state.rebuild((b) => b..acceptTripIsLoading = false));
            emit(state.rebuild((b) => b..acceptTripIsLoading = null));
          }
          return;
        }

        final LocationData locationData = await _location.getLocation();
        if (locationData.latitude == null || locationData.longitude == null) {
          if (event.onComplete != null) {
            await Future.delayed(const Duration(seconds: 1));
            emit(state.rebuild((b) => b..acceptTripIsLoading = false));
            emit(state.rebuild((b) => b..acceptTripIsLoading = null));
          }
          return;
        }

        final Address currentAddress = Address(
          markerState: MarkerState.currentLocation,
          latitude: locationData.latitude!,
          longitude: locationData.longitude!,
        );

        emit(state.rebuild(
          (b) => b
            ..currentAddress = currentAddress
            ..acceptTripIsLoading = null,
        ));
        if (event.onComplete != null) {
          event.onComplete!();
        }
      },
      transformer: droppable(),
    );
    on<GetCurrentTrip>((event, emit) async {
      emit(state.rebuild(
        (b) => b
          ..isLoading = true
          ..isError = false
          ..acceptTripIsLoading = null
          ..trips.replace(PaginationStateData.initial()),
      ));
      final result = await _mainRepository.getCurrentTrip();
      result.fold((failure) {
        emit(state.rebuild(
          (b) => b
            ..isLoading = false
            ..isError = true,
        ));
      }, (data) {
        emit(state.rebuild(
          (b) => b
            ..isLoading = false
            ..currentTrip = data,
        ));
        if (data == null) {
          getAvailableTrips();
        }
      });
    });
    on<GetAvailableTrips>((event, emit) async {
      if (state.trips.currentPage == 1) {
        emit(state.rebuild(
          (b) => b
            ..isLoading = true
            ..isError = false,
        ));
      } else {
        emit(state.rebuild((b) => b..trips.isLoading = true));
      }
      final result =
          await _mainRepository.getAvailableTrips(state.trips.currentPage);
      result.fold((failure) {
        if (state.trips.currentPage > 1) {
          showToastMessage(
            failure.errorMessage,
            isError: true,
          );
        }
        emit(state.rebuild(
          (b) => b
            ..isLoading = false
            ..trips.isLoading = false
            ..isError = state.trips.currentPage > 1 ? state.isError : true,
        ));
      }, (data) {
        emit(state.rebuild(
          (b) => b
            ..isLoading = false
            ..trips.isLoading = false
            ..trips.items.addAll(data.trips)
            ..trips.currentPage = b.trips.currentPage! + 1
            ..trips.isFinished = data.trips.isEmpty,
        ));
        if (!state.isListenerAdded) {
          controller.addListener(() {
            if (state.trips.shouldGetMoreData(controller)) {
              getAvailableTrips();
            }
          });
          emit(state.rebuild((b) => b..isListenerAdded = true));
        }
      });
    }, transformer: droppable());

    on<AcceptTrip>((event, emit) async {
      emit(state.rebuild((b) => b..acceptTripIsLoading = true));
      final result = await _mainRepository.acceptTrip(
        tripId: event.tripId,
        locationRequest: state.currentAddress!.toLocationRequest(),
      );
      result.fold((failure) {
        showToastMessage(failure.errorMessage, isError: true);
        emit(state.rebuild((b) => b..acceptTripIsLoading = false));
      }, (_) {
        emit(state.rebuild((b) => b..acceptTripIsLoading = false));
        getCurrentTrip();
      });
      emit(state.rebuild((b) => b..acceptTripIsLoading = null));
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
            S.current.pleaseAllowAppToAccessYourCurrentLocationAndTryAgain);
        return false;
      }
    }
    return true;
  }
}
