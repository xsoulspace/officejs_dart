import 'dart:js_interop';

import '../abstract/js_object_wrapper.dart';
import '../js_interops/office_helpers_js_impl.dart';
import '../office_interops/excel_js_impl.dart' as excel_js;
import '../office_interops/office_extension_js_impl.dart'
    as office_extension_js;
import '../utils/interop_utils.dart';
import './office_extension.dart' as office_extension;
import 'models/excel_models.dart';

class Excel {
  Excel._();
  static RequestContext? _context;

  static Future<RequestContext> run() async {
    if (_context != null) return _context!;

    JSFunction createBatch() =>
        ((final excel_js.RequestContextJsImpl context) {
          // Return the context directly
          return context;
        }).toJS;

    final officeHelper = getOfficeHelpers();
    final promise = officeHelper.runExcel(createBatch());
    final contextJs = await handleThenable(promise as JSPromise<JSAny?>);

    return RequestContext.getInstance(
      contextJs! as excel_js.RequestContextJsImpl,
    );
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
  ) => _expando[jsObject] ??= RequestContext._fromJsObject(jsObject);

  static final _expando = Expando<RequestContext>();

  Workbook get workbook => Workbook.getInstance(jsObject.workbook);

  office_extension.TrackedObjects get trackedObjects =>
      office_extension.TrackedObjects.getInstance(jsObject.trackedObjects);

  Future<JSAny?> sync([final JSAny? passThroughValue]) {
    final clientContext =
        jsObject as office_extension_js.ClientRequestContextJsImpl;
    return handleThenable(clientContext.sync(passThroughValue));
  }
}

class Workbook extends office_extension.ClientObject<excel_js.WorkbookJsImpl> {
  Workbook._fromJsObject(super.jsObject);

  /// Creates a [Workbook] from a [jsObject].
  ///
  /// {@macro expando_explanation}
  factory Workbook.getInstance(final excel_js.WorkbookJsImpl jsObject) =>
      _expando[jsObject] ??= Workbook._fromJsObject(jsObject);

  static final _expando = Expando<Workbook>();

  RequestContext get context => RequestContext.getInstance(jsObject.context);

  WorksheetCollection get worksheets =>
      WorksheetCollection.getInstance(jsObject.worksheets);

  String get name => jsObject.name.toDart;

  Worksheet load(final List<String> propertyNames) => Worksheet.getInstance(
    jsObject.load(propertyNames.map((final e) => e.toJS).toList().toJS),
  );
}

class WorksheetCollection
    extends office_extension.ClientObject<excel_js.WorksheetCollectionJsImpl> {
  WorksheetCollection._fromJsObject(super.jsObject);

  /// Creates a [WorksheetCollection] from a [jsObject].
  ///
  /// {@macro expando_explanation}
  factory WorksheetCollection.getInstance(
    final excel_js.WorksheetCollectionJsImpl jsObject,
  ) => _expando[jsObject] ??= WorksheetCollection._fromJsObject(jsObject);

  static final _expando = Expando<WorksheetCollection>();

  RequestContext get context => RequestContext.getInstance(jsObject.context);

  List<Worksheet> get items {
    final jsItems = jsObject.items;
    final dartItems = <Worksheet>[];
    for (int i = 0; i < jsItems.length; i++) {
      final item = jsItems[i] as excel_js.WorksheetJsImpl;
      dartItems.add(Worksheet.getInstance(item));
    }
    return dartItems;
  }

  office_extension.ClientResult<JSAny> getCount({final bool? visibleOnly}) =>
      office_extension.ClientResult.getInstance(
        jsObject.getCount(visibleOnly?.toJS),
      );
  Worksheet getFirst({final bool? visibleOnly}) =>
      Worksheet.getInstance(jsObject.getFirst(visibleOnly?.toJS));

  Worksheet getItem(final String key) =>
      Worksheet.getInstance(jsObject.getItem(key.toJS));

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
  WorksheetCollection load(final List<String> propertyNames) =>
      WorksheetCollection.getInstance(
        jsObject.load(propertyNames.map((final e) => e.toJS).toList().toJS),
      );
}

class Worksheet
    extends office_extension.ClientObject<excel_js.WorksheetJsImpl> {
  Worksheet._fromJsObject(super.jsObject);

  /// Creates a [Worksheet] from a [jsObject].
  ///
  /// {@macro expando_explanation}
  factory Worksheet.getInstance(final excel_js.WorksheetJsImpl jsObject) =>
      _expando[jsObject] ??= Worksheet._fromJsObject(jsObject);
  static final _expando = Expando<Worksheet>();

  RequestContext get context => RequestContext.getInstance(jsObject.context);

  String get id => jsObject.id.toDart;

  String get name => jsObject.name.toDart;
  set name(final String value) => jsObject.name = value.toJS;

  int get position => jsObject.position.toDartInt;
  set position(final int value) => jsObject.position = value.toJS;

  bool get showGridlines => jsObject.showGridlines.toDart;
  set showGridlines(final bool value) => jsObject.showGridlines = value.toJS;

  String? get tabColor => jsObject.tabColor?.toDart;
  set tabColor(final String? value) => jsObject.tabColor = value?.toJS;

  Range getCell({required final int row, required final int column}) =>
      Range._fromJsObject(jsObject.getCell(row.toJS, column.toJS));

  Range getRangeByIndexes({
    required final int startRow,
    required final int startColumn,
    required final int rowCount,
    required final int columnCount,
  }) {
    final jsRange = jsObject.getRangeByIndexes(
      startRow.toJS,
      startColumn.toJS,
      rowCount.toJS,
      columnCount.toJS,
    );
    return Range._fromJsObject(jsRange);
  }

  Worksheet load(final List<String> propertyNames) => Worksheet.getInstance(
    jsObject.load(propertyNames.map((final e) => e.toJS).toList().toJS),
  );

  void activate() => jsObject.activate();
}

class Range extends office_extension.ClientObject<excel_js.RangeJsImpl> {
  Range._fromJsObject(super.jsObject);

  /// Creates a [Range] from a [jsObject].
  ///
  /// {@macro expando_explanation}
  factory Range.getInstance(final excel_js.RangeJsImpl jsObject) =>
      _expando[jsObject] ??= Range._fromJsObject(jsObject);
  static final _expando = Expando<Range>();
  RequestContext get context => RequestContext.getInstance(jsObject.context);

  Range getUsedRange({final bool? valuesOnly}) =>
      Range._fromJsObject(jsObject.getUsedRange(valuesOnly?.toJS));

  Range getSurroundingRegion() =>
      Range._fromJsObject(jsObject.getSurroundingRegion());

  Range getRangeByIndexes({
    required final int startRow,
    required final int startColumn,
    required final int rowCount,
    required final int columnCount,
  }) {
    final jsRange = jsObject.getRangeByIndexes(
      startRow.toJS,
      startColumn.toJS,
      rowCount.toJS,
      columnCount.toJS,
    );
    return Range._fromJsObject(jsRange);
  }

  Range getRow(final int row) => Range._fromJsObject(jsObject.getRow(row.toJS));

  Range getLastRow() => Range._fromJsObject(jsObject.getLastRow());
  Range getLastColumn() => Range._fromJsObject(jsObject.getLastColumn());
  Range getLastCell() => Range._fromJsObject(jsObject.getLastCell());

  Range getColumn(final int column) =>
      Range._fromJsObject(jsObject.getColumn(column.toJS));

  List<List<dynamic>> get values {
    final jsValues = jsObject.values;
    return (dartify(jsValues)! as List).cast<List<dynamic>>();
  }

  set values(final List<List<dynamic>> values) {
    final jsValues = jsify(values);
    jsObject.values = jsValues!;
  }

  Range load(final List<String> propertyNames) => Range.getInstance(
    jsObject.load(propertyNames.map((final e) => e.toJS).toList().toJS),
  );

  int get rowCount => jsObject.rowCount.toDartInt;
  int get rowIndex => jsObject.rowIndex.toDartInt;
  int get columnCount => jsObject.columnCount.toDartInt;
  int get columnIndex => jsObject.columnIndex.toDartInt;

  List<List<dynamic>> get numberFormat {
    final jsValues = jsObject.values;
    return (dartify(jsValues)! as List).cast<List<dynamic>>();
  }

  set numberFormat(final List<List<dynamic>> values) {
    final jsValues = jsify(values);
    jsObject.values = jsValues!;
  }

  RangeFormat get format => RangeFormat._fromJsObject(jsObject.format);
}

class RangeFormat
    extends office_extension.ClientObject<excel_js.RangeFormatJsImpl> {
  RangeFormat._fromJsObject(super.jsObject);

  /// Creates a [RangeFormat] from a [jsObject].
  ///
  /// {@macro expando_explanation}
  factory RangeFormat.getInstance(final excel_js.RangeFormatJsImpl jsObject) =>
      _expando[jsObject] ??= RangeFormat._fromJsObject(jsObject);
  static final _expando = Expando<RangeFormat>();

  RequestContext get context => RequestContext.getInstance(jsObject.context);

  bool get wrapText => jsObject.wrapText.toDart;
  set wrapText(final bool value) => jsObject.wrapText = value.toJS;
}
