library excel;

import 'package:js/js.dart';
import 'package:flutter/material.dart';

import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

import './office_extension.dart' as office_extension;
import '../abstract/js_object_wrapper.dart';
import '../js_interops/es6_js_impl.dart' as js;
import '../js_interops/office_helpers_js_impl.dart';
import '../office_interops/excel_js_impl.dart' as excel_js;
import '../office_interops/excel_js_impl.dart';
import '../utils/interop_utils.dart';
import 'models/excel_models.dart';

class Excel {
  Excel._();

  static RequestContext? _context;

  // static Future<RequestContext> run() async {
  //   if (_context != null) return _context!;

  //   final jsContext = await handleThenable(runExcelJsImpl());
  //   _context = RequestContext.getInstance(jsContext);
  //   return _context!;
  // }

  static Future<RequestContext> run() async {
    if (_context != null) return _context!;
    js.PromiseJsImpl<excel_js.RequestContextJsImpl> promiseCallback(
      final excel_js.RequestContextJsImpl context,
    ) =>
        js.PromiseJsImpl<excel_js.RequestContextJsImpl>(
          allowInterop((
            final void Function(dynamic) resolve,
            final Null Function(Object) reject,
          ) {
            resolve(context);
          }),
        );
    final officeHelper = getOfficeHelpers();
    final contextJs = await handleThenable(
      callMethod(officeHelper, 'runExcel', [allowInterop(promiseCallback)]),
    );

    return RequestContext.getInstance(contextJs);
  }

  static Future<void> copySheetsFromAsset(
    String assetPath, {
    BuildContext? buildContext,
  }) async {
    String message = '';
    bool haveError = false;
    try {
      final context = await run();

      await context.sync();
      final workbook = context.workbook;

      final ByteData byteData = await rootBundle.load(assetPath);
      message += 'Loaded\n';
      final List<int> bytes = byteData.buffer.asUint8List();
      message += 'Converted\n';
      final String base64Data = base64Encode(bytes);
      message += '\n\n${base64Data}\n\n';
      message += 'Finalised\n';

      final options = {
        'sheetNamesToInsert': [],
        // Insert all sheets from the source workbook.
        'positionType': 'after',
        // Insert after the `relativeTo` sheet.
        'relativeTo': 'Sheet1',
        // The sheet relative to which the other sheets will be inserted.
      };

      await workbook.insertWorksheetsFromBase64(base64Data, options);
      message += 'Passed to JS\n';

      await context.sync();
      message += 'Excel Synced\n';
    } catch (error) {
      print(error);
      haveError = true;
      if (buildContext != null) {
        await showDialog(
            context: buildContext,
            builder: (BuildContext) {
              return SelectableText(
                  'Error in copySheetsFromAsset:\n${message} \n${error}');
            });
      }
    }

    if (buildContext != null && haveError == false) {
      await showDialog(
          context: buildContext,
          builder: (BuildContext) {
            return SelectableText('Info \n${message} ');
          });
    }
  }
}

class RequestContext extends JsObjectWrapper<excel_js.RequestContextJsImpl> {
  RequestContext._fromJsObject(super.jsObject);

  /// Creates a [RequestContext] from a [jsObject].
  ///
  /// {@template expando_explanation}
  /// If an instance is already associated with [jsObject],
  /// it is returned instead of creating a new instance.
  /// {@endtemplate}
  factory RequestContext.getInstance(
    final excel_js.RequestContextJsImpl jsObject,
  ) {
    return _expando[jsObject] ??= RequestContext._fromJsObject(jsObject);
  }

  static final _expando = Expando<RequestContext>();

  Workbook get workbook => Workbook.getInstance(jsObject.workbook);

  office_extension.TrackedObjects get trackedObjects =>
      office_extension.TrackedObjects.getInstance(jsObject.trackedObjects);

  Future<T> sync<T>([final T? passThroughValue]) {
    return handleThenable(jsObject.sync(passThroughValue));
  }
}

class Workbook extends office_extension.ClientObject<excel_js.WorkbookJsImpl> {
  Workbook._fromJsObject(super.jsObject);

  /// Creates a [Workbook] from a [jsObject].
  ///
  /// {@macro expando_explanation}
  factory Workbook.getInstance(
    final excel_js.WorkbookJsImpl jsObject,
  ) {
    return _expando[jsObject] ??= Workbook._fromJsObject(jsObject);
  }

  static final _expando = Expando<Workbook>();

  RequestContext get context => RequestContext.getInstance(jsObject.context);

  WorksheetCollection get worksheets =>
      WorksheetCollection.getInstance(jsObject.worksheets);

  String get name => jsObject.name;

  Worksheet load(final List<String> propertyNames) =>
      Worksheet.getInstance(jsObject.load(propertyNames));

  //new code
  // Add a method for duplicating a worksheet
  Future<void> duplicateSheetBackup(String originalSheetName,
      {String? newSheetName} /*{String? beforeSheetName}*/) async {
    // Get the RequestContext from the current Workbook instance
    final RequestContext context = this.context;

    try {
      // Get the original worksheet to copy
      Worksheet sheetToCopy =
          context.workbook.worksheets.getItem(originalSheetName);
      // Load the name property
      sheetToCopy.load(['name']);

      // Run the sync to load the property
      await context.sync();

      // Add a new worksheet
      Worksheet newSheet = await context.workbook.worksheets
          .add(newSheetName ?? (sheetToCopy.name + ' Copy'));
      // Load the position property in case you need to reposition the sheet
      newSheet.load(['position']);

      // if (beforeSheetName != null) {
      //   newSheet.position = worksheets.getItem(beforeSheetName).position;
      //   // Load the position property
      //   beforeSheet.load(['position']);
      // }

      // Sync the operations above
      await context.sync();

      // if (beforeSheetName != null) {
      //   // Update the position of the new sheet
      //   Worksheet beforeSheet = context.workbook.worksheets.getItem(beforeSheetName);
      //   newSheet.position = beforeSheet.position;
      //   // Ensure the position property is set in the batch
      //   newSheet.load(['position']);
      // }

      // Final sync to ensure all pending operations complete
      await context.sync();
    } catch (error) {
      print('Error duplicating worksheet: $error');
      throw error;
    }
  }

  Future<void> insertWorksheetsFromBase64(
      String base64Data, Map<String, dynamic> options) async {
    final completer = Completer<void>();

    try {
      // await jsObject.context.sync();
      await jsObject.insertWorksheetsFromBase64(base64Data, options);
      // await jsObject.context.sync();
      completer.complete();
    } catch (e) {
      completer.completeError(e);
    }

    return completer.future;
  }
}

class WorksheetCollection
    extends office_extension.ClientObject<excel_js.WorksheetCollectionJsImpl> {
  WorksheetCollection._fromJsObject(super.jsObject);

  /// Creates a [WorksheetCollection] from a [jsObject].
  ///
  /// {@macro expando_explanation}
  factory WorksheetCollection.getInstance(
    final excel_js.WorksheetCollectionJsImpl jsObject,
  ) {
    return _expando[jsObject] ??= WorksheetCollection._fromJsObject(jsObject);
  }

  static final _expando = Expando<WorksheetCollection>();

  RequestContext get context => RequestContext.getInstance(jsObject.context);

  List<Worksheet> get items =>
      jsObject.items.map(Worksheet.getInstance).toList();

  office_extension.ClientResult getCount({final bool? visibleOnly}) =>
      office_extension.ClientResult.getInstance(
        jsObject.getCount(visibleOnly),
      );
  Worksheet getFirst({final bool? visibleOnly}) =>
      Worksheet.getInstance(jsObject.getFirst(visibleOnly));

  Worksheet getItem(final String key) =>
      Worksheet.getInstance(jsObject.getItem(key));

  office_extension.EventHandlers<WorksheetMovedEventArgs> get onMoved =>
      office_extension.EventHandlers.getInstance(
        jsObject.onMoved,
        WorksheetMovedEventArgs.fromJson,
      );

  office_extension.EventHandlers<WorksheetActivatedEventArgs> get onActivated =>
      office_extension.EventHandlers.getInstance(
        jsObject.onActivated,
        WorksheetActivatedEventArgs.fromJson,
      );
  office_extension.EventHandlers<WorksheetAddedEventArgs> get onAdded =>
      office_extension.EventHandlers.getInstance(
        jsObject.onAdded,
        WorksheetAddedEventArgs.fromJson,
      );
  office_extension.EventHandlers<WorksheetDeletedEventArgs> get onDeleted =>
      office_extension.EventHandlers.getInstance(
        jsObject.onDeleted,
        WorksheetDeletedEventArgs.fromJson,
      );
  office_extension.EventHandlers<WorksheetChangedEventArgs> get onChanged =>
      office_extension.EventHandlers.getInstance(
        jsObject.onChanged,
        WorksheetChangedEventArgs.fromJson,
      );
  office_extension.EventHandlers<WorksheetNameChangedEventArgs>
      get onNameChanged => office_extension.EventHandlers.getInstance(
            jsObject.onNameChanged,
            WorksheetNameChangedEventArgs.fromJson,
          );
  Worksheet getActiveWorksheet() =>
      Worksheet.getInstance(jsObject.getActiveWorksheet());
  WorksheetCollection load(final List<String> propertyNames) {
    return WorksheetCollection.getInstance(jsObject.load(propertyNames));
  }

  Future<Worksheet> add(String worksheetName) async {
    final context = this.context;
    final newWorksheet = this.jsObject.add(worksheetName);
    await context.sync();
    return Worksheet.getInstance(newWorksheet);
  }

  // Future<List<String>> addFromBase64({
  //   required String base64File,
  //   List<String>? sheetNamesToInsert,
  //   String? positionTypeString,
  //   dynamic relativeTo,
  // }) async {
  //   try{
  //     final relativeToObject =
  //     relativeTo is Worksheet ? relativeTo.jsObject : relativeTo;
  //
  //     final clientResult =  await jsObject.addFromBase64(
  //         base64File,
  //         sheetNamesToInsert,
  //         positionTypeString,
  //         relativeToObject
  //     );
  //
  //     // Context sync is assumed to be called outside or handled within a batch operation.
  //     await context.sync();
  //
  //     // Assuming ClientResultJsImpl is the correct type that corresponds to OfficeExtension.ClientResult
  //     return clientResult;
  //   }catch(e){
  //     return e;
  //   }
  // }
}

class Worksheet
    extends office_extension.ClientObject<excel_js.WorksheetJsImpl> {
  Worksheet._fromJsObject(super.jsObject);

  /// Creates a [Worksheet] from a [jsObject].
  ///
  /// {@macro expando_explanation}
  factory Worksheet.getInstance(
    final excel_js.WorksheetJsImpl jsObject,
  ) {
    return _expando[jsObject] ??= Worksheet._fromJsObject(jsObject);
  }
  static final _expando = Expando<Worksheet>();

  RequestContext get context => RequestContext.getInstance(jsObject.context);

  String get id => jsObject.id;

  String get name => jsObject.name;
  set name(final String value) => jsObject.name = value;

  int get position => jsObject.position;
  set position(final int value) => jsObject.position = value;

  bool get showGridlines => jsObject.showGridlines;
  set showGridlines(final bool value) => jsObject.showGridlines = value;

  String? get tabColor => jsObject.tabColor;
  set tabColor(final String? value) => jsObject.tabColor = value;

  Range getCell({
    required final int row,
    required final int column,
  }) =>
      Range._fromJsObject(jsObject.getCell(row, column));

  Range getRangeByIndexes({
    required final int startRow,
    required final int startColumn,
    required final int rowCount,
    required final int columnCount,
  }) {
    final jsRange = jsObject.getRangeByIndexes(
      startRow,
      startColumn,
      rowCount,
      columnCount,
    );
    return Range._fromJsObject(jsRange);
  }

  Worksheet load(final List<String> propertyNames) =>
      Worksheet.getInstance(jsObject.load(propertyNames));

  void activate() => jsObject.activate();

  Range getUsedRange() {
    final jsRange = jsObject.getUsedRange();
    return Range._fromJsObject(jsRange);
  }
}

class Range extends office_extension.ClientObject<excel_js.RangeJsImpl> {
  Range._fromJsObject(super.jsObject);

  /// Creates a [Range] from a [jsObject].
  ///
  /// {@macro expando_explanation}
  factory Range.getInstance(
    final excel_js.RangeJsImpl jsObject,
  ) {
    return _expando[jsObject] ??= Range._fromJsObject(jsObject);
  }
  static final _expando = Expando<Range>();
  RequestContext get context => RequestContext.getInstance(jsObject.context);

  Range getUsedRange({final bool? valuesOnly}) =>
      Range._fromJsObject(jsObject.getUsedRange(valuesOnly));

  Range getSurroundingRegion() =>
      Range._fromJsObject(jsObject.getSurroundingRegion());

  Range getRangeByIndexes({
    required final int startRow,
    required final int startColumn,
    required final int rowCount,
    required final int columnCount,
  }) {
    final jsRange = jsObject.getRangeByIndexes(
      startRow,
      startColumn,
      rowCount,
      columnCount,
    );
    return Range._fromJsObject(jsRange);
  }

  Range getRow(final int row) => Range._fromJsObject(jsObject.getRow(row));

  Range getLastRow() => Range._fromJsObject(jsObject.getLastRow());
  Range getLastColumn() => Range._fromJsObject(jsObject.getLastColumn());
  Range getLastCell() => Range._fromJsObject(jsObject.getLastCell());

  Future<void> clear(String v) async {
    // Ensure context is synced before using the range
    await context.sync();

    // Call clear method on the range
    jsObject.clear(v);

    // Ensure changes are synchronized with the workbook
    await context.sync();
  }

  Future<void> delete(String shiftDirection) async {
    jsObject.delete(shiftDirection);
  }

  Range getColumn(final int column) =>
      Range._fromJsObject(jsObject.getColumn(column));

  List<List<dynamic>> get values =>
      List.castFrom<dynamic, List<dynamic>>(jsObject.values);

  set values(final List<List<dynamic>> values) => jsObject.values = values;

  Range load(final List<String> propertyNames) =>
      Range.getInstance(jsObject.load(propertyNames));

  int get rowCount => jsObject.rowCount;
  int get rowIndex => jsObject.rowIndex;
  int get columnCount => jsObject.columnCount;
  int get columnIndex => jsObject.columnIndex;

  List<List<dynamic>> get numberFormat =>
      List.castFrom<dynamic, List<dynamic>>(jsObject.values);
  set numberFormat(final List<List<dynamic>> values) =>
      jsObject.values = values;

  RangeFormat get format => RangeFormat._fromJsObject(jsObject.format);

  //new code starts

  Future<void> insert(String direction) async {
    jsObject.insert(direction);
  }

  //code to find matches

//new code ends

// Dart-friendly wrapper for the find method
  Range find(String text,
      {bool completeMatch = false,
      bool matchCase = false,
      String searchDirection = 'Forward'}) {
    // Create the options object
    var options = {
      'completeMatch': completeMatch,
      'matchCase': matchCase,
      'searchDirection': searchDirection
    };

    // Call the find method on the underlying JS object
    var foundRangeJsImpl = jsObject.find(text, options);

    // Return a new Range instance wrapping the found RangeJsImpl
    return Range.getInstance(foundRangeJsImpl);
  }

  // Implement a find and replace functionality method
  Future<void> findAndReplace({
    required String searchText,
    required String replaceText,
    bool matchCase = false,
    bool completeMatch = false,
  }) async {
    // Define search options
    var options = <String, dynamic>{
      'completeMatch': completeMatch,
      'matchCase': matchCase,
      'searchDirection': 'Forward', // Or 'Backward'
    };

    // Enter the loop: find and replace all occurrences
    while (true) {
      var foundRangeJsImpl = jsObject.find(searchText, options);

      // Null check based on Office.js Promise-like callback pattern
      if (foundRangeJsImpl == null) {
        // No more appearances are found, exit the loop
        break;
      }

      // Get the Dart Range instance from the found JavaScript range object
      Range foundRange = Range.getInstance(foundRangeJsImpl);

      // Replace the text in the found range and load its address
      foundRange.values = [
        [replaceText]
      ];
      foundRange.load([
        'address'
      ]); // Optional, if you want to check where the replacement took place

      // Synchronize changes to the Excel workbook
      await context.sync();

      // Optionally, print the address of the replaced range (if you had loaded it earlier)
      // print(foundRange.address);
    }
  }

  // Method to load the address property
  Future<String> loadAddress() async {
    // Queue up a command to load the address property
    jsObject.load(['address']);

    // Run the queued-up command, and return a promise to indicate task completion
    await context.sync();

    // Return the address property
    return jsObject.address;
  }

  // Method to activate (select) the range in the Excel workbook
  Future<void> activate() async {
    // Call the 'select' method on the range
    jsObject.select();

    // Since 'select' is an action that affects the state of the workbook interface,
    // you should ensure any pending commands are synchronized with the Excel workbook
    await context.sync();
  }

  // Method to find a string and activate (select) the range where it's found
  Future<void> findAndActivate(String searchText,
      {bool matchCase = false, bool completeMatch = false}) async {
    // Object to specify search options
    final options = <String, dynamic>{
      'completeMatch': completeMatch,
      'matchCase': matchCase,
      'searchDirection': 'Forward',
    };

    // Find the text in the range
    final foundRangeJsImpl = jsObject.find(searchText, options);

    // Before using foundRangeJsImpl, you may need a mechanism to ensure it's not null.
    // if (foundRangeJsImpl == null) {
    //   // Handle the scenario where the text is not found
    //   return;
    // }
    // Wrap the JavaScript Range object with the Dart Range object
    final foundRange = Range._fromJsObject(foundRangeJsImpl);

    // Activate the found range
    await foundRange.activate();
  }

  void copyFrom(List<List<dynamic>> data) {
    jsObject.copyFrom(data);
  }
}

class RangeFormat
    extends office_extension.ClientObject<excel_js.RangeFormatJsImpl> {
  RangeFormat._fromJsObject(super.jsObject);

  /// Creates a [RangeFormat] from a [jsObject].
  ///
  /// {@macro expando_explanation}
  factory RangeFormat.getInstance(
    final excel_js.RangeFormatJsImpl jsObject,
  ) {
    return _expando[jsObject] ??= RangeFormat._fromJsObject(jsObject);
  }
  static final _expando = Expando<RangeFormat>();

  RequestContext get context => RequestContext.getInstance(jsObject.context);

  bool get wrapText => jsObject.wrapText;
  set wrapText(final bool value) => jsObject.wrapText = value;

  //new code starts
// Alignment

  // Font
  bool get bold => jsObject.font.bold;
  set bold(final bool value) => jsObject.font.bold = value;

  bool get italic => jsObject.font.italic;
  set italic(final bool value) => jsObject.font.italic = value;

  String get fontColor => jsObject.font.color;
  set fontColor(final String value) => jsObject.font.color = value;

  String get fontName => jsObject.font.name;
  set fontName(final String value) => jsObject.font.name = value;

  num get fontSize => jsObject.font.size;
  set fontSize(final num value) => jsObject.font.size = value;

  // Fill
  String get fillBackgroundColor => jsObject.fill.color;
  set fillBackgroundColor(final String value) => jsObject.fill.color = value;

  String get fillPattern => jsObject.fill.pattern;
  set fillPattern(final String value) => jsObject.fill.pattern = value;

  // Borders

  Borders get borders => Borders.getInstance(jsObject.borders);
  set borders(Borders value) => jsObject.borders = value.jsObject;
//border code ends

}

class RangeBorder extends office_extension.ClientObject<excel_js.BorderJsImpl> {
  RangeBorder._fromJsObject(super.jsObject);

  factory RangeBorder.getInstance(excel_js.BorderJsImpl jsObject) {
    return _expando[jsObject] ??= RangeBorder._fromJsObject(jsObject);
  }
  static final _expando = Expando<RangeBorder>();

  RequestContext get context => RequestContext.getInstance(jsObject.context);

  String get color => jsObject.color;
  set color(String value) => jsObject.color = value;

  String get style => jsObject.style;
  set style(String value) => jsObject.style = value;
}

class Borders extends office_extension.ClientObject<excel_js.BordersJsImpl> {
  Borders._fromJsObject(excel_js.BordersJsImpl jsObject) : super(jsObject);

  factory Borders.getInstance(excel_js.BordersJsImpl jsObject) {
    return _expando[jsObject] ??= Borders._fromJsObject(jsObject);
  }
  static final _expando = Expando<Borders>();

  RequestContext get context => RequestContext.getInstance(jsObject.context);

  // Method to get a specific border by its side index
  RangeBorder getItem(String sideIndex) {
    var borderJsImpl = jsObject.getItem(sideIndex);
    return RangeBorder.getInstance(borderJsImpl);
  }

  RangeBorder? get top =>
      jsObject.top != null ? RangeBorder.getInstance(jsObject.top!) : null;
  set top(RangeBorder? value) => jsObject.top = value?.jsObject;

  RangeBorder? get bottom => jsObject.bottom != null
      ? RangeBorder.getInstance(jsObject.bottom!)
      : null;
  set bottom(RangeBorder? value) => jsObject.bottom = value?.jsObject;

  RangeBorder? get left =>
      jsObject.left != null ? RangeBorder.getInstance(jsObject.left!) : null;
  set left(RangeBorder? value) => jsObject.left = value?.jsObject;

  RangeBorder? get right =>
      jsObject.right != null ? RangeBorder.getInstance(jsObject.right!) : null;
  set right(RangeBorder? value) => jsObject.right = value?.jsObject;
}

//new font class definition
class Font extends office_extension.ClientObject<excel_js.FontJsImpl> {
  Font._fromJsObject(super.jsObject);

  /// Creates a [Font] from a [jsObject].
  ///
  /// {@macro expando_explanation}
  factory Font.getInstance(final excel_js.FontJsImpl jsObject) {
    return _expando[jsObject] ??= Font._fromJsObject(jsObject);
  }

  static final _expando = Expando<Font>();

  /// Gets or sets a value that represents the bold status of the font.
  bool get bold => jsObject.bold;
  set bold(bool value) => jsObject.bold = value;

  /// Gets or sets a value that represents the italic status of the font.
  bool get italic => jsObject.italic;
  set italic(bool value) => jsObject.italic = value;

  /// Gets or sets the color of the given font.
  String get fontColor => jsObject.color;
  set fontColor(String value) => jsObject.color = value;

  /// Gets or sets the name of the font.
  String get fontName => jsObject.name;
  set fontName(String value) => jsObject.name = value;

  /// Gets or sets the size of the font in points.
  num get fontSize => jsObject.size;
  set fontSize(num value) => jsObject.size = value;
}
