library excel;

import 'package:js/js.dart';

import './office_extension.dart' as office_extension;
import '../abstract/js_object_wrapper.dart';
import '../js_interpops/es6_js_impl.dart' as js;
import '../js_interpops/office_helpers_js_impl.dart';
import '../office_interpops/excel_js_impl.dart' as excel_js;
import '../utils/interpop_utils.dart';
import 'models/excel_models.dart';

class Excel {
  Excel._();
  static RequestContext? _context;
  static Future<RequestContext> run() async {
    if (_context != null) return _context!;

    final jsContext = await handleThenable(runExcelJsImpl());
    _context = RequestContext.getInstance(jsContext);
    return _context!;
  }

  static Future<RequestContext> nativeRun() async {
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
    final contextJs = await handleThenable(
      excel_js.ExcelJsImpl.run(allowInterop(promiseCallback)),
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

  Workbook get workbook => Workbook.getInstance(super.jsObject.workbook);

  Future<T> sync<T>([final T? passThroughValue]) {
    return handleThenable(super.jsObject.sync(passThroughValue));
  }
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

  office_extension.EventHandlers<WorksheetActivatedEventArgs> get onActivated =>
      office_extension.EventHandlers.getInstance(
        super.jsObject.onActivated,
        WorksheetActivatedEventArgs.fromJson,
      );
  office_extension.EventHandlers<WorksheetAddedEventArgs> get onAdded =>
      office_extension.EventHandlers.getInstance(
        super.jsObject.onAdded,
        WorksheetAddedEventArgs.fromJson,
      );
  office_extension.EventHandlers<WorksheetDeletedEventArgs> get onDeleted =>
      office_extension.EventHandlers.getInstance(
        super.jsObject.onDeleted,
        WorksheetDeletedEventArgs.fromJson,
      );
  office_extension.EventHandlers<WorksheetChangedEventArgs> get onChanged =>
      office_extension.EventHandlers.getInstance(
        super.jsObject.onChanged,
        WorksheetChangedEventArgs.fromJson,
      );
  office_extension.EventHandlers<WorksheetNameChangedEventArgs>
      get onNameChanged => office_extension.EventHandlers.getInstance(
            super.jsObject.onChanged,
            WorksheetNameChangedEventArgs.fromJson,
          );
  Worksheet getActiveWorksheet() =>
      Worksheet.getInstance(super.jsObject.getActiveWorksheet());
  WorksheetCollection load(final List<String> propertyNames) {
    return WorksheetCollection.getInstance(super.jsObject.load(propertyNames));
  }
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

  String get id => super.jsObject.id;

  String get name => super.jsObject.name;
  set name(final String value) => super.jsObject.name = value;

  int get position => super.jsObject.position;
  set position(final int value) => super.jsObject.position = value;

  bool get showGridlines => super.jsObject.showGridlines;
  set showGridlines(final bool value) => super.jsObject.showGridlines = value;

  String? get tabColor => super.jsObject.tabColor;
  set tabColor(final String? value) => super.jsObject.tabColor = value;

  Worksheet load(final List<String> propertyNames) =>
      Worksheet.getInstance(super.jsObject.load(propertyNames));
}
