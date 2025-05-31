import 'dart:js_interop';

/// {@template client_request_context}
/// An abstract RequestContext object that facilitates requests to the
/// host Office application.
/// The `Excel.run` and `Word.run` methods provide a request context.
/// {@endtemplate}
@JS('OfficeExtension.ClientRequestContext')
@staticInterop
class ClientRequestContextJsImpl {}

extension ClientRequestContextJsImplExtension on ClientRequestContextJsImpl {
  /// Queues up a command to load the specified properties of the object.
  /// You must call `context.sync()` before reading the properties.
  ///
  /// @param object The object whose properties are loaded.
  /// @param option A comma-delimited string, or array of strings,
  /// that specifies the properties to load, or an
  /// {@link OfficeExtension.LoadOption} object.
  external void load(
    final ClientObjectJsImpl object,
    final JSArray<JSString> option,
  );

  /// Synchronizes the state between JavaScript proxy objects and the
  /// Office document, by executing instructions queued on the request context
  /// and retrieving properties of loaded Office objects for use in your code.
  /// This method returns a promise, which is resolved when the
  /// synchronization is complete.
  external JSPromise<T> sync<T extends JSAny?>([final T? passThroughValue]);
}

/// {@template client_object}
/// An abstract proxy object that represents an object in an Office document.
/// You create proxy objects from the context (or from other proxy
/// objects), add commands to a queue to act on the object,
/// and then synchronize the
/// proxy object state with the document by calling `context.sync()`.
/// {@endtemplate}
@JS('OfficeExtension.ClientObject')
@staticInterop
class ClientObjectJsImpl {}

extension ClientObjectJsImplExtension on ClientObjectJsImpl {
  /// The request context associated with the object */
  external ClientRequestContextJsImpl get context;

  /// Returns a boolean value for whether the corresponding object
  /// is a null object. You must call `context.sync()` before reading the
  /// isNullObject property.
  external JSBoolean get isNullObject;
}

/// {@template client_result}
/// Contains the result for methods that return primitive types.
/// The object's value property is retrieved from the document
/// after `context.sync()` is invoked. */
/// {@endtemplate}
@JS('OfficeExtension.ClientResult')
@staticInterop
class ClientResultJsImpl<T extends JSAny?> {}

extension ClientResultJsImplExtension<T extends JSAny?> on ClientResultJsImpl<T> {
  /// The value of the result that is retrieved from the document
  /// after `context.sync()` is invoked. */
  external T get value;
}

/// {@template event_handlers}
/// Event handlers for Office extension events
/// {@endtemplate}
@JS('OfficeExtension.EventHandlers')
@staticInterop
class EventHandlersJsImpl {}

extension EventHandlersJsImplExtension on EventHandlersJsImpl {
  /// Adds a function to be called when the event is triggered.
  /// @param handler A promise-based function that takes
  /// in any relevant event arguments.
  external EventHandlerResultJsImpl add(
    final JSFunction handler,
  );

  /// Removes the specified function from the event handler list
  /// so that it will not be called on subsequent events.
  ///
  /// **Note**: The same
  /// {@link OfficeExtension.ClientRequestContext | RequestContext}
  /// object that the handler was added in must be used
  /// when removing the handler.
  /// More information can be found in
  /// {@link https://docs.microsoft.com/office/dev/add-ins/excel/excel-add-ins-events#remove-an-event-handler | Remove an event handler}.
  ///
  /// @param handler A reference to a function previously
  /// provided to the `add` method as an event handler.
  external void remove(final JSFunction handler);
}

/// {@template event_handler_result}
/// Result of adding an event handler
/// {@endtemplate}
@JS('OfficeExtension.EventHandlerResult')
@staticInterop
class EventHandlerResultJsImpl {}

extension EventHandlerResultJsImplExtension on EventHandlerResultJsImpl {
  /// The request context associated with the object
  external ClientRequestContextJsImpl get context;
  external void remove();
}

/// {@template tracked_objects}
/// Collection of tracked objects, contained within a request context.
/// See {@link https://learn.microsoft.com/javascript/api/office/officeextension.clientrequestcontext#office-officeextension-clientrequestcontext-trackedobjects-member | context.trackedObjects}
/// for more information.
/// {@endtemplate}
@JS('OfficeExtension.TrackedObjects')
@staticInterop
class TrackedObjectsJsImpl {}

extension TrackedObjectsJsImplExtension on TrackedObjectsJsImpl {
  /// Track a new object for automatic adjustment based on surrounding
  /// changes in the document. Only some object types require this.
  /// If you are using an object across ".sync" calls and outside
  /// the sequential execution of a ".run" batch,
  /// and get an "InvalidObjectPath" error when setting a property or
  /// invoking a method on the object, you needed to have added the object
  /// to the tracked object collection when the object was first created.
  /// If this object is part of a collection in Word, you should also track
  /// the parent collection.
  external void add(final ClientObjectJsImpl object);

  /// Release the memory associated with an object that was previously
  /// added to this collection.
  /// Having many tracked objects slows down the Office application,
  /// so please remember to free any objects you add, once you're
  /// done using them.
  /// You will need to call `context.sync()` before the memory release
  /// takes effect.
  external void remove(final ClientObjectJsImpl object);
}
