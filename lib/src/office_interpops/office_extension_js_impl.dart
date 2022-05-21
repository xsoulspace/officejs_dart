@JS('OfficeExtension')
library office_extension_js;

import 'package:js/js.dart';

import '../js_interpops/es6_js_impl.dart';

/// An abstract RequestContext object that facilitates requests to the
/// host Office application.
/// The `Excel.run` and `Word.run` methods provide a request context.
@JS('ClientRequestContext')
abstract class ClientRequestContextJsImpl {
  /// Queues up a command to load the specified properties of the object.
  /// You must call `context.sync()` before reading the properties.
  ///
  /// @param object The object whose properties are loaded.
  /// @param option A comma-delimited string, or array of strings,
  /// that specifies the properties to load, or an
  /// {@link OfficeExtension.LoadOption} object.
  external void load(
    final ClientObjectJsImpl object,
    final List<String> option,
  );

  /// Synchronizes the state between JavaScript proxy objects and the
  /// Office document, by executing instructions queued on the request context
  /// and retrieving properties of loaded Office objects for use in your code.
  /// This method returns a promise, which is resolved when the
  /// synchronization is complete.
  ///
  external PromiseJsImpl<T> sync<T>([final T? passThroughValue]);
}

/// An abstract proxy object that represents an object in an Office document.
/// You create proxy objects from the context (or from other proxy
/// objects), add commands to a queue to act on the object,
/// and then synchronize the
/// proxy object state with the document by calling `context.sync()`.
@JS('ClientObject')
abstract class ClientObjectJsImpl {
  /// The request context associated with the object */
  external ClientRequestContextJsImpl get context;

  /// Returns a boolean value for whether the corresponding object
  /// is a null object. You must call `context.sync()` before reading the
  /// isNullObject property.
  external bool get isNullObject;
}

/// Contains the result for methods that return primitive types.
/// The object's value property is retrieved from the document
/// after `context.sync()` is invoked. */
@JS('ClientResult')
abstract class ClientResultJsImpl<T> {
  /// The value of the result that is retrieved from the document
  /// after `context.sync()` is invoked. */
  external T get value;
}
