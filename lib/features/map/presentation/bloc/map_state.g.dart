// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MapState extends MapState {
  @override
  final bool isLoading;
  @override
  final Address? currentAddress;
  @override
  final TripModel? trip;
  @override
  final BuiltSet<Marker> markers;
  @override
  final bool isPanelOpen;
  @override
  final bool acceptTripIsLoading;
  @override
  final GoogleMapController? googleMapController;

  factory _$MapState([void Function(MapStateBuilder)? updates]) =>
      (new MapStateBuilder()..update(updates))._build();

  _$MapState._(
      {required this.isLoading,
      this.currentAddress,
      this.trip,
      required this.markers,
      required this.isPanelOpen,
      required this.acceptTripIsLoading,
      this.googleMapController})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(isLoading, r'MapState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(markers, r'MapState', 'markers');
    BuiltValueNullFieldError.checkNotNull(
        isPanelOpen, r'MapState', 'isPanelOpen');
    BuiltValueNullFieldError.checkNotNull(
        acceptTripIsLoading, r'MapState', 'acceptTripIsLoading');
  }

  @override
  MapState rebuild(void Function(MapStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MapStateBuilder toBuilder() => new MapStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MapState &&
        isLoading == other.isLoading &&
        currentAddress == other.currentAddress &&
        trip == other.trip &&
        markers == other.markers &&
        isPanelOpen == other.isPanelOpen &&
        acceptTripIsLoading == other.acceptTripIsLoading &&
        googleMapController == other.googleMapController;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, currentAddress.hashCode);
    _$hash = $jc(_$hash, trip.hashCode);
    _$hash = $jc(_$hash, markers.hashCode);
    _$hash = $jc(_$hash, isPanelOpen.hashCode);
    _$hash = $jc(_$hash, acceptTripIsLoading.hashCode);
    _$hash = $jc(_$hash, googleMapController.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MapState')
          ..add('isLoading', isLoading)
          ..add('currentAddress', currentAddress)
          ..add('trip', trip)
          ..add('markers', markers)
          ..add('isPanelOpen', isPanelOpen)
          ..add('acceptTripIsLoading', acceptTripIsLoading)
          ..add('googleMapController', googleMapController))
        .toString();
  }
}

class MapStateBuilder implements Builder<MapState, MapStateBuilder> {
  _$MapState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  Address? _currentAddress;
  Address? get currentAddress => _$this._currentAddress;
  set currentAddress(Address? currentAddress) =>
      _$this._currentAddress = currentAddress;

  TripModel? _trip;
  TripModel? get trip => _$this._trip;
  set trip(TripModel? trip) => _$this._trip = trip;

  SetBuilder<Marker>? _markers;
  SetBuilder<Marker> get markers =>
      _$this._markers ??= new SetBuilder<Marker>();
  set markers(SetBuilder<Marker>? markers) => _$this._markers = markers;

  bool? _isPanelOpen;
  bool? get isPanelOpen => _$this._isPanelOpen;
  set isPanelOpen(bool? isPanelOpen) => _$this._isPanelOpen = isPanelOpen;

  bool? _acceptTripIsLoading;
  bool? get acceptTripIsLoading => _$this._acceptTripIsLoading;
  set acceptTripIsLoading(bool? acceptTripIsLoading) =>
      _$this._acceptTripIsLoading = acceptTripIsLoading;

  GoogleMapController? _googleMapController;
  GoogleMapController? get googleMapController => _$this._googleMapController;
  set googleMapController(GoogleMapController? googleMapController) =>
      _$this._googleMapController = googleMapController;

  MapStateBuilder();

  MapStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _currentAddress = $v.currentAddress;
      _trip = $v.trip;
      _markers = $v.markers.toBuilder();
      _isPanelOpen = $v.isPanelOpen;
      _acceptTripIsLoading = $v.acceptTripIsLoading;
      _googleMapController = $v.googleMapController;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MapState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MapState;
  }

  @override
  void update(void Function(MapStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MapState build() => _build();

  _$MapState _build() {
    _$MapState _$result;
    try {
      _$result = _$v ??
          new _$MapState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'MapState', 'isLoading'),
            currentAddress: currentAddress,
            trip: trip,
            markers: markers.build(),
            isPanelOpen: BuiltValueNullFieldError.checkNotNull(
                isPanelOpen, r'MapState', 'isPanelOpen'),
            acceptTripIsLoading: BuiltValueNullFieldError.checkNotNull(
                acceptTripIsLoading, r'MapState', 'acceptTripIsLoading'),
            googleMapController: googleMapController,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'markers';
        markers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MapState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
