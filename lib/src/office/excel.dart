library excel;

import 'package:js/js.dart';

import './office_extension.dart' as office_extension;
import '../abstract/js_object_wrapper.dart';
import '../js_interops/es6_js_impl.dart' as js;
import '../js_interops/office_helpers_js_impl.dart';
import '../office_interops/excel_js_impl.dart' as excel_js;
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


  Future<void> clear() async {
    // Ensure context is synced before using the range
    await context.sync();

    // Call clear method on the range
    jsObject.clear();

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

}





