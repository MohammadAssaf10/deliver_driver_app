// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MainState extends MainState {
  @override
  final int pageIndex;

  factory _$MainState([void Function(MainStateBuilder)? updates]) =>
      (MainStateBuilder()..update(updates))._build();

  _$MainState._({required this.pageIndex}) : super._();
  @override
  MainState rebuild(void Function(MainStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MainStateBuilder toBuilder() => MainStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MainState && pageIndex == other.pageIndex;
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
    return (newBuiltValueToStringHelper(
      r'MainState',
    )..add('pageIndex', pageIndex)).toString();
  }
}

class MainStateBuilder implements Builder<MainState, MainStateBuilder> {
  _$MainState? _$v;

  int? _pageIndex;
  int? get pageIndex => _$this._pageIndex;
  set pageIndex(int? pageIndex) => _$this._pageIndex = pageIndex;

  MainStateBuilder();

  MainStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pageIndex = $v.pageIndex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MainState other) {
    _$v = other as _$MainState;
  }

  @override
  void update(void Function(MainStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MainState build() => _build();

  _$MainState _build() {
    final _$result =
        _$v ??
        _$MainState._(
          pageIndex: BuiltValueNullFieldError.checkNotNull(
            pageIndex,
            r'MainState',
            'pageIndex',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
