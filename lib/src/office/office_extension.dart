library office_extension;

import '../abstract/js_object_wrapper.dart';
import '../office_interpops/office_extension_js_impl.dart'
    as office_extension_js;
import '../utils/interpop_utils.dart';

class ClientRequestContext
    extends JsObjectWrapper<office_extension_js.ClientRequestContextJsImpl> {
  ClientRequestContext.fromJsObject(super.jsObject);

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
  ClientObject.fromJsObject(super.jsObject);

  ClientRequestContext get context =>
      ClientRequestContext.fromJsObject(super.jsObject.context);

  bool get isNullObject => super.jsObject.isNullObject;
}

class ClientResult<T>
    extends JsObjectWrapper<office_extension_js.ClientResultJsImpl<T>> {
  ClientResult.fromJsObject(super.jsObject);

  T get value => super.jsObject.value;
}
