import 'package:js/js.dart';

import '../js_interpops/es6_js_impl.dart' as js;
import '../js_interpops/office_helpers_js_impl.dart';
import '../utils/interpop_utils.dart';
import 'models/office_models.dart';

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
    final jsInfoJson = dartify(jsInfoJsonJS);
    return _info = OfficeInfo.fromJson(jsInfoJson);
  }
}
