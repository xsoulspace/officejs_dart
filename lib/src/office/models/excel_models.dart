import 'package:freezed_annotation/freezed_annotation.dart';

import '../../office_interpops/excel_js_impl.dart';

part 'excel_models.freezed.dart';
part 'excel_models.g.dart';

/// Provides information about the worksheet that raised the deleted event.
///
/// [Api set: ExcelApi 1.7]
@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class WorksheetDeletedEventArgs with _$WorksheetDeletedEventArgs {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory WorksheetDeletedEventArgs({
    /// Gets the source of the event. See Excel.[EventSource] for details.
    ///
    /// [Api set: ExcelApi 1.7]
    required final EventSource source,

    /// Gets the ID of the worksheet that is deleted from the workbook.
    ///
    /// [Api set: ExcelApi 1.7]
    required final String worksheetId,
  }) = _WorksheetDeletedEventArgs;
  const WorksheetDeletedEventArgs._();
  factory WorksheetDeletedEventArgs.fromJson(final Map<String, dynamic> json) =>
      _$WorksheetDeletedEventArgsFromJson(json);

  /// Gets the type of the event. See `Excel.EventType` for details.
  ///
  /// [Api set: ExcelApi 1.7]
  EventType get type => EventType.worksheetDeleted;
}

/// Provides information about the worksheet that raised the added event.
///
/// [Api set: ExcelApi 1.7]
@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class WorksheetAddedEventArgs with _$WorksheetAddedEventArgs {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory WorksheetAddedEventArgs({
    /// Gets the source of the event. See Excel.[EventSource] for details.
    ///
    /// [Api set: ExcelApi 1.7]
    required final EventSource source,

    /// Gets the ID of the worksheet that is added to the workbook.
    ///
    /// [Api set: ExcelApi 1.7]
    required final String worksheetId,
  }) = _WorksheetAddedEventArgs;
  const WorksheetAddedEventArgs._();
  factory WorksheetAddedEventArgs.fromJson(final Map<String, dynamic> json) =>
      _$WorksheetAddedEventArgsFromJson(json);

  /// Gets the type of the event. See `Excel.EventType` for details.
  ///
  /// [Api set: ExcelApi 1.7]
  EventType get type => EventType.worksheetAdded;
}

/// Provides information about the worksheet that raised the activated event.
///
/// [Api set: ExcelApi 1.7]
@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class WorksheetActivatedEventArgs with _$WorksheetActivatedEventArgs {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory WorksheetActivatedEventArgs({
    /// Gets the ID of the worksheet that is added to the workbook.
    ///
    /// [Api set: ExcelApi 1.7]
    required final String worksheetId,
  }) = _WorksheetActivatedEventArgs;
  const WorksheetActivatedEventArgs._();
  factory WorksheetActivatedEventArgs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$WorksheetActivatedEventArgsFromJson(json);

  /// Gets the ID of the worksheet that is activated.
  ///
  /// [Api set: ExcelApi 1.7]
  EventType get type => EventType.worksheetActivated;
}

/// Provides information about the worksheet that raised the changed event.
///
/// [Api set: ExcelApi 1.7]
@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class WorksheetChangedEventArgs with _$WorksheetChangedEventArgs {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory WorksheetChangedEventArgs({
    /// Gets the range address that represents the changed area of a specific worksheet.
    ///
    /// [Api set: ExcelApi 1.7]
    required final String address,

    /// Gets the change type that represents how the changed event is triggered. See `Excel.DataChangeType` for details.
    ///
    /// [Api set: ExcelApi 1.7]
    required final DataChangeType changeType,
    // Represents the information about the change detail. This property can be retrieved when the changed event is triggered on a single cell. If the changed event is triggered on multiple cells, this property cannot be retrieved.
    //
    // [Api set: ExcelApi 1.9]
    //
    //  required final ChangedEventDetail  details,

    /// Gets the source of the event. See `Excel.EventSource` for details.
    ///
    /// [Api set: ExcelApi 1.7]
    required final EventSource source,

    /// Gets the ID of the worksheet in which the data changed.
    ///
    /// [Api set: ExcelApi 1.7]
    required final String worksheetId,
  }) = _WorksheetChangedEventArgs;
  const WorksheetChangedEventArgs._();
  factory WorksheetChangedEventArgs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$WorksheetChangedEventArgsFromJson(json);

  /// Gets the ID of the worksheet that is activated.
  ///
  /// [Api set: ExcelApi 1.7]
  EventType get type => EventType.worksheetChanged;
}

/// Provides information about the worksheet whose name has changed.
///
/// @remarks
/// [Api set: ExcelApiOnline 1.1]
@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class WorksheetNameChangedEventArgs with _$WorksheetNameChangedEventArgs {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory WorksheetNameChangedEventArgs({
    /// Gets the new name of the worksheet, after the name change.
    ///
    /// @remarks
    /// [Api set: ExcelApiOnline 1.1]
    required final String nameAfter,

    /// Gets the ID of the worksheet that is activated.
    ///
    /// [Api set: ExcelApi 1.7]
    required final EventType type,

    /// Gets the previous name of the worksheet, before the name changed.
    ///
    /// @remarks
    /// [Api set: ExcelApiOnline 1.1]
    required final String nameBefore,

    /// Gets the source of the event. See `Excel.EventSource` for details.
    ///
    /// [Api set: ExcelApi 1.7]
    required final EventSource source,

    /// Gets the ID of the worksheet in which the data changed.
    ///
    /// [Api set: ExcelApi 1.7]
    required final String worksheetId,
  }) = _WorksheetNameChangedEventArgs;
  const WorksheetNameChangedEventArgs._();
  factory WorksheetNameChangedEventArgs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$WorksheetNameChangedEventArgsFromJson(json);
}
