// ignore_for_file: avoid_positional_boolean_parameters

@JS('Excel')
library excel_js;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:js/js.dart';

import '../js_interpops/es6_js_impl.dart' as js;
import 'office_core_js_impl.dart' as office_core_js;
import 'office_extension_js_impl.dart' as office_extension_js;

// ignore: avoid_classes_with_only_static_members
/// Executes a batch script that performs actions on the Excel object model,
/// using a new RequestContext. When the promise is resolved,
/// any tracked objects that were automatically allocated
/// during execution will be released.
/// @param batch - A function that takes in a RequestContext
/// and returns a promise (typically, just the result of "context.sync()").
/// The context parameter facilitates requests to the Excel application.
/// Since the Office add-in and the Excel application run in
/// two different processes, the RequestContext is required to get access
/// to the Excel object model from the add-in.
@JS('Excel')
abstract class ExcelJsImpl {
  external static js.PromiseJsImpl<T> run<T>(
    final js.PromiseJsImpl<T> Function(RequestContextJsImpl context) batch,
  );
}

/// The RequestContext object facilitates requests to the Excel application.
/// Since the Office add-in and the Excel application run in
/// two different processes, the request context is required
/// to get access to the Excel object model from the add-in.
@JS('RequestContext')
abstract class RequestContextJsImpl
    extends office_core_js.RequestContextJsImpl {
  external WorkbookJsImpl get workbook;
}

@JS('Workbook')
abstract class WorkbookJsImpl {
  /// The request context associated with the object. This connects
  /// the add-in's process to the Office host application's process. */
  external RequestContextJsImpl get context;

  /// Represents a collection of worksheets associated with the workbook.
  ///
  /// Api set: ExcelApi 1.1
  external WorksheetCollectionJsImpl get worksheets;

  /// Queues up a command to load the specified properties of the object.
  /// You must call `context.sync()` before reading the properties.
  ///
  /// @param propertyNames A comma-delimited string or an array of strings that
  /// specify the properties to load.
  ///
  external WorksheetJsImpl load(final List<String> propertyNames);
}

@JS('WorksheetCollection')
abstract class WorksheetCollectionJsImpl {
  /// The request context associated with the object. This connects
  /// the add-in's process to the Office host application's process. */
  external RequestContextJsImpl get context;

  /// Gets the loaded child items in this collection. */
  external List<WorksheetJsImpl> get items;

  /// Gets the number of worksheets in the collection.
  ///
  /// Api set: ExcelApi 1.4
  ///
  /// @param visibleOnly Optional. If `true`, considers only visible
  /// worksheets, skipping over any hidden ones.
  external office_extension_js.ClientResultJsImpl<int> getCount([
    final bool? visibleOnly,
  ]);

  /// Gets the first worksheet in the collection.
  ///
  /// Api set: ExcelApi 1.5
  ///
  /// @param visibleOnly Optional. If `true`, considers only visible
  /// worksheets, skipping over any hidden ones.
  external WorksheetJsImpl getFirst(final bool? visibleOnly);

  /// Occurs when any worksheet in the workbook is activated.
  /// [Api set: ExcelApi 1.7]
  ///
  /// @eventproperty
  ///
  /// To get proper type convert to [WorksheetActivatedEventArgs]
  external office_extension_js.EventHandlersJsImpl get onActivated;

  /// Occurs when a new worksheet is added to the workbook.
  ///
  /// Api set: ExcelApi 1.7
  ///
  /// @eventproperty
  ///
  /// To get proper type convert to [WorksheetAddedEventArgs]
  external office_extension_js.EventHandlersJsImpl get onAdded;

  /// Occurs when a worksheet is deleted from the workbook.
  ///
  /// [Api set: ExcelApi 1.7]
  ///
  /// @eventproperty
  ///
  /// To get proper type convert to [WorksheetDeletedEventArgs]
  external office_extension_js.EventHandlersJsImpl get onDeleted;

  /// Occurs when any worksheet in the workbook is changed.
  ///
  /// [Api set: ExcelApi 1.9]
  ///
  /// @eventproperty
  ///
  /// To get proper type convert to [WorksheetChangedEventArgs]
  external office_extension_js.EventHandlersJsImpl get onChanged;

  /// Occurs when the worksheet name is changed.
  ///
  /// @remarks
  /// [Api set: ExcelApiOnline 1.1]
  ///
  /// @eventproperty
  ///
  /// To get proper type convert to [WorksheetNameChangedEventArgs]
  external office_extension_js.EventHandlersJsImpl get onNameChanged;

  /// Gets a worksheet object using its name or ID.
  ///
  /// Api set: ExcelApi 1.1
  ///
  /// @param key The name or ID of the worksheet.
  ////
  external WorksheetJsImpl getItem(final String key);

  /// Gets the currently active worksheet in the workbook.
  ///
  /// Api set: ExcelApi 1.1
  external WorksheetJsImpl getActiveWorksheet();

  /// Queues up a command to load the specified properties of the object.
  /// You must call `context.sync()` before reading the properties.
  ///
  /// @param propertyNames A comma-delimited string or an array of strings
  /// that specify the properties to load.
  external WorksheetCollectionJsImpl load(final List<String> propertyNames);
}

@JS('Worksheet')
abstract class WorksheetJsImpl {
  /// The request context associated with the object. This connects
  /// the add-in's process to the Office host application's process. */
  external RequestContextJsImpl get context;

  /// The display name of the worksheet.
  ///
  /// Api set: ExcelApi 1.1
  external String get name;
  external set name(final String value);

  /// Returns a value that uniquely identifies the worksheet
  /// in a given workbook. The value of the identifier remains the same
  /// even when the worksheet is renamed or moved.
  ///
  /// Api set: ExcelApi 1.1
  external String get id;

  /// The zero-based position of the worksheet within the workbook.
  ///
  /// Api set: ExcelApi 1.1
  external int get position;
  external set position(final int value);

  /// Specifies if gridlines are visible to the user.
  ///
  /// Api set: ExcelApi 1.8
  external bool get showGridlines;
  external set showGridlines(final bool value);

  /// The tab color of the worksheet.
  ///
  /// When retrieving the tab color, if the worksheet is invisible,
  /// the value will be `null`. If the worksheet is visible but
  /// the tab color is set to auto, an empty string will be returned.
  /// Otherwise, the property will be set to a color,
  /// in the form #RRGGBB (e.g., "FFA500").
  ///
  /// When setting the color, use an empty-string to set an "auto" color,
  /// or a real color otherwise.
  ///
  /// Api set: ExcelApi 1.7
  external String? get tabColor;
  external set tabColor(final String? value);

  /// Queues up a command to load the specified properties of the object.
  /// You must call `context.sync()` before reading the properties.
  ///
  /// @param propertyNames A comma-delimited string or an array of strings
  /// that specify the properties to load.
  external WorksheetJsImpl load(final List<String> propertyNames);

  /// Activate the worksheet in the Excel UI.
  ///
  /// Api set: ExcelApi 1.1
  external void activate();
}

/// [Api set: ExcelApi 1.7]
enum EventSource {
  /// Local means the event comes from a local user session.
  @JsonValue('Local')
  local,

  /// Remote means the event comes from a remote user session.
  @JsonValue('Remote')
  remote,
}

/// [Api set: ExcelApi 1.7]
enum EventType {
  /// `WorksheetChanged` represents the type of event registered on a `Worksheet` or `WorksheetCollection` and occurs when data changes.
  @JsonValue('WorksheetChanged')
  worksheetChanged,

  /// `WorksheetSelectionChanged` represents the type of event registered on a `Worksheet` and occurs when the selection changes.
  worksheetSelectionChanged,

  /// `WorksheetAdded` represents the type of event registered on a `WorksheetCollection` and occurs when a new worksheet is added to the workbook.
  @JsonValue('WorksheetAdded')
  worksheetAdded,

  /// `WorksheetActivated` represents the type of event registered on a `Worksheet` or `WorksheetCollection` and occurs when a worksheet activates.
  @JsonValue('WorksheetActivated')
  worksheetActivated,

  /// `WorksheetDeactivated` represents the type of event registered on a `Worksheet` or `WorksheetCollection` and occurs when a worksheet deactivates.
  @JsonValue('WorksheetDeactivated')
  worksheetDeactivated,

  /// `TableChanged` represents the type of event registered on a `Table` and occurs when data changes.
  tableChanged,

  /// `TableSelectionChanged` represents the type of event registered on a `Table` and occurs when the selection changes.
  tableSelectionChanged,

  /// `WorksheetDeleted` represents the type of event registered on a `WorksheetCollection` and occurs when a worksheet is deleted from the workbook.
  @JsonValue('WorksheetDeleted')
  worksheetDeleted,

  /// `ChartAdded` represents the type of event registered on a `ChartCollection` and occurs when a new chart is added to the worksheet.
  chartAdded,

  /// `ChartActivated` represents the type of event registered on a `Chart` or `ChartCollection` and occurs when a chart activates.
  chartActivated,

  /// `ChartDeactivated` represents the type of event registered on a `Chart` or `ChartCollection` and occurs when a chart deactivates.
  chartDeactivated,

  /// `ChartDeleted` represents the type of event registered on a `ChartCollection` and occurs when a chart is deleted from the worksheet.
  chartDeleted,

  /// `WorksheetCalculated` represents the type of event registered on a `Worksheet` or `WorksheetCollection` and occurs when a worksheet is calculated.
  worksheetCalculated,

  /// `VisualSelectionChanged` represents the type of event registered on a `VisualCollection` and occurs when the visual selection changes.
  visualSelectionChanged,

  /// `AgaveVisualUpdate` represents the type of an event that is associated with an agave visual and carries a new data view following a data change.
  agaveVisualUpdate,

  /// `TableAdded` represents the type of event registered on a `TableCollection` and occurs when a table is added.
  tableAdded,

  /// `TableDeleted` represents the type of event that is registered on a `TableCollection` and occurs when a table is deleted.
  tableDeleted,

  /// `TableFiltered` represents the type of event registered on a table or `TableCollection` and occurs when the data of a table is filtered.
  tableFiltered,

  /// `WorksheetFiltered` represents the type of event registered on a worksheet or `WorksheetCollection` and occurs when the data of an AutoFilter in the worksheet is filtered.
  worksheetFiltered,

  /// `ShapeActivated` represents the type of event that is registered on a `Shape` and occurs when the shape activates.
  shapeActivated,

  /// `ShapeDeactivated` represents the type of event that is registered on a `Shape` and occurs when the shape deactivates.
  shapeDeactivated,

  /// `VisualChange` represents the type of event registered on a `Visual` and occurs when there is a visual change.
  visualChange,

  /// `WorkbookAutoSaveSettingChanged` represents the type of event registered on a workbook and occurs when there is an auto save setting change.
  workbookAutoSaveSettingChanged,

  /// `WorksheetFormatChanged` represents the type of event registered on a worksheet and occurs when a format is changed.
  worksheetFormatChanged,

  /// `RibbonCommandExecuted` represents the type of event registered on the ribbon and occurs when a user clicks on the ribbon
  ribbonCommandExecuted,

  /// `WorksheetRowSorted` represents the type of event registered on a worksheet and occurs when rows are sorted.
  worksheetRowSorted,

  /// `WorksheetColumnSorted` represents the type of event registered on a worksheet and occurs columns are sorted.
  worksheetColumnSorted,

  /// `WorksheetSingleClicked` represents the type of event registered on a worksheet and occurs when a cell is left-clicked or tapped.
  worksheetSingleClicked,

  /// `WorksheetRowHiddenChanged` represents the type of event registered on a worksheet and occurs when a row's hidden state is changed.
  worksheetRowHiddenChanged,

  /// `CommentAdded` represents the type of event that is registered on a comment collection and occurs when comments are added.
  ///
  commentAdded,

  /// `CommentDeleted` represents the type of event that is registered on a comment collection and occurs when comments are deleted.
  commentDeleted,

  /// `CommentChanged` represents the type of event that is registered on a comment collection and occurs when comments are changed.
  commentChanged,

  /// `RefreshRequestCompleted` represents the type of event registered on a `LinkedDataType` and occurs when a request to refresh a data source is completed.
  linkedDataTypeRefreshRequestCompleted,

  /// `RefreshModeChanged` represents the type of event registered on a `LinkedDataType` and occurs when the linked data type refresh mode is changed.
  linkedDataTypeRefreshModeChanged,

  /// `LinkedDataTypeAdded` represents the type of event registered on a `LinkedDataType` and occurs when a new linked data type is added to the workbook.
  linkedDataTypeLinkedDataTypeAdded,

  /// `WorksheetFormulaChanged` represents the type of event registered on a worksheet and occurs when a formula is changed.
  worksheetFormulaChanged,

  /// `WorkbookActivated` represents the type of event which is fired when a workbook is activated.
  @JsonValue('WorkbookActivated')
  workbookActivated,

  /// `WorkbookLinksChanged` represents the type of event which is fired when a workbook link is changed.
  linkedWorkbookWorkbookLinksChanged,

  /// `WorkbookLinksRefreshCompleted` represents the type of event registered on a linked Workbook and occurs when a linked workbook completes a refresh.
  linkedWorkbookRefreshCompleted,

  /// WorksheetProtectionChanged represents the type of event registered on worksheet, and occurs when protection status is changed.
  worksheetProtectionChanged,

  /// WorksheetNameChanged represents the type of event registered on a worksheet that occurs when its name changes.
  @JsonValue('WorksheetNameChanged')
  worksheetNameChanged,

  /// WorksheetVisibilityChanged represents the type of event registered on a worksheet that occurs when its visibility changes.
  @JsonValue('WorksheetVisibilityChanged')
  worksheetVisibilityChanged,

  /// WorksheetMoved represents the type of event registered on a worksheet that occurs when it is moved within a workbook.
  @JsonValue('WorksheetMoved')
  worksheetMoved,

  /// LineageActivityUpdateAvailable represents the type of event registered when new revision updates lineage model.
  lineageActivityUpdateAvailable,
}

///[Api set: ExcelApi 1.7]
enum DataChangeType {
  /// `Unknown` indicates that the type of data change is not one of the listed types.
  /// [Api set: ExcelApi The name of this value was 'Others' in ExcelApi 1.7]
  @JsonValue('Unknown')
  unknown,

  /// `RangeEdited` indicates that the data change event is triggered by a range being edited.
  /// [Api set: ExcelApi 1.7]
  @JsonValue('Unknown')
  rangeEdited,

  /// `RowInserted` indicates that the data change event is triggered by inserting new rows.
  /// [Api set: ExcelApi 1.7]
  @JsonValue('Unknown')
  rowInserted,

  /// `RowDeleted` indicates that the data change event is triggered by deleting rows.
  /// [Api set: ExcelApi 1.7]
  @JsonValue('Unknown')
  rowDeleted,

  /// `ColumnInserted` indicates that the data change event is triggered by inserting new columns.
  /// [Api set: ExcelApi 1.7]
  @JsonValue('ColumnInserted')
  columnInserted,

  /// `ColumnDeleted` indicates that the data change event is triggered by deleting columns.
  /// [Api set: ExcelApi 1.7]
  @JsonValue('ColumnDeleted')
  columnDeleted,

  /// `CellInserted` indicates that the data change event is triggered by inserting new cells.
  /// [Api set: ExcelApi 1.7]
  @JsonValue('CellInserted')
  cellInserted,

  /// `CellDeleted` indicates that the data change event is triggered by deleting cells.
  /// [Api set: ExcelApi 1.7]
  @JsonValue('CellDeleted')
  cellDeleted,
}
