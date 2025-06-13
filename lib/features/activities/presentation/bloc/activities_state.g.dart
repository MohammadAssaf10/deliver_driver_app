// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ActivitiesState extends ActivitiesState {
  @override
  final BlocStatus financialStatus;
  @override
  final Financial? financial;

  factory _$ActivitiesState([void Function(ActivitiesStateBuilder)? updates]) =>
      (ActivitiesStateBuilder()..update(updates))._build();

  _$ActivitiesState._({required this.financialStatus, this.financial})
    : super._();
  @override
  ActivitiesState rebuild(void Function(ActivitiesStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActivitiesStateBuilder toBuilder() => ActivitiesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivitiesState &&
        financialStatus == other.financialStatus &&
        financial == other.financial;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, financialStatus.hashCode);
    _$hash = $jc(_$hash, financial.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ActivitiesState')
          ..add('financialStatus', financialStatus)
          ..add('financial', financial))
        .toString();
  }
}

class ActivitiesStateBuilder
    implements Builder<ActivitiesState, ActivitiesStateBuilder> {
  _$ActivitiesState? _$v;

  BlocStatus? _financialStatus;
  BlocStatus? get financialStatus => _$this._financialStatus;
  set financialStatus(BlocStatus? financialStatus) =>
      _$this._financialStatus = financialStatus;

  Financial? _financial;
  Financial? get financial => _$this._financial;
  set financial(Financial? financial) => _$this._financial = financial;

  ActivitiesStateBuilder();

  ActivitiesStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _financialStatus = $v.financialStatus;
      _financial = $v.financial;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActivitiesState other) {
    _$v = other as _$ActivitiesState;
  }

  @override
  void update(void Function(ActivitiesStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ActivitiesState build() => _build();

  _$ActivitiesState _build() {
    final _$result =
        _$v ??
        _$ActivitiesState._(
          financialStatus: BuiltValueNullFieldError.checkNotNull(
            financialStatus,
            r'ActivitiesState',
            'financialStatus',
          ),
          financial: financial,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
