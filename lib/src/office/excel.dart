library excel;

import './office_extension.dart' as office_extension;
import '../abstract/js_object_wrapper.dart';
import '../js_interpops/office_helpers_js_impl.dart';
import '../office_interpops/excel_js_impl.dart' as excel_js;
import '../utils/interpop_utils.dart';

class Excel {
  Excel._();
  static RequestContext? _context;
  static Future<RequestContext> run() async {
    if (_context != null) return _context!;

    final jsContext = await handleThenable(runExcelJsImpl());
    _context = RequestContext.getInstance(jsContext);
    return _context!;
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

  Workbook get workbook => Workbook.getInstance(super.jsObject.workbook);
}

class Workbook extends JsObjectWrapper<excel_js.WorkbookJsImpl> {
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

  RequestContext get context =>
      RequestContext.getInstance(super.jsObject.context);

  WorksheetCollection get worksheets =>
      WorksheetCollection.getInstance(super.jsObject.worksheets);

  Worksheet load(final List<String> propertyNames) =>
      Worksheet.getInstance(super.jsObject.load(propertyNames));
}

class WorksheetCollection
    extends JsObjectWrapper<excel_js.WorksheetCollectionJsImpl> {
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

  RequestContext get context =>
      RequestContext.getInstance(super.jsObject.context);

  List<Worksheet> get items =>
      super.jsObject.items.map(Worksheet.getInstance).toList();

  office_extension.ClientResult getCount({final bool? visibleOnly}) =>
      office_extension.ClientResult.getInstance(
        super.jsObject.getCount(visibleOnly),
      );
  Worksheet getFirst({final bool? visibleOnly}) =>
      Worksheet.getInstance(super.jsObject.getFirst(visibleOnly));

  Worksheet getItem(final String key) =>
      Worksheet.getInstance(super.jsObject.getItem(key));
}

class Worksheet extends JsObjectWrapper<excel_js.WorksheetJsImpl> {
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

  RequestContext get context =>
      RequestContext.getInstance(super.jsObject.context);

  String get name => super.jsObject.name;

  Worksheet load(final List<String> propertyNames) =>
      Worksheet.getInstance(super.jsObject.load(propertyNames));
}
