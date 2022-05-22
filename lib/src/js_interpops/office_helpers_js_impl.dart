@JS()
library excel.init;

import 'package:js/js.dart';

import '../office_interpops/excel_js_impl.dart' as excel_js;
import 'es6_js_impl.dart';

/// Executes a batch script that performs actions on the Excel object model,
/// using a new [RequestContext]. When the promise is resolved,
/// any tracked objects that were automatically allocated during
/// execution will be released.
///
/// !To get this function working, provide the function below
/// in index.html script
/// ```javascript
/// window.runExcel = () => {
///   return Excel.run((ctx) => new Promise((resolve) => resolve(ctx)))
/// }
/// ```
@JS('runExcel')
external PromiseJsImpl<excel_js.RequestContextJsImpl> runExcelJsImpl();

/// Ensures that the Office JavaScript APIs are ready to be called
/// by the add-in. If the framework hasn't initialized yet,
/// the callback or promise
/// will wait until the Office host is ready to accept API calls.
/// Note that though this API is intended to be used inside
/// an Office add-in, it can
/// also be used outside the add-in. In that case, once Office.js
/// determines that it is running outside of an Office host application,
/// it will call
/// the callback and resolve the promise with "null" for both the host
/// and platform.
///
/// @param callback - An optional callback method, that will receive
/// the host and platform info.
/// Alternatively, rather than use a callback, an add-in may simply
/// wait for the Promise returned by the function to resolve.
/// @returns A Promise that contains the host and platform info, once
/// initialization is completed.
///
/// !To get this function working, provide the function below
/// in index.html script
///
/// ```javascript
/// window.getOfficeInfo = () => {
///   /** get Office info if available**/
///   return Office.onReady(
///     (info) => new Promise((resolve) => resolve(info))
///   );
/// };
/// ```
@JS('getOfficeInfo')
external PromiseJsImpl<Map<String, dynamic>> getOfficeInfoJsImpl();
