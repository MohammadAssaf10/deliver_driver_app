// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SetPageIndex extends SetPageIndex {
  @override
  final int pageIndex;

  factory _$SetPageIndex([void Function(SetPageIndexBuilder)? updates]) =>
      (new SetPageIndexBuilder()..update(updates))._build();

  _$SetPageIndex._({required this.pageIndex}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        pageIndex, r'SetPageIndex', 'pageIndex');
  }

  @override
  SetPageIndex rebuild(void Function(SetPageIndexBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetPageIndexBuilder toBuilder() => new SetPageIndexBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetPageIndex && pageIndex == other.pageIndex;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pageIndex.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetPageIndex')
          ..add('pageIndex', pageIndex))
        .toString();
  }
}

class SetPageIndexBuilder
    implements Builder<SetPageIndex, SetPageIndexBuilder> {
  _$SetPageIndex? _$v;

  int? _pageIndex;
  int? get pageIndex => _$this._pageIndex;
  set pageIndex(int? pageIndex) => _$this._pageIndex = pageIndex;

  SetPageIndexBuilder();

  SetPageIndexBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pageIndex = $v.pageIndex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetPageIndex other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetPageIndex;
  }

  @override
  void update(void Function(SetPageIndexBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetPageIndex build() => _build();

  _$SetPageIndex _build() {
    final _$result = _$v ??
        new _$SetPageIndex._(
          pageIndex: BuiltValueNullFieldError.checkNotNull(
              pageIndex, r'SetPageIndex', 'pageIndex'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GetCurrentTrip extends GetCurrentTrip {
  factory _$GetCurrentTrip([void Function(GetCurrentTripBuilder)? updates]) =>
      (new GetCurrentTripBuilder()..update(updates))._build();

  _$GetCurrentTrip._() : super._();

  @override
  GetCurrentTrip rebuild(void Function(GetCurrentTripBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetCurrentTripBuilder toBuilder() =>
      new GetCurrentTripBuilder()..replace(this);

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
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetCurrentTrip;
  }

  @override
  void update(void Function(GetCurrentTripBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetCurrentTrip build() => _build();

  _$GetCurrentTrip _build() {
    final _$result = _$v ?? new _$GetCurrentTrip._();
    replace(_$result);
    return _$result;
  }
}

class _$GetAvailableTrips extends GetAvailableTrips {
  factory _$GetAvailableTrips(
          [void Function(GetAvailableTripsBuilder)? updates]) =>
      (new GetAvailableTripsBuilder()..update(updates))._build();

  _$GetAvailableTrips._() : super._();

  @override
  GetAvailableTrips rebuild(void Function(GetAvailableTripsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAvailableTripsBuilder toBuilder() =>
      new GetAvailableTripsBuilder()..replace(this);

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
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetAvailableTrips;
  }

  @override
  void update(void Function(GetAvailableTripsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAvailableTrips build() => _build();

  _$GetAvailableTrips _build() {
    final _$result = _$v ?? new _$GetAvailableTrips._();
    replace(_$result);
    return _$result;
  }
}

class _$GetCurrentLocation extends GetCurrentLocation {
  @override
  final void Function()? onComplete;

  factory _$GetCurrentLocation(
          [void Function(GetCurrentLocationBuilder)? updates]) =>
      (new GetCurrentLocationBuilder()..update(updates))._build();

  _$GetCurrentLocation._({this.onComplete}) : super._();

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
    final dynamic _$dynamicOther = other;
    return other is GetCurrentLocation &&
        onComplete == _$dynamicOther.onComplete;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, onComplete.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetCurrentLocation')
          ..add('onComplete', onComplete))
        .toString();
  }
}

class GetCurrentLocationBuilder
    implements Builder<GetCurrentLocation, GetCurrentLocationBuilder> {
  _$GetCurrentLocation? _$v;

  void Function()? _onComplete;
  void Function()? get onComplete => _$this._onComplete;
  set onComplete(void Function()? onComplete) =>
      _$this._onComplete = onComplete;

  GetCurrentLocationBuilder();

  GetCurrentLocationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _onComplete = $v.onComplete;
      _$v = null;
    }
    return this;
  }

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
    final _$result = _$v ??
        new _$GetCurrentLocation._(
          onComplete: onComplete,
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
