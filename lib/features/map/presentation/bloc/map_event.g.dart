// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetCurrentLocation extends GetCurrentLocation {
  factory _$GetCurrentLocation(
          [void Function(GetCurrentLocationBuilder)? updates]) =>
      (new GetCurrentLocationBuilder()..update(updates))._build();

  _$GetCurrentLocation._() : super._();

  @override
  GetCurrentLocation rebuild(
          void Function(GetCurrentLocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetCurrentLocationBuilder toBuilder() =>
      new GetCurrentLocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetCurrentLocation;
  }

  @override
  int get hashCode {
    return 214810858;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetCurrentLocation').toString();
  }
}

class GetCurrentLocationBuilder
    implements Builder<GetCurrentLocation, GetCurrentLocationBuilder> {
  _$GetCurrentLocation? _$v;

  GetCurrentLocationBuilder();

  @override
  void replace(GetCurrentLocation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetCurrentLocation;
  }

  @override
  void update(void Function(GetCurrentLocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetCurrentLocation build() => _build();

  _$GetCurrentLocation _build() {
    final _$result = _$v ?? new _$GetCurrentLocation._();
    replace(_$result);
    return _$result;
  }
}

class _$ChangeIsPanelOpenState extends ChangeIsPanelOpenState {
  @override
  final bool isPanelOpen;

  factory _$ChangeIsPanelOpenState(
          [void Function(ChangeIsPanelOpenStateBuilder)? updates]) =>
      (new ChangeIsPanelOpenStateBuilder()..update(updates))._build();

  _$ChangeIsPanelOpenState._({required this.isPanelOpen}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isPanelOpen, r'ChangeIsPanelOpenState', 'isPanelOpen');
  }

  @override
  ChangeIsPanelOpenState rebuild(
          void Function(ChangeIsPanelOpenStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeIsPanelOpenStateBuilder toBuilder() =>
      new ChangeIsPanelOpenStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeIsPanelOpenState && isPanelOpen == other.isPanelOpen;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isPanelOpen.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeIsPanelOpenState')
          ..add('isPanelOpen', isPanelOpen))
        .toString();
  }
}

class ChangeIsPanelOpenStateBuilder
    implements Builder<ChangeIsPanelOpenState, ChangeIsPanelOpenStateBuilder> {
  _$ChangeIsPanelOpenState? _$v;

  bool? _isPanelOpen;
  bool? get isPanelOpen => _$this._isPanelOpen;
  set isPanelOpen(bool? isPanelOpen) => _$this._isPanelOpen = isPanelOpen;

  ChangeIsPanelOpenStateBuilder();

  ChangeIsPanelOpenStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isPanelOpen = $v.isPanelOpen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeIsPanelOpenState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeIsPanelOpenState;
  }

  @override
  void update(void Function(ChangeIsPanelOpenStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeIsPanelOpenState build() => _build();

  _$ChangeIsPanelOpenState _build() {
    final _$result = _$v ??
        new _$ChangeIsPanelOpenState._(
          isPanelOpen: BuiltValueNullFieldError.checkNotNull(
              isPanelOpen, r'ChangeIsPanelOpenState', 'isPanelOpen'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$AcceptTrip extends AcceptTrip {
  @override
  final int tripId;

  factory _$AcceptTrip([void Function(AcceptTripBuilder)? updates]) =>
      (new AcceptTripBuilder()..update(updates))._build();

  _$AcceptTrip._({required this.tripId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(tripId, r'AcceptTrip', 'tripId');
  }

  @override
  AcceptTrip rebuild(void Function(AcceptTripBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AcceptTripBuilder toBuilder() => new AcceptTripBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AcceptTrip && tripId == other.tripId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, tripId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AcceptTrip')..add('tripId', tripId))
        .toString();
  }
}

class AcceptTripBuilder implements Builder<AcceptTrip, AcceptTripBuilder> {
  _$AcceptTrip? _$v;

  int? _tripId;
  int? get tripId => _$this._tripId;
  set tripId(int? tripId) => _$this._tripId = tripId;

  AcceptTripBuilder();

  AcceptTripBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tripId = $v.tripId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AcceptTrip other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AcceptTrip;
  }

  @override
  void update(void Function(AcceptTripBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AcceptTrip build() => _build();

  _$AcceptTrip _build() {
    final _$result = _$v ??
        new _$AcceptTrip._(
          tripId: BuiltValueNullFieldError.checkNotNull(
              tripId, r'AcceptTrip', 'tripId'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GetAddressDetails extends GetAddressDetails {
  @override
  final TripModel trip;

  factory _$GetAddressDetails(
          [void Function(GetAddressDetailsBuilder)? updates]) =>
      (new GetAddressDetailsBuilder()..update(updates))._build();

  _$GetAddressDetails._({required this.trip}) : super._() {
    BuiltValueNullFieldError.checkNotNull(trip, r'GetAddressDetails', 'trip');
  }

  @override
  GetAddressDetails rebuild(void Function(GetAddressDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAddressDetailsBuilder toBuilder() =>
      new GetAddressDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAddressDetails && trip == other.trip;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, trip.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetAddressDetails')
          ..add('trip', trip))
        .toString();
  }
}

class GetAddressDetailsBuilder
    implements Builder<GetAddressDetails, GetAddressDetailsBuilder> {
  _$GetAddressDetails? _$v;

  TripModel? _trip;
  TripModel? get trip => _$this._trip;
  set trip(TripModel? trip) => _$this._trip = trip;

  GetAddressDetailsBuilder();

  GetAddressDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _trip = $v.trip;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetAddressDetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetAddressDetails;
  }

  @override
  void update(void Function(GetAddressDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAddressDetails build() => _build();

  _$GetAddressDetails _build() {
    final _$result = _$v ??
        new _$GetAddressDetails._(
          trip: BuiltValueNullFieldError.checkNotNull(
              trip, r'GetAddressDetails', 'trip'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
