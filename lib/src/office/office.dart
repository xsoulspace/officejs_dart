import 'package:js/js.dart';

import '../../office_typedefs.dart';
import '../abstract/js_object_wrapper.dart';
import '../js_interops/es6_js_impl.dart' as js;
import '../js_interops/office_helpers_js_impl.dart';
import '../office_interops/office_js_impl.dart' as office_js;
import '../utils/interop_utils.dart';

class Office {
  Office._();
  static OfficeInfo? _info;

  static Future<OfficeInfo?> getInfo() async {
    if (_info != null) return _info!;
    final officeHelper = getOfficeHelpers();

    js.PromiseJsImpl<dynamic> promiseCallback(
      final dynamic info,
    ) =>
        js.PromiseJsImpl<dynamic>(
          allowInterop((
            final void Function(dynamic) resolve,
            final Null Function(Object) reject,
          ) {
            resolve(info);
          }),
        );

    final jsInfoJsonJS = await handleThenable(
      callMethod(
        officeHelper,
        'officeOnReady',
        [allowInterop(promiseCallback)],
      ),
    );
    if (jsInfoJsonJS == null) return null;
    final jsInfoJson = Map.castFrom<dynamic, dynamic, String, dynamic>(
      dartify(jsInfoJsonJS),
    );
    if (jsInfoJson.values.where((final value) => value != null).isEmpty) {
      return null;
    }

    return _info = OfficeInfo.fromJson(jsInfoJson);
  }

  static Context get context {
    final officeHelper = getOfficeHelpers();
    final office_js.ContextJsImpl contextJS = officeHelper.context;
    return Context.getInstance(contextJS);
  }
}

class Context extends JsObjectWrapper<office_js.ContextJsImpl> {
  Context._fromJsObject(super.jsObject);

  /// Creates a [Context] from a [jsObject].
  ///
  /// {@template expando_explanation}
  /// If an instance is already associated with [jsObject],
  /// it is returned instead of creating a new instance.
  /// {@endtemplate}
  factory Context.getInstance(
    final office_js.ContextJsImpl jsObject,
  ) {
    return _expando[jsObject] ??= Context._fromJsObject(jsObject);
  }

  static final _expando = Expando<Context>();

  Mailbox get mailbox => Mailbox.getInstance(jsObject.mailbox);
}

class Mailbox extends JsObjectWrapper<office_js.MailboxJsImpl> {
  Mailbox._fromJsObject(super.jsObject);

  /// Creates a [Mailbox] from a [jsObject].
  ///
  /// {@template expando_explanation}
  /// If an instance is already associated with [jsObject],
  /// it is returned instead of creating a new instance.
  /// {@endtemplate}
  factory Mailbox.getInstance(
    final office_js.MailboxJsImpl jsObject,
  ) {
    return _expando[jsObject] ??= Mailbox._fromJsObject(jsObject);
  }

  static final _expando = Expando<Mailbox>();

  Item? get item {
    final resolvedItem = jsObject.item;
    if (resolvedItem == null) return null;
    return Item.getInstance(resolvedItem);
  }
}

class Item extends JsObjectWrapper<office_js.ItemJsImpl> {
  Item._fromJsObject(super.jsObject);

  /// Creates a [Item] from a [jsObject].
  ///
  /// {@template expando_explanation}
  /// If an instance is already associated with [jsObject],
  /// it is returned instead of creating a new instance.
  /// {@endtemplate}
  factory Item.getInstance(
    final office_js.ItemJsImpl jsObject,
  ) {
    return _expando[jsObject] ??= Item._fromJsObject(jsObject);
  }

  static final _expando = Expando<Item>();

  ItemType? get itemType {
    final type = jsObject.itemType;
    if (type == null) return null;
    return ItemType.values.byName(type);
  }
}
