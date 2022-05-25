// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'office_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OfficeInfo _$OfficeInfoFromJson(Map<String, dynamic> json) {
  return _OfficeInfo.fromJson(json);
}

/// @nodoc
mixin _$OfficeInfo {
  HostType get host => throw _privateConstructorUsedError;
  PlatformType? get platform => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfficeInfoCopyWith<OfficeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficeInfoCopyWith<$Res> {
  factory $OfficeInfoCopyWith(
          OfficeInfo value, $Res Function(OfficeInfo) then) =
      _$OfficeInfoCopyWithImpl<$Res>;
  $Res call({HostType host, PlatformType? platform});
}

/// @nodoc
class _$OfficeInfoCopyWithImpl<$Res> implements $OfficeInfoCopyWith<$Res> {
  _$OfficeInfoCopyWithImpl(this._value, this._then);

  final OfficeInfo _value;
  // ignore: unused_field
  final $Res Function(OfficeInfo) _then;

  @override
  $Res call({
    Object? host = freezed,
    Object? platform = freezed,
  }) {
    return _then(_value.copyWith(
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as HostType,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as PlatformType?,
    ));
  }
}

/// @nodoc
abstract class _$$_OfficeInfoCopyWith<$Res>
    implements $OfficeInfoCopyWith<$Res> {
  factory _$$_OfficeInfoCopyWith(
          _$_OfficeInfo value, $Res Function(_$_OfficeInfo) then) =
      __$$_OfficeInfoCopyWithImpl<$Res>;
  @override
  $Res call({HostType host, PlatformType? platform});
}

/// @nodoc
class __$$_OfficeInfoCopyWithImpl<$Res> extends _$OfficeInfoCopyWithImpl<$Res>
    implements _$$_OfficeInfoCopyWith<$Res> {
  __$$_OfficeInfoCopyWithImpl(
      _$_OfficeInfo _value, $Res Function(_$_OfficeInfo) _then)
      : super(_value, (v) => _then(v as _$_OfficeInfo));

  @override
  _$_OfficeInfo get _value => super._value as _$_OfficeInfo;

  @override
  $Res call({
    Object? host = freezed,
    Object? platform = freezed,
  }) {
    return _then(_$_OfficeInfo(
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as HostType,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as PlatformType?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_OfficeInfo extends _OfficeInfo {
  const _$_OfficeInfo({required this.host, this.platform}) : super._();

  factory _$_OfficeInfo.fromJson(Map<String, dynamic> json) =>
      _$$_OfficeInfoFromJson(json);

  @override
  final HostType host;
  @override
  final PlatformType? platform;

  @override
  String toString() {
    return 'OfficeInfo(host: $host, platform: $platform)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OfficeInfo &&
            const DeepCollectionEquality().equals(other.host, host) &&
            const DeepCollectionEquality().equals(other.platform, platform));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(host),
      const DeepCollectionEquality().hash(platform));

  @JsonKey(ignore: true)
  @override
  _$$_OfficeInfoCopyWith<_$_OfficeInfo> get copyWith =>
      __$$_OfficeInfoCopyWithImpl<_$_OfficeInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OfficeInfoToJson(this);
  }
}

abstract class _OfficeInfo extends OfficeInfo {
  const factory _OfficeInfo(
      {required final HostType host,
      final PlatformType? platform}) = _$_OfficeInfo;
  const _OfficeInfo._() : super._();

  factory _OfficeInfo.fromJson(Map<String, dynamic> json) =
      _$_OfficeInfo.fromJson;

  @override
  HostType get host => throw _privateConstructorUsedError;
  @override
  PlatformType? get platform => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OfficeInfoCopyWith<_$_OfficeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
