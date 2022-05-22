import '../js_interpops/office_helpers_js_impl.dart';
import '../utils/interpop_utils.dart';
import 'models/office_info.dart';

class Office {
  Office._();
  static OfficeInfo? _info;
  static Future<OfficeInfo> getInfo() async {
    if (_info != null) return _info!;

    final jsInfoJson = await handleThenable(getOfficeInfoJsImpl());
    _info = OfficeInfo.fromJson(jsInfoJson);
    return _info!;
  }
}
