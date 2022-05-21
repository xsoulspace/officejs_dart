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
  /// [Api set: ExcelApi 1.4]
  ///
  /// @param visibleOnly Optional. If `true`, considers only visible
  /// worksheets, skipping over any hidden ones.
  external office_extension_js.ClientResultJsImpl<int> getCount([
    final bool? visibleOnly,
  ]);

  ///*
  /// Gets the first worksheet in the collection.
  ///
  /// [Api set: ExcelApi 1.5]
  ///
  /// @param visibleOnly Optional. If `true`, considers only visible
  /// worksheets, skipping over any hidden ones.
  ////
  external WorksheetJsImpl getFirst(final bool? visibleOnly);

  ///*
  /// Gets a worksheet object using its name or ID.
  ///
  /// [Api set: ExcelApi 1.1]
  ///
  /// @param key The name or ID of the worksheet.
  ////
  external WorksheetJsImpl getItem(final String key);

  /// Queues up a command to load the specified properties of the object.
  /// You must call `context.sync()` before reading the properties.
  ///
  /// @param propertyNames A comma-delimited string or an array of strings
  /// that specify the properties to load.
  external WorksheetJsImpl load(final List<String> propertyNames);
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

  /// Queues up a command to load the specified properties of the object.
  /// You must call `context.sync()` before reading the properties.
  ///
  /// @param propertyNames A comma-delimited string or an array of strings
  /// that specify the properties to load.
  external WorksheetJsImpl load(final List<String> propertyNames);
}
