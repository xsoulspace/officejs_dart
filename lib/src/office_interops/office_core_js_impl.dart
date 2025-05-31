import 'dart:js_interop';

import 'office_extension_js_impl.dart' as office_extension;

/// {@template request_context}
/// Office Core RequestContext implementation
/// {@endtemplate}
@JS('OfficeCore.RequestContext')
@staticInterop
class RequestContextJsImpl
    implements office_extension.ClientRequestContextJsImpl {}
