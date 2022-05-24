import 'package:js/js.dart';

import '../js_interops/es6_js_impl.dart' as js;
import '../js_interops/office_helpers_js_impl.dart';
import '../utils/interpop_utils.dart';
import 'models/office_models.dart';

class Office {
  Office._();
  static OfficeInfo? _info;

  static Future<OfficeInfo?> getInfo() async {
    if (_info != null) return _info!;
    final officeHelper = await handleThenable(getOfficeHelpers());

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
}
