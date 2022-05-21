@JS()
library excel.init;

import 'package:js/js.dart';

import '../office_interpops/excel_js_impl.dart' as excel;
import 'es6_js_impl.dart';

/// Executes a batch script that performs actions on the Excel object model,
/// using a new [RequestContext]. When the promise is resolved,
/// any tracked objects that were automatically allocated during
/// execution will be released.
///
/// Under the hood it uses js function returning a new [PromiseJsImpl]
/// with [RequestContext]
/// ```javascript
/// window.runExcel = () => {
///   return Excel.run((ctx) => new Promise((resolve) => resolve(ctx)))
/// }
/// ```
@JS('runExcel')
external PromiseJsImpl<excel.RequestContextJsImpl> runExcelJsImpl();
