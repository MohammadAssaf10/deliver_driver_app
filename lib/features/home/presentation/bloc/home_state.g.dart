// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HomeState extends HomeState {
  @override
  final BlocStatus tripStatus;
  @override
  final Trip? currentTrip;
  @override
  final PaginationStateData<Trip> trips;
  @override
  final bool isListenerAdded;
  @override
  final BlocStatus acceptTripStatus;
  @override
  final Address? currentAddress;

  factory _$HomeState([void Function(HomeStateBuilder)? updates]) =>
      (HomeStateBuilder()..update(updates))._build();

  _$HomeState._({
    required this.tripStatus,
    this.currentTrip,
    required this.trips,
    required this.isListenerAdded,
    required this.acceptTripStatus,
    this.currentAddress,
  }) : super._();
  @override
  HomeState rebuild(void Function(HomeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeStateBuilder toBuilder() => HomeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeState &&
        tripStatus == other.tripStatus &&
        currentTrip == other.currentTrip &&
        trips == other.trips &&
        isListenerAdded == other.isListenerAdded &&
        acceptTripStatus == other.acceptTripStatus &&
        currentAddress == other.currentAddress;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, tripStatus.hashCode);
    _$hash = $jc(_$hash, currentTrip.hashCode);
    _$hash = $jc(_$hash, trips.hashCode);
    _$hash = $jc(_$hash, isListenerAdded.hashCode);
    _$hash = $jc(_$hash, acceptTripStatus.hashCode);
    _$hash = $jc(_$hash, currentAddress.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HomeState')
          ..add('tripStatus', tripStatus)
          ..add('currentTrip', currentTrip)
          ..add('trips', trips)
          ..add('isListenerAdded', isListenerAdded)
          ..add('acceptTripStatus', acceptTripStatus)
          ..add('currentAddress', currentAddress))
        .toString();
  }
}

class HomeStateBuilder implements Builder<HomeState, HomeStateBuilder> {
  _$HomeState? _$v;

  BlocStatus? _tripStatus;
  BlocStatus? get tripStatus => _$this._tripStatus;
  set tripStatus(BlocStatus? tripStatus) => _$this._tripStatus = tripStatus;

  Trip? _currentTrip;
  Trip? get currentTrip => _$this._currentTrip;
  set currentTrip(Trip? currentTrip) => _$this._currentTrip = currentTrip;

  PaginationStateDataBuilder<Trip>? _trips;
  PaginationStateDataBuilder<Trip> get trips =>
      _$this._trips ??= PaginationStateDataBuilder<Trip>();
  set trips(PaginationStateDataBuilder<Trip>? trips) => _$this._trips = trips;

  bool? _isListenerAdded;
  bool? get isListenerAdded => _$this._isListenerAdded;
  set isListenerAdded(bool? isListenerAdded) =>
      _$this._isListenerAdded = isListenerAdded;

  BlocStatus? _acceptTripStatus;
  BlocStatus? get acceptTripStatus => _$this._acceptTripStatus;
  set acceptTripStatus(BlocStatus? acceptTripStatus) =>
      _$this._acceptTripStatus = acceptTripStatus;

  Address? _currentAddress;
  Address? get currentAddress => _$this._currentAddress;
  set currentAddress(Address? currentAddress) =>
      _$this._currentAddress = currentAddress;

  HomeStateBuilder();

  HomeStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tripStatus = $v.tripStatus;
      _currentTrip = $v.currentTrip;
      _trips = $v.trips.toBuilder();
      _isListenerAdded = $v.isListenerAdded;
      _acceptTripStatus = $v.acceptTripStatus;
      _currentAddress = $v.currentAddress;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeState other) {
    _$v = other as _$HomeState;
  }

  @override
  void update(void Function(HomeStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HomeState build() => _build();

  _$HomeState _build() {
    _$HomeState _$result;
    try {
      _$result =
          _$v ??
          _$HomeState._(
            tripStatus: BuiltValueNullFieldError.checkNotNull(
              tripStatus,
              r'HomeState',
              'tripStatus',
            ),
            currentTrip: currentTrip,
            trips: trips.build(),
            isListenerAdded: BuiltValueNullFieldError.checkNotNull(
              isListenerAdded,
              r'HomeState',
              'isListenerAdded',
            ),
            acceptTripStatus: BuiltValueNullFieldError.checkNotNull(
              acceptTripStatus,
              r'HomeState',
              'acceptTripStatus',
            ),
            currentAddress: currentAddress,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'trips';
        trips.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'HomeState',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
