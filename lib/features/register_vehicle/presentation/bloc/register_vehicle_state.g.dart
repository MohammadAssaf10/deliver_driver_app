// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_vehicle_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterVehicleState extends RegisterVehicleState {
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isError;
  @override
  final XFile? licenseImage;
  @override
  final XFile? vehicleImage;

  factory _$RegisterVehicleState([
    void Function(RegisterVehicleStateBuilder)? updates,
  ]) => (RegisterVehicleStateBuilder()..update(updates))._build();

  _$RegisterVehicleState._({
    required this.isLoading,
    required this.isSuccess,
    required this.isError,
    this.licenseImage,
    this.vehicleImage,
  }) : super._();
  @override
  RegisterVehicleState rebuild(
    void Function(RegisterVehicleStateBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  RegisterVehicleStateBuilder toBuilder() =>
      RegisterVehicleStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterVehicleState &&
        isLoading == other.isLoading &&
        isSuccess == other.isSuccess &&
        isError == other.isError &&
        licenseImage == other.licenseImage &&
        vehicleImage == other.vehicleImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, isSuccess.hashCode);
    _$hash = $jc(_$hash, isError.hashCode);
    _$hash = $jc(_$hash, licenseImage.hashCode);
    _$hash = $jc(_$hash, vehicleImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterVehicleState')
          ..add('isLoading', isLoading)
          ..add('isSuccess', isSuccess)
          ..add('isError', isError)
          ..add('licenseImage', licenseImage)
          ..add('vehicleImage', vehicleImage))
        .toString();
  }
}

class RegisterVehicleStateBuilder
    implements Builder<RegisterVehicleState, RegisterVehicleStateBuilder> {
  _$RegisterVehicleState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isError;
  bool? get isError => _$this._isError;
  set isError(bool? isError) => _$this._isError = isError;

  XFile? _licenseImage;
  XFile? get licenseImage => _$this._licenseImage;
  set licenseImage(XFile? licenseImage) => _$this._licenseImage = licenseImage;

  XFile? _vehicleImage;
  XFile? get vehicleImage => _$this._vehicleImage;
  set vehicleImage(XFile? vehicleImage) => _$this._vehicleImage = vehicleImage;

  RegisterVehicleStateBuilder();

  RegisterVehicleStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _isSuccess = $v.isSuccess;
      _isError = $v.isError;
      _licenseImage = $v.licenseImage;
      _vehicleImage = $v.vehicleImage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterVehicleState other) {
    _$v = other as _$RegisterVehicleState;
  }

  @override
  void update(void Function(RegisterVehicleStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterVehicleState build() => _build();

  _$RegisterVehicleState _build() {
    final _$result =
        _$v ??
        _$RegisterVehicleState._(
          isLoading: BuiltValueNullFieldError.checkNotNull(
            isLoading,
            r'RegisterVehicleState',
            'isLoading',
          ),
          isSuccess: BuiltValueNullFieldError.checkNotNull(
            isSuccess,
            r'RegisterVehicleState',
            'isSuccess',
          ),
          isError: BuiltValueNullFieldError.checkNotNull(
            isError,
            r'RegisterVehicleState',
            'isError',
          ),
          licenseImage: licenseImage,
          vehicleImage: vehicleImage,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
