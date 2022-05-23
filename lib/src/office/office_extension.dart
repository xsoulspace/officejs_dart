library office_extension;

import '../abstract/js_object_wrapper.dart';
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
