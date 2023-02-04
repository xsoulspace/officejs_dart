// ignore_for_file: avoid_positional_boolean_parameters

@JS('Excel')
library excel_js;

import 'package:js/js.dart';

import 'office_core_js_impl.dart' as office_core_js;
import 'office_extension_js_impl.dart' as office_extension_js;

/// The RequestContext object facilitates requests to the Excel application.
/// Since the Office add-in and the Excel application run in
/// two different processes, the request context is required
/// to get access to the Excel object model from the add-in.
@JS('RequestContext')
abstract class RequestContextJsImpl
    extends office_core_js.RequestContextJsImpl {
  external WorkbookJsImpl get workbook;

  /// Collection of objects that are tracked for automatic adjustments based
  /// on surrounding changes in the document.
  external office_extension_js.TrackedObjectsJsImpl get trackedObjects;
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

  /// Gets the workbook name.
  ///
  /// @remarks
  /// Api set: ExcelApi 1.7
  external String get name;

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

  /// Occurs when a worksheet is moved within a workbook. This event only triggers when a worksheet is directly moved within a workbook. This event doesn't trigger when the position of a worksheet is indirectly changed, such as when a new worksheet is inserted and causes existing worksheets to change positions.
  ///
  /// @remarks
  /// [Api set: ExcelApiOnline 1.1]
  ///
  /// @eventproperty
  /// To get proper type convert to [WorksheetMovedEventArgs]
  external office_extension_js.EventHandlersJsImpl get onMoved;

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

  /// Gets the `Range` object containing the single cell based on row and
  /// column numbers. The cell can be outside the bounds of its parent range,
  /// so long as it stays within the worksheet grid.
  ///
  /// @remarks
  /// [Api set: ExcelApi 1.1]
  ///
  /// @param row The row number of the cell to be retrieved. Zero-indexed.
  /// @param column The column number of the cell to be retrieved. Zero-indexed.
  external RangeJsImpl getCell(final int row, final int column);
}

/// Range represents a set of one or more contiguous cells such as a cell,
///  a row, a column, or a block of cells.
/// To learn more about how ranges are used throughout the API,
/// start with {@link https://docs.microsoft.com/office/dev/add-ins/excel/excel-add-ins-core-concepts#ranges | Ranges in the Excel JavaScript API}.
///
/// @remarks
/// [Api set: ExcelApi 1.1]
///
@JS('Range')
abstract class RangeJsImpl {
  /// The request context associated with the object. This connects
  /// the add-in's process to the Office host application's process. */
  external RequestContextJsImpl get context;

  /// Returns the used range of the given range object.
  /// If there are no used cells within the range, this function
  /// will throw an `ItemNotFound` error.
  ///
  /// @remarks
  /// [Api set: ExcelApi 1.1]
  ///
  /// @param valuesOnly Considers only cells with values as used cells.
  /// [Api set: ExcelApi 1.2]
  external RangeJsImpl getUsedRange([final bool? valuesOnly]);

  /// Gets a row contained in the range.
  ///
  /// @remarks
  /// [Api set: ExcelApi 1.1]
  ///
  /// @param row Row number of the range to be retrieved. Zero-indexed.
  external RangeJsImpl getRow(final int row);

  /// Gets a column contained in the range.
  ///
  /// @remarks
  /// [Api set: ExcelApi 1.1]
  ///
  /// @param column Column number of the range to be retrieved. Zero-indexed.
  external RangeJsImpl getColumn(final int column);

  /// Queues up a command to load the specified properties of the object.
  /// You must call `context.sync()` before reading the properties.
  ///
  /// @param propertyNames A comma-delimited string or an array of strings
  /// that specify the properties to load.
  external RangeJsImpl load(final List<String> propertyNames);

  /// Represents the raw values of the specified range.
  /// The data returned could be a string, number, or boolean.
  /// Cells that contain an error will return the error string.
  ///
  /// If the returned value starts with a plus ("+"), minus ("-"),
  /// or equal sign ("="), Excel interprets this value as a formula.
  ///
  /// @remarks
  /// [Api set: ExcelApi 1.1]
  external List<List<dynamic>> get values;
  external set values(final List<List<dynamic>> values);
}
