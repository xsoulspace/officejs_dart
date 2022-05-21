library excel;

import './office_extension.dart' as office_extension;
import '../abstract/js_object_wrapper.dart';
import '../js_interpops/excel_init_js_impl.dart';
import '../office_interpops/excel_js_impl.dart' as excel_js;
import '../utils/interpop_utils.dart';

class Excel {
  Excel._();
  static RequestContext? _context;
  static Future<RequestContext> run() async {
    if (_context != null) return _context!;

    final jsContext = await handleThenable(runExcelJsImpl());
    _context = RequestContext.fromJsObject(jsContext);
    return _context!;
  }
}

class RequestContext extends JsObjectWrapper<excel_js.RequestContextJsImpl> {
  RequestContext.fromJsObject(super.jsObject);
  Workbook get workbook => Workbook.fromJsObject(super.jsObject.workbook);
}

class Workbook extends JsObjectWrapper<excel_js.WorkbookJsImpl> {
  Workbook.fromJsObject(super.jsObject);

  RequestContext get context =>
      RequestContext.fromJsObject(super.jsObject.context);

  WorksheetCollection get worksheets =>
      WorksheetCollection.fromJsObject(super.jsObject.worksheets);

  Worksheet load(final List<String> propertyNames) =>
      Worksheet.fromJsObject(super.jsObject.load(propertyNames));
}

class WorksheetCollection
    extends JsObjectWrapper<excel_js.WorksheetCollectionJsImpl> {
  WorksheetCollection.fromJsObject(super.jsObject);

  RequestContext get context =>
      RequestContext.fromJsObject(super.jsObject.context);

  List<Worksheet> get items =>
      super.jsObject.items.map(Worksheet.fromJsObject).toList();

  office_extension.ClientResult getCount({final bool? visibleOnly}) =>
      office_extension.ClientResult.fromJsObject(
        super.jsObject.getCount(visibleOnly),
      );
  Worksheet getFirst({final bool? visibleOnly}) =>
      Worksheet.fromJsObject(super.jsObject.getFirst(visibleOnly));

  Worksheet getItem(final String key) =>
      Worksheet.fromJsObject(super.jsObject.getItem(key));
}

class Worksheet extends JsObjectWrapper<excel_js.WorksheetJsImpl> {
  Worksheet.fromJsObject(super.jsObject);

  RequestContext get context =>
      RequestContext.fromJsObject(super.jsObject.context);

  String get name => super.jsObject.name;

  Worksheet load(final List<String> propertyNames) =>
      Worksheet.fromJsObject(super.jsObject.load(propertyNames));
}
