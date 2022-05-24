@JS('OfficeCore')
library office_core_js;

import 'package:js/js.dart';

import 'office_extension_js_impl.dart' as office_extension;

@JS('RequestContext')
abstract class RequestContextJsImpl
    extends office_extension.ClientRequestContextJsImpl {}
