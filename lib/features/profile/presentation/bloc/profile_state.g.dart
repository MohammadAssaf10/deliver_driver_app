// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProfileState extends ProfileState {
  @override
  final bool isLoading;
  @override
  final Profile? profile;
  @override
  final BlocStatus logoutStatus;

  factory _$ProfileState([void Function(ProfileStateBuilder)? updates]) =>
      (ProfileStateBuilder()..update(updates))._build();

  _$ProfileState._({
    required this.isLoading,
    this.profile,
    required this.logoutStatus,
  }) : super._();
  @override
  ProfileState rebuild(void Function(ProfileStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileStateBuilder toBuilder() => ProfileStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileState &&
        isLoading == other.isLoading &&
        profile == other.profile &&
        logoutStatus == other.logoutStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, profile.hashCode);
    _$hash = $jc(_$hash, logoutStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProfileState')
          ..add('isLoading', isLoading)
          ..add('profile', profile)
          ..add('logoutStatus', logoutStatus))
        .toString();
  }
}

class ProfileStateBuilder
    implements Builder<ProfileState, ProfileStateBuilder> {
  _$ProfileState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  Profile? _profile;
  Profile? get profile => _$this._profile;
  set profile(Profile? profile) => _$this._profile = profile;

  BlocStatus? _logoutStatus;
  BlocStatus? get logoutStatus => _$this._logoutStatus;
  set logoutStatus(BlocStatus? logoutStatus) =>
      _$this._logoutStatus = logoutStatus;

  ProfileStateBuilder();

  ProfileStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _profile = $v.profile;
      _logoutStatus = $v.logoutStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileState other) {
    _$v = other as _$ProfileState;
  }

  @override
  void update(void Function(ProfileStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProfileState build() => _build();

  _$ProfileState _build() {
    final _$result =
        _$v ??
        _$ProfileState._(
          isLoading: BuiltValueNullFieldError.checkNotNull(
            isLoading,
            r'ProfileState',
            'isLoading',
          ),
          profile: profile,
          logoutStatus: BuiltValueNullFieldError.checkNotNull(
            logoutStatus,
            r'ProfileState',
            'logoutStatus',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
