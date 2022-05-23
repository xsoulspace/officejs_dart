// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'excel_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorksheetDeletedEventArgs _$WorksheetDeletedEventArgsFromJson(
    Map<String, dynamic> json) {
  return _WorksheetDeletedEventArgs.fromJson(json);
}

/// @nodoc
mixin _$WorksheetDeletedEventArgs {
  /// Gets the source of the event. See Excel.[EventSource] for details.
  ///
  /// [Api set: ExcelApi 1.7]
  EventSource get source => throw _privateConstructorUsedError;

  /// Gets the ID of the worksheet that is deleted from the workbook.
  ///
  /// [Api set: ExcelApi 1.7]
  String get worksheetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorksheetDeletedEventArgsCopyWith<WorksheetDeletedEventArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorksheetDeletedEventArgsCopyWith<$Res> {
  factory $WorksheetDeletedEventArgsCopyWith(WorksheetDeletedEventArgs value,
          $Res Function(WorksheetDeletedEventArgs) then) =
      _$WorksheetDeletedEventArgsCopyWithImpl<$Res>;
  $Res call({EventSource source, String worksheetId});
}

/// @nodoc
class _$WorksheetDeletedEventArgsCopyWithImpl<$Res>
    implements $WorksheetDeletedEventArgsCopyWith<$Res> {
  _$WorksheetDeletedEventArgsCopyWithImpl(this._value, this._then);

  final WorksheetDeletedEventArgs _value;
  // ignore: unused_field
  final $Res Function(WorksheetDeletedEventArgs) _then;

  @override
  $Res call({
    Object? source = freezed,
    Object? worksheetId = freezed,
  }) {
    return _then(_value.copyWith(
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as EventSource,
      worksheetId: worksheetId == freezed
          ? _value.worksheetId
          : worksheetId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_WorksheetDeletedEventArgsCopyWith<$Res>
    implements $WorksheetDeletedEventArgsCopyWith<$Res> {
  factory _$$_WorksheetDeletedEventArgsCopyWith(
          _$_WorksheetDeletedEventArgs value,
          $Res Function(_$_WorksheetDeletedEventArgs) then) =
      __$$_WorksheetDeletedEventArgsCopyWithImpl<$Res>;
  @override
  $Res call({EventSource source, String worksheetId});
}

/// @nodoc
class __$$_WorksheetDeletedEventArgsCopyWithImpl<$Res>
    extends _$WorksheetDeletedEventArgsCopyWithImpl<$Res>
    implements _$$_WorksheetDeletedEventArgsCopyWith<$Res> {
  __$$_WorksheetDeletedEventArgsCopyWithImpl(
      _$_WorksheetDeletedEventArgs _value,
      $Res Function(_$_WorksheetDeletedEventArgs) _then)
      : super(_value, (v) => _then(v as _$_WorksheetDeletedEventArgs));

  @override
  _$_WorksheetDeletedEventArgs get _value =>
      super._value as _$_WorksheetDeletedEventArgs;

  @override
  $Res call({
    Object? source = freezed,
    Object? worksheetId = freezed,
  }) {
    return _then(_$_WorksheetDeletedEventArgs(
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as EventSource,
      worksheetId: worksheetId == freezed
          ? _value.worksheetId
          : worksheetId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_WorksheetDeletedEventArgs extends _WorksheetDeletedEventArgs {
  const _$_WorksheetDeletedEventArgs(
      {required this.source, required this.worksheetId})
      : super._();

  factory _$_WorksheetDeletedEventArgs.fromJson(Map<String, dynamic> json) =>
      _$$_WorksheetDeletedEventArgsFromJson(json);

  /// Gets the source of the event. See Excel.[EventSource] for details.
  ///
  /// [Api set: ExcelApi 1.7]
  @override
  final EventSource source;

  /// Gets the ID of the worksheet that is deleted from the workbook.
  ///
  /// [Api set: ExcelApi 1.7]
  @override
  final String worksheetId;

  @override
  String toString() {
    return 'WorksheetDeletedEventArgs(source: $source, worksheetId: $worksheetId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorksheetDeletedEventArgs &&
            const DeepCollectionEquality().equals(other.source, source) &&
            const DeepCollectionEquality()
                .equals(other.worksheetId, worksheetId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(source),
      const DeepCollectionEquality().hash(worksheetId));

  @JsonKey(ignore: true)
  @override
  _$$_WorksheetDeletedEventArgsCopyWith<_$_WorksheetDeletedEventArgs>
      get copyWith => __$$_WorksheetDeletedEventArgsCopyWithImpl<
          _$_WorksheetDeletedEventArgs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorksheetDeletedEventArgsToJson(this);
  }
}

abstract class _WorksheetDeletedEventArgs extends WorksheetDeletedEventArgs {
  const factory _WorksheetDeletedEventArgs(
      {required final EventSource source,
      required final String worksheetId}) = _$_WorksheetDeletedEventArgs;
  const _WorksheetDeletedEventArgs._() : super._();

  factory _WorksheetDeletedEventArgs.fromJson(Map<String, dynamic> json) =
      _$_WorksheetDeletedEventArgs.fromJson;

  @override

  /// Gets the source of the event. See Excel.[EventSource] for details.
  ///
  /// [Api set: ExcelApi 1.7]
  EventSource get source => throw _privateConstructorUsedError;
  @override

  /// Gets the ID of the worksheet that is deleted from the workbook.
  ///
  /// [Api set: ExcelApi 1.7]
  String get worksheetId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WorksheetDeletedEventArgsCopyWith<_$_WorksheetDeletedEventArgs>
      get copyWith => throw _privateConstructorUsedError;
}

WorksheetAddedEventArgs _$WorksheetAddedEventArgsFromJson(
    Map<String, dynamic> json) {
  return _WorksheetAddedEventArgs.fromJson(json);
}

/// @nodoc
mixin _$WorksheetAddedEventArgs {
  /// Gets the source of the event. See Excel.[EventSource] for details.
  ///
  /// [Api set: ExcelApi 1.7]
  EventSource get source => throw _privateConstructorUsedError;

  /// Gets the ID of the worksheet that is added to the workbook.
  ///
  /// [Api set: ExcelApi 1.7]
  String get worksheetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorksheetAddedEventArgsCopyWith<WorksheetAddedEventArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorksheetAddedEventArgsCopyWith<$Res> {
  factory $WorksheetAddedEventArgsCopyWith(WorksheetAddedEventArgs value,
          $Res Function(WorksheetAddedEventArgs) then) =
      _$WorksheetAddedEventArgsCopyWithImpl<$Res>;
  $Res call({EventSource source, String worksheetId});
}

/// @nodoc
class _$WorksheetAddedEventArgsCopyWithImpl<$Res>
    implements $WorksheetAddedEventArgsCopyWith<$Res> {
  _$WorksheetAddedEventArgsCopyWithImpl(this._value, this._then);

  final WorksheetAddedEventArgs _value;
  // ignore: unused_field
  final $Res Function(WorksheetAddedEventArgs) _then;

  @override
  $Res call({
    Object? source = freezed,
    Object? worksheetId = freezed,
  }) {
    return _then(_value.copyWith(
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as EventSource,
      worksheetId: worksheetId == freezed
          ? _value.worksheetId
          : worksheetId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_WorksheetAddedEventArgsCopyWith<$Res>
    implements $WorksheetAddedEventArgsCopyWith<$Res> {
  factory _$$_WorksheetAddedEventArgsCopyWith(_$_WorksheetAddedEventArgs value,
          $Res Function(_$_WorksheetAddedEventArgs) then) =
      __$$_WorksheetAddedEventArgsCopyWithImpl<$Res>;
  @override
  $Res call({EventSource source, String worksheetId});
}

/// @nodoc
class __$$_WorksheetAddedEventArgsCopyWithImpl<$Res>
    extends _$WorksheetAddedEventArgsCopyWithImpl<$Res>
    implements _$$_WorksheetAddedEventArgsCopyWith<$Res> {
  __$$_WorksheetAddedEventArgsCopyWithImpl(_$_WorksheetAddedEventArgs _value,
      $Res Function(_$_WorksheetAddedEventArgs) _then)
      : super(_value, (v) => _then(v as _$_WorksheetAddedEventArgs));

  @override
  _$_WorksheetAddedEventArgs get _value =>
      super._value as _$_WorksheetAddedEventArgs;

  @override
  $Res call({
    Object? source = freezed,
    Object? worksheetId = freezed,
  }) {
    return _then(_$_WorksheetAddedEventArgs(
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as EventSource,
      worksheetId: worksheetId == freezed
          ? _value.worksheetId
          : worksheetId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_WorksheetAddedEventArgs extends _WorksheetAddedEventArgs {
  const _$_WorksheetAddedEventArgs(
      {required this.source, required this.worksheetId})
      : super._();

  factory _$_WorksheetAddedEventArgs.fromJson(Map<String, dynamic> json) =>
      _$$_WorksheetAddedEventArgsFromJson(json);

  /// Gets the source of the event. See Excel.[EventSource] for details.
  ///
  /// [Api set: ExcelApi 1.7]
  @override
  final EventSource source;

  /// Gets the ID of the worksheet that is added to the workbook.
  ///
  /// [Api set: ExcelApi 1.7]
  @override
  final String worksheetId;

  @override
  String toString() {
    return 'WorksheetAddedEventArgs(source: $source, worksheetId: $worksheetId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorksheetAddedEventArgs &&
            const DeepCollectionEquality().equals(other.source, source) &&
            const DeepCollectionEquality()
                .equals(other.worksheetId, worksheetId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(source),
      const DeepCollectionEquality().hash(worksheetId));

  @JsonKey(ignore: true)
  @override
  _$$_WorksheetAddedEventArgsCopyWith<_$_WorksheetAddedEventArgs>
      get copyWith =>
          __$$_WorksheetAddedEventArgsCopyWithImpl<_$_WorksheetAddedEventArgs>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorksheetAddedEventArgsToJson(this);
  }
}

abstract class _WorksheetAddedEventArgs extends WorksheetAddedEventArgs {
  const factory _WorksheetAddedEventArgs(
      {required final EventSource source,
      required final String worksheetId}) = _$_WorksheetAddedEventArgs;
  const _WorksheetAddedEventArgs._() : super._();

  factory _WorksheetAddedEventArgs.fromJson(Map<String, dynamic> json) =
      _$_WorksheetAddedEventArgs.fromJson;

  @override

  /// Gets the source of the event. See Excel.[EventSource] for details.
  ///
  /// [Api set: ExcelApi 1.7]
  EventSource get source => throw _privateConstructorUsedError;
  @override

  /// Gets the ID of the worksheet that is added to the workbook.
  ///
  /// [Api set: ExcelApi 1.7]
  String get worksheetId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WorksheetAddedEventArgsCopyWith<_$_WorksheetAddedEventArgs>
      get copyWith => throw _privateConstructorUsedError;
}

WorksheetActivatedEventArgs _$WorksheetActivatedEventArgsFromJson(
    Map<String, dynamic> json) {
  return _WorksheetActivatedEventArgs.fromJson(json);
}

/// @nodoc
mixin _$WorksheetActivatedEventArgs {
  /// Gets the ID of the worksheet that is added to the workbook.
  ///
  /// [Api set: ExcelApi 1.7]
  String get worksheetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorksheetActivatedEventArgsCopyWith<WorksheetActivatedEventArgs>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorksheetActivatedEventArgsCopyWith<$Res> {
  factory $WorksheetActivatedEventArgsCopyWith(
          WorksheetActivatedEventArgs value,
          $Res Function(WorksheetActivatedEventArgs) then) =
      _$WorksheetActivatedEventArgsCopyWithImpl<$Res>;
  $Res call({String worksheetId});
}

/// @nodoc
class _$WorksheetActivatedEventArgsCopyWithImpl<$Res>
    implements $WorksheetActivatedEventArgsCopyWith<$Res> {
  _$WorksheetActivatedEventArgsCopyWithImpl(this._value, this._then);

  final WorksheetActivatedEventArgs _value;
  // ignore: unused_field
  final $Res Function(WorksheetActivatedEventArgs) _then;

  @override
  $Res call({
    Object? worksheetId = freezed,
  }) {
    return _then(_value.copyWith(
      worksheetId: worksheetId == freezed
          ? _value.worksheetId
          : worksheetId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_WorksheetActivatedEventArgsCopyWith<$Res>
    implements $WorksheetActivatedEventArgsCopyWith<$Res> {
  factory _$$_WorksheetActivatedEventArgsCopyWith(
          _$_WorksheetActivatedEventArgs value,
          $Res Function(_$_WorksheetActivatedEventArgs) then) =
      __$$_WorksheetActivatedEventArgsCopyWithImpl<$Res>;
  @override
  $Res call({String worksheetId});
}

/// @nodoc
class __$$_WorksheetActivatedEventArgsCopyWithImpl<$Res>
    extends _$WorksheetActivatedEventArgsCopyWithImpl<$Res>
    implements _$$_WorksheetActivatedEventArgsCopyWith<$Res> {
  __$$_WorksheetActivatedEventArgsCopyWithImpl(
      _$_WorksheetActivatedEventArgs _value,
      $Res Function(_$_WorksheetActivatedEventArgs) _then)
      : super(_value, (v) => _then(v as _$_WorksheetActivatedEventArgs));

  @override
  _$_WorksheetActivatedEventArgs get _value =>
      super._value as _$_WorksheetActivatedEventArgs;

  @override
  $Res call({
    Object? worksheetId = freezed,
  }) {
    return _then(_$_WorksheetActivatedEventArgs(
      worksheetId: worksheetId == freezed
          ? _value.worksheetId
          : worksheetId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_WorksheetActivatedEventArgs extends _WorksheetActivatedEventArgs {
  const _$_WorksheetActivatedEventArgs({required this.worksheetId}) : super._();

  factory _$_WorksheetActivatedEventArgs.fromJson(Map<String, dynamic> json) =>
      _$$_WorksheetActivatedEventArgsFromJson(json);

  /// Gets the ID of the worksheet that is added to the workbook.
  ///
  /// [Api set: ExcelApi 1.7]
  @override
  final String worksheetId;

  @override
  String toString() {
    return 'WorksheetActivatedEventArgs(worksheetId: $worksheetId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorksheetActivatedEventArgs &&
            const DeepCollectionEquality()
                .equals(other.worksheetId, worksheetId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(worksheetId));

  @JsonKey(ignore: true)
  @override
  _$$_WorksheetActivatedEventArgsCopyWith<_$_WorksheetActivatedEventArgs>
      get copyWith => __$$_WorksheetActivatedEventArgsCopyWithImpl<
          _$_WorksheetActivatedEventArgs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorksheetActivatedEventArgsToJson(this);
  }
}

abstract class _WorksheetActivatedEventArgs
    extends WorksheetActivatedEventArgs {
  const factory _WorksheetActivatedEventArgs(
      {required final String worksheetId}) = _$_WorksheetActivatedEventArgs;
  const _WorksheetActivatedEventArgs._() : super._();

  factory _WorksheetActivatedEventArgs.fromJson(Map<String, dynamic> json) =
      _$_WorksheetActivatedEventArgs.fromJson;

  @override

  /// Gets the ID of the worksheet that is added to the workbook.
  ///
  /// [Api set: ExcelApi 1.7]
  String get worksheetId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WorksheetActivatedEventArgsCopyWith<_$_WorksheetActivatedEventArgs>
      get copyWith => throw _privateConstructorUsedError;
}

WorksheetChangedEventArgs _$WorksheetChangedEventArgsFromJson(
    Map<String, dynamic> json) {
  return _WorksheetChangedEventArgs.fromJson(json);
}

/// @nodoc
mixin _$WorksheetChangedEventArgs {
  /// Gets the range address that represents the changed area of a specific worksheet.
  ///
  /// [Api set: ExcelApi 1.7]
  String get address => throw _privateConstructorUsedError;

  /// Gets the change type that represents how the changed event is triggered. See `Excel.DataChangeType` for details.
  ///
  /// [Api set: ExcelApi 1.7]
  DataChangeType get changeType =>
      throw _privateConstructorUsedError; // Represents the information about the change detail. This property can be retrieved when the changed event is triggered on a single cell. If the changed event is triggered on multiple cells, this property cannot be retrieved.
//
// [Api set: ExcelApi 1.9]
//
//  required final ChangedEventDetail  details,
  /// Gets the source of the event. See `Excel.EventSource` for details.
  ///
  /// [Api set: ExcelApi 1.7]
  EventSource get source => throw _privateConstructorUsedError;

  /// Gets the ID of the worksheet in which the data changed.
  ///
  /// [Api set: ExcelApi 1.7]
  String get worksheetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorksheetChangedEventArgsCopyWith<WorksheetChangedEventArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorksheetChangedEventArgsCopyWith<$Res> {
  factory $WorksheetChangedEventArgsCopyWith(WorksheetChangedEventArgs value,
          $Res Function(WorksheetChangedEventArgs) then) =
      _$WorksheetChangedEventArgsCopyWithImpl<$Res>;
  $Res call(
      {String address,
      DataChangeType changeType,
      EventSource source,
      String worksheetId});
}

/// @nodoc
class _$WorksheetChangedEventArgsCopyWithImpl<$Res>
    implements $WorksheetChangedEventArgsCopyWith<$Res> {
  _$WorksheetChangedEventArgsCopyWithImpl(this._value, this._then);

  final WorksheetChangedEventArgs _value;
  // ignore: unused_field
  final $Res Function(WorksheetChangedEventArgs) _then;

  @override
  $Res call({
    Object? address = freezed,
    Object? changeType = freezed,
    Object? source = freezed,
    Object? worksheetId = freezed,
  }) {
    return _then(_value.copyWith(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      changeType: changeType == freezed
          ? _value.changeType
          : changeType // ignore: cast_nullable_to_non_nullable
              as DataChangeType,
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as EventSource,
      worksheetId: worksheetId == freezed
          ? _value.worksheetId
          : worksheetId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_WorksheetChangedEventArgsCopyWith<$Res>
    implements $WorksheetChangedEventArgsCopyWith<$Res> {
  factory _$$_WorksheetChangedEventArgsCopyWith(
          _$_WorksheetChangedEventArgs value,
          $Res Function(_$_WorksheetChangedEventArgs) then) =
      __$$_WorksheetChangedEventArgsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String address,
      DataChangeType changeType,
      EventSource source,
      String worksheetId});
}

/// @nodoc
class __$$_WorksheetChangedEventArgsCopyWithImpl<$Res>
    extends _$WorksheetChangedEventArgsCopyWithImpl<$Res>
    implements _$$_WorksheetChangedEventArgsCopyWith<$Res> {
  __$$_WorksheetChangedEventArgsCopyWithImpl(
      _$_WorksheetChangedEventArgs _value,
      $Res Function(_$_WorksheetChangedEventArgs) _then)
      : super(_value, (v) => _then(v as _$_WorksheetChangedEventArgs));

  @override
  _$_WorksheetChangedEventArgs get _value =>
      super._value as _$_WorksheetChangedEventArgs;

  @override
  $Res call({
    Object? address = freezed,
    Object? changeType = freezed,
    Object? source = freezed,
    Object? worksheetId = freezed,
  }) {
    return _then(_$_WorksheetChangedEventArgs(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      changeType: changeType == freezed
          ? _value.changeType
          : changeType // ignore: cast_nullable_to_non_nullable
              as DataChangeType,
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as EventSource,
      worksheetId: worksheetId == freezed
          ? _value.worksheetId
          : worksheetId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_WorksheetChangedEventArgs extends _WorksheetChangedEventArgs {
  const _$_WorksheetChangedEventArgs(
      {required this.address,
      required this.changeType,
      required this.source,
      required this.worksheetId})
      : super._();

  factory _$_WorksheetChangedEventArgs.fromJson(Map<String, dynamic> json) =>
      _$$_WorksheetChangedEventArgsFromJson(json);

  /// Gets the range address that represents the changed area of a specific worksheet.
  ///
  /// [Api set: ExcelApi 1.7]
  @override
  final String address;

  /// Gets the change type that represents how the changed event is triggered. See `Excel.DataChangeType` for details.
  ///
  /// [Api set: ExcelApi 1.7]
  @override
  final DataChangeType changeType;
// Represents the information about the change detail. This property can be retrieved when the changed event is triggered on a single cell. If the changed event is triggered on multiple cells, this property cannot be retrieved.
//
// [Api set: ExcelApi 1.9]
//
//  required final ChangedEventDetail  details,
  /// Gets the source of the event. See `Excel.EventSource` for details.
  ///
  /// [Api set: ExcelApi 1.7]
  @override
  final EventSource source;

  /// Gets the ID of the worksheet in which the data changed.
  ///
  /// [Api set: ExcelApi 1.7]
  @override
  final String worksheetId;

  @override
  String toString() {
    return 'WorksheetChangedEventArgs(address: $address, changeType: $changeType, source: $source, worksheetId: $worksheetId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorksheetChangedEventArgs &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.changeType, changeType) &&
            const DeepCollectionEquality().equals(other.source, source) &&
            const DeepCollectionEquality()
                .equals(other.worksheetId, worksheetId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(changeType),
      const DeepCollectionEquality().hash(source),
      const DeepCollectionEquality().hash(worksheetId));

  @JsonKey(ignore: true)
  @override
  _$$_WorksheetChangedEventArgsCopyWith<_$_WorksheetChangedEventArgs>
      get copyWith => __$$_WorksheetChangedEventArgsCopyWithImpl<
          _$_WorksheetChangedEventArgs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorksheetChangedEventArgsToJson(this);
  }
}

abstract class _WorksheetChangedEventArgs extends WorksheetChangedEventArgs {
  const factory _WorksheetChangedEventArgs(
      {required final String address,
      required final DataChangeType changeType,
      required final EventSource source,
      required final String worksheetId}) = _$_WorksheetChangedEventArgs;
  const _WorksheetChangedEventArgs._() : super._();

  factory _WorksheetChangedEventArgs.fromJson(Map<String, dynamic> json) =
      _$_WorksheetChangedEventArgs.fromJson;

  @override

  /// Gets the range address that represents the changed area of a specific worksheet.
  ///
  /// [Api set: ExcelApi 1.7]
  String get address => throw _privateConstructorUsedError;
  @override

  /// Gets the change type that represents how the changed event is triggered. See `Excel.DataChangeType` for details.
  ///
  /// [Api set: ExcelApi 1.7]
  DataChangeType get changeType => throw _privateConstructorUsedError;
  @override // Represents the information about the change detail. This property can be retrieved when the changed event is triggered on a single cell. If the changed event is triggered on multiple cells, this property cannot be retrieved.
//
// [Api set: ExcelApi 1.9]
//
//  required final ChangedEventDetail  details,
  /// Gets the source of the event. See `Excel.EventSource` for details.
  ///
  /// [Api set: ExcelApi 1.7]
  EventSource get source => throw _privateConstructorUsedError;
  @override

  /// Gets the ID of the worksheet in which the data changed.
  ///
  /// [Api set: ExcelApi 1.7]
  String get worksheetId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WorksheetChangedEventArgsCopyWith<_$_WorksheetChangedEventArgs>
      get copyWith => throw _privateConstructorUsedError;
}

WorksheetNameChangedEventArgs _$WorksheetNameChangedEventArgsFromJson(
    Map<String, dynamic> json) {
  return _WorksheetNameChangedEventArgs.fromJson(json);
}

/// @nodoc
mixin _$WorksheetNameChangedEventArgs {
  /// Gets the new name of the worksheet, after the name change.
  ///
  /// @remarks
  /// [Api set: ExcelApiOnline 1.1]
  String get nameAfter => throw _privateConstructorUsedError;

  /// Gets the ID of the worksheet that is activated.
  ///
  /// [Api set: ExcelApi 1.7]
  EventType get type => throw _privateConstructorUsedError;

  /// Gets the previous name of the worksheet, before the name changed.
  ///
  /// @remarks
  /// [Api set: ExcelApiOnline 1.1]
  String get nameBefore => throw _privateConstructorUsedError;

  /// Gets the source of the event. See `Excel.EventSource` for details.
  ///
  /// [Api set: ExcelApi 1.7]
  EventSource get source => throw _privateConstructorUsedError;

  /// Gets the ID of the worksheet in which the data changed.
  ///
  /// [Api set: ExcelApi 1.7]
  String get worksheetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorksheetNameChangedEventArgsCopyWith<WorksheetNameChangedEventArgs>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorksheetNameChangedEventArgsCopyWith<$Res> {
  factory $WorksheetNameChangedEventArgsCopyWith(
          WorksheetNameChangedEventArgs value,
          $Res Function(WorksheetNameChangedEventArgs) then) =
      _$WorksheetNameChangedEventArgsCopyWithImpl<$Res>;
  $Res call(
      {String nameAfter,
      EventType type,
      String nameBefore,
      EventSource source,
      String worksheetId});
}

/// @nodoc
class _$WorksheetNameChangedEventArgsCopyWithImpl<$Res>
    implements $WorksheetNameChangedEventArgsCopyWith<$Res> {
  _$WorksheetNameChangedEventArgsCopyWithImpl(this._value, this._then);

  final WorksheetNameChangedEventArgs _value;
  // ignore: unused_field
  final $Res Function(WorksheetNameChangedEventArgs) _then;

  @override
  $Res call({
    Object? nameAfter = freezed,
    Object? type = freezed,
    Object? nameBefore = freezed,
    Object? source = freezed,
    Object? worksheetId = freezed,
  }) {
    return _then(_value.copyWith(
      nameAfter: nameAfter == freezed
          ? _value.nameAfter
          : nameAfter // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventType,
      nameBefore: nameBefore == freezed
          ? _value.nameBefore
          : nameBefore // ignore: cast_nullable_to_non_nullable
              as String,
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as EventSource,
      worksheetId: worksheetId == freezed
          ? _value.worksheetId
          : worksheetId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_WorksheetNameChangedEventArgsCopyWith<$Res>
    implements $WorksheetNameChangedEventArgsCopyWith<$Res> {
  factory _$$_WorksheetNameChangedEventArgsCopyWith(
          _$_WorksheetNameChangedEventArgs value,
          $Res Function(_$_WorksheetNameChangedEventArgs) then) =
      __$$_WorksheetNameChangedEventArgsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String nameAfter,
      EventType type,
      String nameBefore,
      EventSource source,
      String worksheetId});
}

/// @nodoc
class __$$_WorksheetNameChangedEventArgsCopyWithImpl<$Res>
    extends _$WorksheetNameChangedEventArgsCopyWithImpl<$Res>
    implements _$$_WorksheetNameChangedEventArgsCopyWith<$Res> {
  __$$_WorksheetNameChangedEventArgsCopyWithImpl(
      _$_WorksheetNameChangedEventArgs _value,
      $Res Function(_$_WorksheetNameChangedEventArgs) _then)
      : super(_value, (v) => _then(v as _$_WorksheetNameChangedEventArgs));

  @override
  _$_WorksheetNameChangedEventArgs get _value =>
      super._value as _$_WorksheetNameChangedEventArgs;

  @override
  $Res call({
    Object? nameAfter = freezed,
    Object? type = freezed,
    Object? nameBefore = freezed,
    Object? source = freezed,
    Object? worksheetId = freezed,
  }) {
    return _then(_$_WorksheetNameChangedEventArgs(
      nameAfter: nameAfter == freezed
          ? _value.nameAfter
          : nameAfter // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventType,
      nameBefore: nameBefore == freezed
          ? _value.nameBefore
          : nameBefore // ignore: cast_nullable_to_non_nullable
              as String,
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as EventSource,
      worksheetId: worksheetId == freezed
          ? _value.worksheetId
          : worksheetId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_WorksheetNameChangedEventArgs extends _WorksheetNameChangedEventArgs {
  const _$_WorksheetNameChangedEventArgs(
      {required this.nameAfter,
      required this.type,
      required this.nameBefore,
      required this.source,
      required this.worksheetId})
      : super._();

  factory _$_WorksheetNameChangedEventArgs.fromJson(
          Map<String, dynamic> json) =>
      _$$_WorksheetNameChangedEventArgsFromJson(json);

  /// Gets the new name of the worksheet, after the name change.
  ///
  /// @remarks
  /// [Api set: ExcelApiOnline 1.1]
  @override
  final String nameAfter;

  /// Gets the ID of the worksheet that is activated.
  ///
  /// [Api set: ExcelApi 1.7]
  @override
  final EventType type;

  /// Gets the previous name of the worksheet, before the name changed.
  ///
  /// @remarks
  /// [Api set: ExcelApiOnline 1.1]
  @override
  final String nameBefore;

  /// Gets the source of the event. See `Excel.EventSource` for details.
  ///
  /// [Api set: ExcelApi 1.7]
  @override
  final EventSource source;

  /// Gets the ID of the worksheet in which the data changed.
  ///
  /// [Api set: ExcelApi 1.7]
  @override
  final String worksheetId;

  @override
  String toString() {
    return 'WorksheetNameChangedEventArgs(nameAfter: $nameAfter, type: $type, nameBefore: $nameBefore, source: $source, worksheetId: $worksheetId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorksheetNameChangedEventArgs &&
            const DeepCollectionEquality().equals(other.nameAfter, nameAfter) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.nameBefore, nameBefore) &&
            const DeepCollectionEquality().equals(other.source, source) &&
            const DeepCollectionEquality()
                .equals(other.worksheetId, worksheetId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nameAfter),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(nameBefore),
      const DeepCollectionEquality().hash(source),
      const DeepCollectionEquality().hash(worksheetId));

  @JsonKey(ignore: true)
  @override
  _$$_WorksheetNameChangedEventArgsCopyWith<_$_WorksheetNameChangedEventArgs>
      get copyWith => __$$_WorksheetNameChangedEventArgsCopyWithImpl<
          _$_WorksheetNameChangedEventArgs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorksheetNameChangedEventArgsToJson(this);
  }
}

abstract class _WorksheetNameChangedEventArgs
    extends WorksheetNameChangedEventArgs {
  const factory _WorksheetNameChangedEventArgs(
      {required final String nameAfter,
      required final EventType type,
      required final String nameBefore,
      required final EventSource source,
      required final String worksheetId}) = _$_WorksheetNameChangedEventArgs;
  const _WorksheetNameChangedEventArgs._() : super._();

  factory _WorksheetNameChangedEventArgs.fromJson(Map<String, dynamic> json) =
      _$_WorksheetNameChangedEventArgs.fromJson;

  @override

  /// Gets the new name of the worksheet, after the name change.
  ///
  /// @remarks
  /// [Api set: ExcelApiOnline 1.1]
  String get nameAfter => throw _privateConstructorUsedError;
  @override

  /// Gets the ID of the worksheet that is activated.
  ///
  /// [Api set: ExcelApi 1.7]
  EventType get type => throw _privateConstructorUsedError;
  @override

  /// Gets the previous name of the worksheet, before the name changed.
  ///
  /// @remarks
  /// [Api set: ExcelApiOnline 1.1]
  String get nameBefore => throw _privateConstructorUsedError;
  @override

  /// Gets the source of the event. See `Excel.EventSource` for details.
  ///
  /// [Api set: ExcelApi 1.7]
  EventSource get source => throw _privateConstructorUsedError;
  @override

  /// Gets the ID of the worksheet in which the data changed.
  ///
  /// [Api set: ExcelApi 1.7]
  String get worksheetId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WorksheetNameChangedEventArgsCopyWith<_$_WorksheetNameChangedEventArgs>
      get copyWith => throw _privateConstructorUsedError;
}
