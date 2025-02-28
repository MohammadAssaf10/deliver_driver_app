import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../core/models/address.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_functions.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../main/data/models/trip_model.dart';
import '../../../main/domain/accept_trip_use_case.dart';
import 'map_event.dart';
import 'map_state.dart';

@injectable
class MapBloc extends Bloc<MapEvent, MapState> {
  final Location _location;
  final AcceptTripUseCase _acceptTripUseCase;
  final Completer<GoogleMapController> mapCompleter =
      Completer<GoogleMapController>();
  final PanelController panelController = PanelController();

  void getCurrentLocation() => add(GetCurrentLocation());

  void changeIsPanelOpenState(bool isPanelOpen) =>
      add(ChangeIsPanelOpenState((b) => b..isPanelOpen = isPanelOpen));

  void acceptTrip(int tripId) => add(AcceptTrip((b) => b..tripId = tripId));

  void getAddressDetails(TripModel trip) =>
      add(GetAddressDetails((b) => b..trip = trip));

  MapBloc(
    this._location,
    this._acceptTripUseCase,
  ) : super(MapState.initial()) {
    on<GetCurrentLocation>(
      (event, emit) async {
        final bool isLocationServiceEnabled =
            await _ensureLocationServiceEnabled();
        if (!isLocationServiceEnabled) return;

        final LocationData locationData = await _location.getLocation();
        if (locationData.latitude == null || locationData.longitude == null) {
          return;
        }
        final GoogleMapController googleMapController =
            await mapCompleter.future;

        final Address currentAddress = await _getAddressPlacemark(Address(
          markerState: MarkerState.currentLocation,
          latitude: locationData.latitude!,
          longitude: locationData.longitude!,
        ));
        final Set<Marker> updatedMarkers = await _updateMarkerSet(
          markers: state.markers.toSet(),
          markerState: MarkerState.currentLocation,
          latitude: locationData.latitude!,
          longitude: locationData.longitude!,
          googleMapController: googleMapController,
          markerIcon: Assets.iconsCurrentLocation,
        );

        emit(
          state.rebuild(
            (b) => b
              ..currentAddress = currentAddress
              ..googleMapController = googleMapController
              ..markers.replace(updatedMarkers),
          ),
        );
      },
      transformer: droppable(),
    );

    on<ChangeIsPanelOpenState>((event, emit) {
      emit(state.rebuild((b) => b..isPanelOpen = event.isPanelOpen));
    });

    on<AcceptTrip>((event, emit) async {
      if (state.currentAddress == null) return;
      emit(state.rebuild((b) => b..acceptTripIsLoading = true));
      final result = await _acceptTripUseCase(
        tripId: event.tripId,
        locationRequest: state.currentAddress!.toLocationRequest(),
      );
      result.fold((failure) {
        showToastMessage(failure.errorMessage, isError: true);
        emit(state.rebuild((b) => b..acceptTripIsLoading = false));
      }, (_) {
        emit(state.rebuild((b) => b..acceptTripIsLoading = false));
      });
    }, transformer: droppable());

    on<GetAddressDetails>((event, emit) async {
      emit(state.rebuild((b) => b..trip = event.trip));
      final Address updatedPickUpAddress =
          await _getAddressPlacemark(event.trip.pickUpAddress);
      final Address updatedDropOffAddress =
          await _getAddressPlacemark(event.trip.dropOffAddress);
      final TripModel trip = event.trip.copyWith(
        pickUpAddress: updatedPickUpAddress,
        dropOffAddress: updatedDropOffAddress,
      );
      emit(state.rebuild((b) => b..trip = trip));
    });
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

  Future<Set<Marker>> _updateMarkerSet({
    required Set<Marker> markers,
    required MarkerState markerState,
    required double latitude,
    required double longitude,
    required String markerIcon,
    GoogleMapController? googleMapController,
  }) async {
    final Set<Marker> updatedMarkers = Set<Marker>.from(markers);
    updatedMarkers.removeWhere(
      (marker) => marker.markerId.value == markerState.index.toString(),
    );
    final BitmapDescriptor mapMarkerIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(
        size: Size(34, 34),
      ),
      markerIcon,
    );
    updatedMarkers.add(
      Marker(
        markerId: MarkerId(markerState.index.toString()),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: markerState.name),
        icon: mapMarkerIcon,
      ),
    );
    if (googleMapController != null) {
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              latitude,
              longitude,
            ),
            zoom: 15,
          ),
        ),
      );
    }

    return updatedMarkers;
  }

  Future<Address> _getAddressPlacemark(Address address) async {
    Address updatedAddress = address;
    try {
      final geocoding.Placemark placemark = (await geocoding
              .placemarkFromCoordinates(address.latitude, address.longitude))
          .first;
      updatedAddress = address.copyWith(
        administrativeArea: placemark.administrativeArea,
        locality: placemark.locality,
        street: placemark.street,
      );
    } catch (e) {
      dPrint("Error from get location placemark: $e",
          stringColor: StringColor.red);
    }
    return updatedAddress;
  }
}
