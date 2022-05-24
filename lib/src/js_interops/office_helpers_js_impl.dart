@JS()
library excel.init;

import 'package:js/js.dart';

import '../office_interops/excel_js_impl.dart' as excel_js;
import 'es6_js_impl.dart';

@JS('getOfficeHelpers')
external PromiseJsImpl<OfficeHelpersJsImpl> getOfficeHelpers();

@JS('OfficeHelpers')
abstract class OfficeHelpersJsImpl {
  /// Executes a batch script that performs actions on the Excel object model,
  /// using a new RequestContext. When the promise is resolved,
  /// any tracked objects that were automatically allocated
  /// during execution will be released.
  /// @param batch - A function that takes in a RequestContext
  /// and returns a promise (typically, just the result of "context.sync()").
  /// The context parameter facilitates requests to the Excel application.
  /// Since the Office add-in and the Excel application run in
  /// two different processes, the RequestContext is required to get access
  /// to the Excel object model from the add-in.
  @JS('runExcel')
  external PromiseJsImpl<excel_js.RequestContextJsImpl> runExcel(
    final PromiseJsImpl<excel_js.RequestContextJsImpl> Function(
      excel_js.RequestContextJsImpl,
    )
        batch,
  );

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
  /// convert dynamic to [OfficeInfo] via [dartify]
  @JS('officeOnReady')
  external PromiseJsImpl<dynamic> officeOnReady(
    final dynamic Function() callback,
  );
}
