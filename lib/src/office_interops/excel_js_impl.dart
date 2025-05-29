// ignore_for_file: avoid_positional_boolean_parameters

import 'dart:js_interop';

import 'office_core_js_impl.dart' as office_core_js;
import 'office_extension_js_impl.dart' as office_extension_js;

/// The RequestContext object facilitates requests to the Excel application.
/// Since the Office add-in and the Excel application run in
/// two different processes, the request context is required
/// to get access to the Excel object model from the add-in.
@JS('Excel.RequestContext')
@staticInterop
class RequestContextJsImpl extends office_core_js.RequestContextJsImpl {}

extension RequestContextJsImplExtension on RequestContextJsImpl {
  external WorkbookJsImpl get workbook;

  /// Collection of objects that are tracked for automatic adjustments based
  /// on surrounding changes in the document.
  external office_extension_js.TrackedObjectsJsImpl get trackedObjects;
}

@JS('Excel.Workbook')
@staticInterop
class WorkbookJsImpl extends office_extension_js.ClientObjectJsImpl {}

extension WorkbookJsImplExtension on WorkbookJsImpl {
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
  external JSString get name;

  /// Queues up a command to load the specified properties of the object.
  /// You must call `context.sync()` before reading the properties.
  ///
  /// @param propertyNames A comma-delimited string or an array of strings that
  /// specify the properties to load.
  ///
  external WorksheetJsImpl load(final JSArray<JSString> propertyNames);
}

@JS('Excel.WorksheetCollection')
@staticInterop
class WorksheetCollectionJsImpl
    extends office_extension_js.ClientObjectJsImpl {}

extension WorksheetCollectionJsImplExtension on WorksheetCollectionJsImpl {
  /// The request context associated with the object. This connects
  /// the add-in's process to the Office host application's process. */
  external RequestContextJsImpl get context;

  /// Gets the loaded child items in this collection. */
  external JSArray<JSAny> get items;

  /// Gets the number of worksheets in the collection.
  ///
  /// Api set: ExcelApi 1.4
  ///
  /// @param visibleOnly Optional. If `true`, considers only visible
  /// worksheets, skipping over any hidden ones.
  external office_extension_js.ClientResultJsImpl<JSAny> getCount([
    final JSBoolean? visibleOnly,
  ]);

  /// Gets the first worksheet in the collection.
  ///
  /// Api set: ExcelApi 1.5
  ///
  /// @param visibleOnly Optional. If `true`, considers only visible
  /// worksheets, skipping over any hidden ones.
  external WorksheetJsImpl getFirst(final JSBoolean? visibleOnly);

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

  /// Occurs when a worksheet is moved within a workbook.
  /// This event only triggers when a worksheet is directly
  /// moved within a workbook. This event doesn't trigger when
  ///  the position of a worksheet is indirectly changed, such
  /// as when a new worksheet is inserted and causes existing
  /// worksheets to change positions.
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
  external WorksheetJsImpl getItem(final JSString key);

  /// Gets the currently active worksheet in the workbook.
  ///
  /// Api set: ExcelApi 1.1
  external WorksheetJsImpl getActiveWorksheet();

  /// Queues up a command to load the specified properties of the object.
  /// You must call `context.sync()` before reading the properties.
  ///
  /// @param propertyNames A comma-delimited string or an array of strings
  /// that specify the properties to load.
  external WorksheetCollectionJsImpl load(
    final JSArray<JSString> propertyNames,
  );
}

@JS('Excel.Worksheet')
@staticInterop
class WorksheetJsImpl extends office_extension_js.ClientObjectJsImpl {}

extension WorksheetJsImplExtension on WorksheetJsImpl {
  /// The request context associated with the object. This connects
  /// the add-in's process to the Office host application's process. */
  external RequestContextJsImpl get context;

  /// The display name of the worksheet.
  ///
  /// Api set: ExcelApi 1.1
  external JSString get name;
  external set name(final JSString value);

  /// Returns a value that uniquely identifies the worksheet
  /// in a given workbook. The value of the identifier remains the same
  /// even when the worksheet is renamed or moved.
  ///
  /// Api set: ExcelApi 1.1
  external JSString get id;

  /// The zero-based position of the worksheet within the workbook.
  ///
  /// Api set: ExcelApi 1.1
  external JSNumber get position;
  external set position(final JSNumber value);

  /// Specifies if gridlines are visible to the user.
  ///
  /// Api set: ExcelApi 1.8
  external JSBoolean get showGridlines;
  external set showGridlines(final JSBoolean value);

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
  external JSString? get tabColor;
  external set tabColor(final JSString? value);

  /// Queues up a command to load the specified properties of the object.
  /// You must call `context.sync()` before reading the properties.
  ///
  /// @param propertyNames A comma-delimited string or an array of strings
  /// that specify the properties to load.
  external WorksheetJsImpl load(final JSArray<JSString> propertyNames);

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
  external RangeJsImpl getCell(final JSNumber row, final JSNumber column);

  /// Gets the `Range` object beginning at a particular row index and
  /// column index, and spanning a certain number of rows and columns.
  ///
  /// @remarks
  /// [Api set: ExcelApi 1.7]
  ///
  /// @param startRow Start row (zero-indexed).
  /// @param startColumn Start column (zero-indexed).
  /// @param rowCount Number of rows to include in the range.
  /// @param columnCount Number of columns to include in the range.
  external RangeJsImpl getRangeByIndexes(
    final JSNumber startRow,
    final JSNumber startColumn,
    final JSNumber rowCount,
    final JSNumber columnCount,
  );
}

/// Range represents a set of one or more contiguous cells such as a cell,
///  a row, a column, or a block of cells.
/// To learn more about how ranges are used throughout the API,
/// start with {@link https://docs.microsoft.com/office/dev/add-ins/excel/excel-add-ins-core-concepts#ranges | Ranges in the Excel JavaScript API}.
///
/// @remarks
/// [Api set: ExcelApi 1.1]
///
@JS('Excel.Range')
@staticInterop
class RangeJsImpl extends office_extension_js.ClientObjectJsImpl {}

extension RangeJsImplExtension on RangeJsImpl {
  /// The request context associated with the object. This connects
  /// the add-in's process to the Office host application's process. */
  external RequestContextJsImpl get context;

  /// Represents the range values of the specified range.
  /// The data returned could be a string, number, or boolean.
  /// Cells that contain an error will return the error string.
  /// If the returned value starts with a plus ("+"), minus ("-"),
  /// or equal sign ("="), Excel interprets this value as a formula.
  ///
  /// Api set: ExcelApi 1.1
  external JSAny get values;
  external set values(final JSAny value);

  /// The number of rows in the range.
  ///
  /// Api set: ExcelApi 1.1
  external JSNumber get rowCount;

  /// Returns the row number of the first cell in the range. Zero-indexed.
  ///
  /// Api set: ExcelApi 1.1
  external JSNumber get rowIndex;

  /// The number of columns in the range.
  ///
  /// Api set: ExcelApi 1.1
  external JSNumber get columnCount;

  /// Returns the column number of the first cell in the range. Zero-indexed.
  ///
  /// Api set: ExcelApi 1.1
  external JSNumber get columnIndex;

  /// Returns a format object, encapsulating the range's font, fill,
  /// borders, alignment, and other properties.
  ///
  /// Api set: ExcelApi 1.1
  external RangeFormatJsImpl get format;

  /// Gets the `Range` object containing the single cell based on row and
  /// column numbers. The cell can be outside the bounds of its parent range,
  /// so long as it stays within the worksheet grid. The returned cell is
  /// located relative to the top left cell of the range.
  ///
  /// @remarks
  /// [Api set: ExcelApi 1.1]
  ///
  /// @param row Row number of the cell to be retrieved. Zero-indexed.
  /// @param column Column number of the cell to be retrieved. Zero-indexed.
  external RangeJsImpl getCell(final JSNumber row, final JSNumber column);

  /// Gets a `Range` object similar to the current `Range` object, but with
  /// its bottom-right corner expanded (or contracted) by some number of rows and columns.
  ///
  /// @remarks
  /// [Api set: ExcelApi 1.2]
  ///
  /// @param deltaRows The number of rows by which to expand the bottom-right corner,
  /// relative to the current range. Use a positive number to expand the range,
  /// or a negative number to decrease it.
  /// @param deltaColumns The number of columns by which to expand the bottom-right corner,
  /// relative to the current range. Use a positive number to expand the range,
  /// or a negative number to decrease it.
  external RangeJsImpl getResizedRange(
    final JSNumber deltaRows,
    final JSNumber deltaColumns,
  );

  /// Gets the `Range` object beginning at a particular row index and column index,
  /// and spanning a certain number of rows and columns.
  ///
  /// @remarks
  /// [Api set: ExcelApi 1.7]
  ///
  /// @param startRow Start row (zero-indexed).
  /// @param startColumn Start column (zero-indexed).
  /// @param rowCount Number of rows to include in the range.
  /// @param columnCount Number of columns to include in the range.
  external RangeJsImpl getRangeByIndexes(
    final JSNumber startRow,
    final JSNumber startColumn,
    final JSNumber rowCount,
    final JSNumber columnCount,
  );

  /// Gets the entire row of the range.
  ///
  /// @remarks
  /// [Api set: ExcelApi 1.1]
  ///
  /// @param row Row number of the range to be retrieved. Zero-indexed.
  external RangeJsImpl getRow(final JSNumber row);

  /// Gets the last row within the range. For example, the last row of "B2:D5" is "B5:D5".
  ///
  /// @remarks
  /// [Api set: ExcelApi 1.1]
  external RangeJsImpl getLastRow();

  /// Gets the last column within the range. For example, the last column of "B2:D5" is "D2:D5".
  ///
  /// @remarks
  /// [Api set: ExcelApi 1.1]
  external RangeJsImpl getLastColumn();

  /// Gets the last cell within the range. For example, the last cell of "B2:D5" is "D5".
  ///
  /// @remarks
  /// [Api set: ExcelApi 1.1]
  external RangeJsImpl getLastCell();

  /// Gets the entire column of the range.
  ///
  /// @remarks
  /// [Api set: ExcelApi 1.1]
  ///
  /// @param column Column number of the range to be retrieved. Zero-indexed.
  external RangeJsImpl getColumn(final JSNumber column);

  /// Returns the used range of the given range object. If there are no used cells
  /// within the range, this function will throw an `ItemNotFound` error.
  ///
  /// @remarks
  /// [Api set: ExcelApi 1.1]
  ///
  /// @param valuesOnly Considers only cells with values as used cells.
  external RangeJsImpl getUsedRange(final JSBoolean? valuesOnly);

  /// Returns the smallest range that encompasses the given range and any adjacent
  /// cells with data. This is similar to expanding the selection to the current
  /// region in the Excel UI.
  ///
  /// @remarks
  /// [Api set: ExcelApi 1.1]
  external RangeJsImpl getSurroundingRegion();

  /// Queues up a command to load the specified properties of the object.
  /// You must call `context.sync()` before reading the properties.
  ///
  /// @param propertyNames A comma-delimited string or an array of strings
  /// that specify the properties to load.
  external RangeJsImpl load(final JSArray<JSString> propertyNames);
}

/// An object encapsulating a range's format properties.
///
/// @remarks
/// [Api set: ExcelApi 1.1]
@JS('Excel.RangeFormat')
@staticInterop
class RangeFormatJsImpl extends office_extension_js.ClientObjectJsImpl {}

extension RangeFormatJsImplExtension on RangeFormatJsImpl {
  /// The request context associated with the object. This connects
  /// the add-in's process to the Office host application's process. */
  external RequestContextJsImpl get context;

  /// Specifies if text is automatically wrapped in the cell.
  ///
  /// Api set: ExcelApi 1.1
  external JSBoolean get wrapText;
  external set wrapText(final JSBoolean value);

  /// Queues up a command to load the specified properties of the object.
  /// You must call `context.sync()` before reading the properties.
  ///
  /// @param propertyNames A comma-delimited string or an array of strings
  /// that specify the properties to load.
  external RangeFormatJsImpl load(final JSArray<JSString> propertyNames);
}
