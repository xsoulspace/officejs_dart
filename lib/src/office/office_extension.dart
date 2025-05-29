import 'dart:js_interop';

import '../abstract/js_object_wrapper.dart';
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
  ) => _expando[jsObject] ??= ClientRequestContext._fromJsObject(jsObject);
  static final _expando = Expando<ClientRequestContext>();

  void load(
    final ClientObject object,
    final List<String> option,
  ) {
    super.jsObject.load(
      object.jsObject, 
      option.map((final e) => e.toJS).toList().toJS,
    );
  }

  Future<T> sync<T>([final T? passThroughValue]) async {
    if (passThroughValue is JSAny?) {
      final jsResult = jsObject.sync<JSAny?>(passThroughValue);
      final result = await handleThenable(jsResult);
      return result as T;
    } else {
      final jsResult = jsObject.sync<JSAny?>();
      final result = await handleThenable(jsResult);
      return passThroughValue ?? result as T;
    }
  }
}

class ClientObject<
        TJsClientObject extends office_extension_js.ClientObjectJsImpl>
    extends JsObjectWrapper<TJsClientObject> {
  ClientObject(super.jsObject);
  ClientObject.fromJsObject(super.jsObject);

  // ClientRequestContext get context =>
  //     ClientRequestContext.getInstance(jsObject.context);

  bool get isNullObject => jsObject.isNullObject.toDart;
}

class ClientResult<T extends JSAny?>
    extends JsObjectWrapper<office_extension_js.ClientResultJsImpl<T>> {
  ClientResult._fromJsObject(super.jsObject);

  /// Creates a [ClientResult] from a [jsObject].
  ///
  /// {@macro expando_explanation}
  factory ClientResult.getInstance(
    final office_extension_js.ClientResultJsImpl<T> jsObject,
  ) => (_expando[jsObject] ??= ClientResult._fromJsObject(jsObject))
        as ClientResult<T>;
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
  ) => EventHandlers._fromJsObject(jsObject, fromJson: fromJson);
  final FromJson<T> fromJson;

  /// Adds a function to be called when the event is triggered.
  /// @param handler A promise-based function that takes
  /// in any relevant event arguments.
  EventHandlerResult<T> add(
    final void Function(T args) handler,
  ) {
    void promiseCallback(final JSAny? json) {
      final dartJson = dartify(json)! as Map<String, dynamic>;
      handler(fromJson(dartJson));
    }

    final resultJs = jsObject.add(promiseCallback.toJS);
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
  void remove(final void Function(T args) handler) {
    void promiseCallback(final JSAny? json) {
      final dartJson = dartify(json)! as Map<String, dynamic>;
      handler(fromJson(dartJson));
    }

    jsObject.remove(promiseCallback.toJS);
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
  ) => TrackedObjects._fromJsObject(jsObject);
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
  ) => EventHandlerResult._fromJsObject(jsObject);

  /// The request context associated with the object
  ClientRequestContext get context =>
      ClientRequestContext.getInstance(jsObject.context);
  void remove() => jsObject.remove();
}
