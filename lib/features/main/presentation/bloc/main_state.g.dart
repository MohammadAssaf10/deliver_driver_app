// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MainState extends MainState {
  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final int pageIndex;
  @override
  final CurrentTrip? currentTrip;
  @override
  final PaginationStateData<TripModel> trips;
  @override
  final bool isListenerAdded;

  factory _$MainState([void Function(MainStateBuilder)? updates]) =>
      (new MainStateBuilder()..update(updates))._build();

  _$MainState._(
      {required this.isLoading,
      required this.isError,
      required this.pageIndex,
      this.currentTrip,
      required this.trips,
      required this.isListenerAdded})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(isLoading, r'MainState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(isError, r'MainState', 'isError');
    BuiltValueNullFieldError.checkNotNull(pageIndex, r'MainState', 'pageIndex');
    BuiltValueNullFieldError.checkNotNull(trips, r'MainState', 'trips');
    BuiltValueNullFieldError.checkNotNull(
        isListenerAdded, r'MainState', 'isListenerAdded');
  }

  @override
  MainState rebuild(void Function(MainStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MainStateBuilder toBuilder() => new MainStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MainState &&
        isLoading == other.isLoading &&
        isError == other.isError &&
        pageIndex == other.pageIndex &&
        currentTrip == other.currentTrip &&
        trips == other.trips &&
        isListenerAdded == other.isListenerAdded;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, isError.hashCode);
    _$hash = $jc(_$hash, pageIndex.hashCode);
    _$hash = $jc(_$hash, currentTrip.hashCode);
    _$hash = $jc(_$hash, trips.hashCode);
    _$hash = $jc(_$hash, isListenerAdded.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MainState')
          ..add('isLoading', isLoading)
          ..add('isError', isError)
          ..add('pageIndex', pageIndex)
          ..add('currentTrip', currentTrip)
          ..add('trips', trips)
          ..add('isListenerAdded', isListenerAdded))
        .toString();
  }
}

class MainStateBuilder implements Builder<MainState, MainStateBuilder> {
  _$MainState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isError;
  bool? get isError => _$this._isError;
  set isError(bool? isError) => _$this._isError = isError;

  int? _pageIndex;
  int? get pageIndex => _$this._pageIndex;
  set pageIndex(int? pageIndex) => _$this._pageIndex = pageIndex;

  CurrentTrip? _currentTrip;
  CurrentTrip? get currentTrip => _$this._currentTrip;
  set currentTrip(CurrentTrip? currentTrip) =>
      _$this._currentTrip = currentTrip;

  PaginationStateDataBuilder<TripModel>? _trips;
  PaginationStateDataBuilder<TripModel> get trips =>
      _$this._trips ??= new PaginationStateDataBuilder<TripModel>();
  set trips(PaginationStateDataBuilder<TripModel>? trips) =>
      _$this._trips = trips;

  bool? _isListenerAdded;
  bool? get isListenerAdded => _$this._isListenerAdded;
  set isListenerAdded(bool? isListenerAdded) =>
      _$this._isListenerAdded = isListenerAdded;

  MainStateBuilder();

  MainStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _isError = $v.isError;
      _pageIndex = $v.pageIndex;
      _currentTrip = $v.currentTrip;
      _trips = $v.trips.toBuilder();
      _isListenerAdded = $v.isListenerAdded;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MainState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MainState;
  }

  @override
  void update(void Function(MainStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MainState build() => _build();

  _$MainState _build() {
    _$MainState _$result;
    try {
      _$result = _$v ??
          new _$MainState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'MainState', 'isLoading'),
            isError: BuiltValueNullFieldError.checkNotNull(
                isError, r'MainState', 'isError'),
            pageIndex: BuiltValueNullFieldError.checkNotNull(
                pageIndex, r'MainState', 'pageIndex'),
            currentTrip: currentTrip,
            trips: trips.build(),
            isListenerAdded: BuiltValueNullFieldError.checkNotNull(
                isListenerAdded, r'MainState', 'isListenerAdded'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'trips';
        trips.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MainState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
