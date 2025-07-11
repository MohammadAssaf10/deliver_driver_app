// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetCurrentTrip extends GetCurrentTrip {
  factory _$GetCurrentTrip([void Function(GetCurrentTripBuilder)? updates]) =>
      (GetCurrentTripBuilder()..update(updates))._build();

  _$GetCurrentTrip._() : super._();
  @override
  GetCurrentTrip rebuild(void Function(GetCurrentTripBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetCurrentTripBuilder toBuilder() => GetCurrentTripBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetCurrentTrip;
  }

  @override
  int get hashCode {
    return 354660668;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetCurrentTrip').toString();
  }
}

class GetCurrentTripBuilder
    implements Builder<GetCurrentTrip, GetCurrentTripBuilder> {
  _$GetCurrentTrip? _$v;

  GetCurrentTripBuilder();

  @override
  void replace(GetCurrentTrip other) {
    _$v = other as _$GetCurrentTrip;
  }

  @override
  void update(void Function(GetCurrentTripBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetCurrentTrip build() => _build();

  _$GetCurrentTrip _build() {
    final _$result = _$v ?? _$GetCurrentTrip._();
    replace(_$result);
    return _$result;
  }
}

class _$GetAvailableTrips extends GetAvailableTrips {
  factory _$GetAvailableTrips([
    void Function(GetAvailableTripsBuilder)? updates,
  ]) => (GetAvailableTripsBuilder()..update(updates))._build();

  _$GetAvailableTrips._() : super._();
  @override
  GetAvailableTrips rebuild(void Function(GetAvailableTripsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAvailableTripsBuilder toBuilder() =>
      GetAvailableTripsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAvailableTrips;
  }

  @override
  int get hashCode {
    return 396847181;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetAvailableTrips').toString();
  }
}

class GetAvailableTripsBuilder
    implements Builder<GetAvailableTrips, GetAvailableTripsBuilder> {
  _$GetAvailableTrips? _$v;

  GetAvailableTripsBuilder();

  @override
  void replace(GetAvailableTrips other) {
    _$v = other as _$GetAvailableTrips;
  }

  @override
  void update(void Function(GetAvailableTripsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAvailableTrips build() => _build();

  _$GetAvailableTrips _build() {
    final _$result = _$v ?? _$GetAvailableTrips._();
    replace(_$result);
    return _$result;
  }
}

class _$GetCurrentLocation extends GetCurrentLocation {
  factory _$GetCurrentLocation([
    void Function(GetCurrentLocationBuilder)? updates,
  ]) => (GetCurrentLocationBuilder()..update(updates))._build();

  _$GetCurrentLocation._() : super._();
  @override
  GetCurrentLocation rebuild(
    void Function(GetCurrentLocationBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GetCurrentLocationBuilder toBuilder() =>
      GetCurrentLocationBuilder()..replace(this);

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
    _$v = other as _$GetCurrentLocation;
  }

  @override
  void update(void Function(GetCurrentLocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetCurrentLocation build() => _build();

  _$GetCurrentLocation _build() {
    final _$result = _$v ?? _$GetCurrentLocation._();
    replace(_$result);
    return _$result;
  }
}

class _$AcceptTrip extends AcceptTrip {
  @override
  final int tripId;

  factory _$AcceptTrip([void Function(AcceptTripBuilder)? updates]) =>
      (AcceptTripBuilder()..update(updates))._build();

  _$AcceptTrip._({required this.tripId}) : super._();
  @override
  AcceptTrip rebuild(void Function(AcceptTripBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AcceptTripBuilder toBuilder() => AcceptTripBuilder()..replace(this);

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
    return (newBuiltValueToStringHelper(
      r'AcceptTrip',
    )..add('tripId', tripId)).toString();
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
    _$v = other as _$AcceptTrip;
  }

  @override
  void update(void Function(AcceptTripBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AcceptTrip build() => _build();

  _$AcceptTrip _build() {
    final _$result =
        _$v ??
        _$AcceptTrip._(
          tripId: BuiltValueNullFieldError.checkNotNull(
            tripId,
            r'AcceptTrip',
            'tripId',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
