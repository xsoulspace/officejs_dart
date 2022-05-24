library office_extension;

import 'package:js/js.dart';

import '../abstract/js_object_wrapper.dart';
import '../js_interpops/es6_js_impl.dart' as js;
import '../office_interpops/office_extension_js_impl.dart'
    as office_extension_js;
import '../utils/interpop_utils.dart';

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
    return handleThenable(super.jsObject.sync(passThroughValue));
  }
}

class ClientObject
    extends JsObjectWrapper<office_extension_js.ClientObjectJsImpl> {
  ClientObject._fromJsObject(super.jsObject);

  /// Creates a [ClientObject] from a [jsObject].
  ///
  /// {@macro expando_explanation}
  factory ClientObject.getInstance(
    final office_extension_js.ClientObjectJsImpl jsObject,
  ) {
    return _expando[jsObject] ??= ClientObject._fromJsObject(jsObject);
  }
  static final _expando = Expando<ClientObject>();

  ClientRequestContext get context =>
      ClientRequestContext.getInstance(super.jsObject.context);

  bool get isNullObject => super.jsObject.isNullObject;
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

  T get value => super.jsObject.value;
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
    return (_expando[jsObject] ??=
            EventHandlers._fromJsObject(jsObject, fromJson: fromJson))
        as EventHandlers<T>;
  }
  static final _expando = Expando<EventHandlers<dynamic>>();
  final FromJson<T> fromJson;

  /// Adds a function to be called when the event is triggered.
  /// @param handler A promise-based function that takes
  /// in any relevant event arguments.
  EventHandlerResult<T> add(
    final Future<dynamic> Function(dynamic args) handler,
  ) {
    js.PromiseJsImpl<dynamic> promiseCallback(
      final dynamic json,
    ) =>
        js.PromiseJsImpl<dynamic>(
          allowInterop((
            final void Function(dynamic) resolve,
            final Null Function(Object) reject,
          ) {
            handler(json).then(resolve).catchError(reject);
          }),
        );
    final resultJs =
        allowSafePromiseInterop<office_extension_js.EventHandlerResultJsImpl>(
      jsObject,
      'run',
      promiseCallback,
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
      final Map<String, dynamic> json,
    ) =>
        js.PromiseJsImpl<dynamic>(
          allowInterop((
            final void Function(dynamic) resolve,
            final Null Function(Object) reject,
          ) {
            handler(fromJson(json)).then(resolve).catchError(reject);
          }),
        );

    super.jsObject.remove(allowInterop(promiseCallback));
  }
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
    return (_expando[jsObject] ??= EventHandlerResult._fromJsObject(jsObject))
        as EventHandlerResult<T>;
  }
  static final _expando = Expando<EventHandlerResult<dynamic>>();

  /// The request context associated with the object
  ClientRequestContext get context =>
      ClientRequestContext.getInstance(super.jsObject.context);
  void remove() => super.jsObject.remove();
}
