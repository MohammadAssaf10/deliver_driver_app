// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_vehicle_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterVehicle extends RegisterVehicle {
  factory _$RegisterVehicle([void Function(RegisterVehicleBuilder)? updates]) =>
      (new RegisterVehicleBuilder()..update(updates))._build();

  _$RegisterVehicle._() : super._();

  @override
  RegisterVehicle rebuild(void Function(RegisterVehicleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterVehicleBuilder toBuilder() =>
      new RegisterVehicleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterVehicle;
  }

  @override
  int get hashCode {
    return 917050363;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'RegisterVehicle').toString();
  }
}

class RegisterVehicleBuilder
    implements Builder<RegisterVehicle, RegisterVehicleBuilder> {
  _$RegisterVehicle? _$v;

  RegisterVehicleBuilder();

  @override
  void replace(RegisterVehicle other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterVehicle;
  }

  @override
  void update(void Function(RegisterVehicleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterVehicle build() => _build();

  _$RegisterVehicle _build() {
    final _$result = _$v ?? new _$RegisterVehicle._();
    replace(_$result);
    return _$result;
  }
}

class _$SelectLicenseImage extends SelectLicenseImage {
  @override
  final ImageSource imageSource;

  factory _$SelectLicenseImage(
          [void Function(SelectLicenseImageBuilder)? updates]) =>
      (new SelectLicenseImageBuilder()..update(updates))._build();

  _$SelectLicenseImage._({required this.imageSource}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        imageSource, r'SelectLicenseImage', 'imageSource');
  }

  @override
  SelectLicenseImage rebuild(
          void Function(SelectLicenseImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SelectLicenseImageBuilder toBuilder() =>
      new SelectLicenseImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SelectLicenseImage && imageSource == other.imageSource;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, imageSource.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SelectLicenseImage')
          ..add('imageSource', imageSource))
        .toString();
  }
}

class SelectLicenseImageBuilder
    implements Builder<SelectLicenseImage, SelectLicenseImageBuilder> {
  _$SelectLicenseImage? _$v;

  ImageSource? _imageSource;
  ImageSource? get imageSource => _$this._imageSource;
  set imageSource(ImageSource? imageSource) =>
      _$this._imageSource = imageSource;

  SelectLicenseImageBuilder();

  SelectLicenseImageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imageSource = $v.imageSource;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SelectLicenseImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SelectLicenseImage;
  }

  @override
  void update(void Function(SelectLicenseImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SelectLicenseImage build() => _build();

  _$SelectLicenseImage _build() {
    final _$result = _$v ??
        new _$SelectLicenseImage._(
          imageSource: BuiltValueNullFieldError.checkNotNull(
              imageSource, r'SelectLicenseImage', 'imageSource'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$SelectVehicleImage extends SelectVehicleImage {
  @override
  final ImageSource imageSource;

  factory _$SelectVehicleImage(
          [void Function(SelectVehicleImageBuilder)? updates]) =>
      (new SelectVehicleImageBuilder()..update(updates))._build();

  _$SelectVehicleImage._({required this.imageSource}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        imageSource, r'SelectVehicleImage', 'imageSource');
  }

  @override
  SelectVehicleImage rebuild(
          void Function(SelectVehicleImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SelectVehicleImageBuilder toBuilder() =>
      new SelectVehicleImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SelectVehicleImage && imageSource == other.imageSource;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, imageSource.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SelectVehicleImage')
          ..add('imageSource', imageSource))
        .toString();
  }
}

class SelectVehicleImageBuilder
    implements Builder<SelectVehicleImage, SelectVehicleImageBuilder> {
  _$SelectVehicleImage? _$v;

  ImageSource? _imageSource;
  ImageSource? get imageSource => _$this._imageSource;
  set imageSource(ImageSource? imageSource) =>
      _$this._imageSource = imageSource;

  SelectVehicleImageBuilder();

  SelectVehicleImageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imageSource = $v.imageSource;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SelectVehicleImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SelectVehicleImage;
  }

  @override
  void update(void Function(SelectVehicleImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SelectVehicleImage build() => _build();

  _$SelectVehicleImage _build() {
    final _$result = _$v ??
        new _$SelectVehicleImage._(
          imageSource: BuiltValueNullFieldError.checkNotNull(
              imageSource, r'SelectVehicleImage', 'imageSource'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
