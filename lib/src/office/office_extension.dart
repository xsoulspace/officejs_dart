library office_extension;

// ignore: avoid_web_libraries_in_flutter
import 'dart:js';

import '../abstract/js_object_wrapper.dart';
import '../js_interops/es6_js_impl.dart' as js;
import '../office_interops/office_extension_js_impl.dart'
    as office_extension_js;
import '../utils/interop_utils.dart';

class ClientRequestContext
    extends JsObjectWrapper<office_extension_js.ClientRequestContextJsImpl> {
  ClientRequestContext._fromJsObject(super.jsObject);

  /// Creates a [ClientRequestContext] from a [jsObject].
  ///
  /// {@macro expando_explanation}
  factory ClientRequestContext.getInstance(
    final office_extension_js.ClientRequestContextJsImpl jsObject,
  ) {
    return _expando[jsObject] ??= ClientRequestContext._fromJsObject(jsObject);
  }
  static final _expando = Expando<ClientRequestContext>();

  void load(
    final ClientObject object,
    final List<String> option,
  ) {
    super.jsObject.load(object.jsObject, option);
  }

  Future<T> sync<T>([final T? passThroughValue]) async {
    return handleThenable(jsObject.sync(passThroughValue));
  }
}

class ClientObject<
        TJsClientObject extends office_extension_js.ClientObjectJsImpl>
    extends JsObjectWrapper<TJsClientObject> {
  ClientObject(super.jsObject);
  ClientObject.fromJsObject(super.jsObject);

  // ClientRequestContext get context =>
  //     ClientRequestContext.getInstance(jsObject.context);

  bool get isNullObject => jsObject.isNullObject;
}

class ClientResult<T>
    extends JsObjectWrapper<office_extension_js.ClientResultJsImpl<T>> {
  ClientResult._fromJsObject(super.jsObject);

  /// Creates a [ClientResult] from a [jsObject].
  ///
  /// {@macro expando_explanation}
  factory ClientResult.getInstance(
    final office_extension_js.ClientResultJsImpl<T> jsObject,
  ) {
    return (_expando[jsObject] ??= ClientResult._fromJsObject(jsObject))
        as ClientResult<T>;
  }
  static final _expando = Expando<ClientResult<dynamic>>();

  T get value => jsObject.value;
}

typedef FromJson<T> = T Function(Map<String, dynamic>);

class EventHandlers<T>
    extends JsObjectWrapper<office_extension_js.EventHandlersJsImpl> {
  EventHandlers._fromJsObject(
    super.jsObject, {
    required this.fromJson,
  });

  /// Creates a [EventHandlers] from a [jsObject].
  ///
  /// {@macro expando_explanation}
  factory EventHandlers.getInstance(
    final office_extension_js.EventHandlersJsImpl jsObject,
    final FromJson<T> fromJson,
  ) {
    return EventHandlers._fromJsObject(jsObject, fromJson: fromJson);
  }
  final FromJson<T> fromJson;

  /// Adds a function to be called when the event is triggered.
  /// @param handler A promise-based function that takes
  /// in any relevant event arguments.
  EventHandlerResult<T> add(
    final Future<dynamic> Function(T args) handler,
  ) {
    js.PromiseJsImpl<dynamic> promiseCallback(
      final dynamic json,
    ) =>
        js.PromiseJsImpl<dynamic>(
          allowInterop((
            final void Function(dynamic) resolve,
            final Null Function(Object) reject,
          ) {
            handler(fromJson(dartify(json))).then(resolve).catchError(reject);
          }),
        );
    final resultJs = callMethod(
      jsObject,
      'add',
      [allowInterop(promiseCallback)],
    );

    return EventHandlerResult.getInstance(resultJs);
  }

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
  void remove(final Future<dynamic> Function(T args) handler) {
    js.PromiseJsImpl<dynamic> promiseCallback(
      final dynamic json,
    ) =>
        js.PromiseJsImpl<dynamic>(
          allowInterop((
            final void Function(dynamic) resolve,
            final Null Function(Object) reject,
          ) {
            handler(fromJson(dartify(json))).then(resolve).catchError(reject);
          }),
        );

    callMethod(
      jsObject,
      'remove',
      [allowInterop(promiseCallback)],
    );
  }
}

class TrackedObjects
    extends JsObjectWrapper<office_extension_js.TrackedObjectsJsImpl> {
  TrackedObjects._fromJsObject(super.jsObject);

  /// Creates a [ClientResult] from a [jsObject].
  ///
  /// {@macro expando_explanation}
  factory TrackedObjects.getInstance(
    final office_extension_js.TrackedObjectsJsImpl jsObject,
  ) {
    return TrackedObjects._fromJsObject(jsObject);
  }
  void add(final ClientObject object) => jsObject.add(object.jsObject);
  void remove(final ClientObject object) => jsObject.remove(object.jsObject);
}

class EventHandlerResult<T>
    extends JsObjectWrapper<office_extension_js.EventHandlerResultJsImpl> {
  EventHandlerResult._fromJsObject(super.jsObject);

  /// Creates a [ClientResult] from a [jsObject].
  ///
  /// {@macro expando_explanation}
  factory EventHandlerResult.getInstance(
    final office_extension_js.EventHandlerResultJsImpl jsObject,
  ) {
    return EventHandlerResult._fromJsObject(jsObject);
  }

  /// The request context associated with the object
  ClientRequestContext get context =>
      ClientRequestContext.getInstance(jsObject.context);
  void remove() => jsObject.remove();
}
