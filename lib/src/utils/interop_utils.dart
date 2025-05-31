/// {@template interop_utils}
/// Utilities for JavaScript interoperability using dart:js_interop
/// {@endtemplate}
library;

import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import '../js_interops/es6_js_impl.dart' as js;

/// Converts a Dart List to a JavaScript Array
JSArray<JSAny?> jsifyList(final Iterable<Object?> list) =>
    list.map(jsify).toList().toJS;

/// {@template jsify}
/// Returns the JS implementation from Dart Object.
/// {@endtemplate}
JSAny? jsify(final Object? dartObject) {
  if (_isBasicType(dartObject)) {
    if (dartObject == null) return null;
    if (dartObject is String) return dartObject.toJS;
    if (dartObject is num) return dartObject.toJS;
    if (dartObject is bool) return dartObject.toJS;
    return dartObject as JSAny?;
  }

  if (dartObject is DateTime) {
    return js.TimestampJsImpl(dartObject.millisecondsSinceEpoch.toJS, 0.toJS)
        as JSAny?;
  }

  if (dartObject is Iterable) {
    return jsifyList(dartObject);
  }

  if (dartObject is Map) {
    final jsMap = JSObject();
    dartObject.forEach((final key, final value) {
      jsMap.setProperty(key.toString().toJS, jsify(value));
    });
    return jsMap;
  }

  if (dartObject is Function) {
    throw ArgumentError.value(
      dartObject,
      'dartObject',
      'Function conversion not supported - use specific function types with .toJS',
    );
  }

  throw ArgumentError.value(dartObject, 'dartObject', 'Could not convert');
}

/// Calls [method] on JavaScript object [jsObject].
JSAny? callMethod(
  final JSObject jsObject,
  final String method,
  final List<JSAny?> args,
) => jsObject.callMethod(method.toJS, args.toJS);

/// Returns `true` if the [value] is a very basic built-in type - e.g.
/// `null`, [num], [bool] or [String]. It returns `false` in the other case.
bool _isBasicType(final Object? value) =>
    value == null || value is num || value is bool || value is String;

/// {@template handle_thenable}
/// Handles the [JSPromise] object.
/// {@endtemplate}
Future<T> handleThenable<T extends JSAny?>(final JSPromise<T> thenable) async {
  try {
    final value = await thenable.toDart;
    return value;
  } catch (e) {
    final jsError = e as JSObject?;
    if (jsError != null && jsError.has('code')) {
      // TODO(arenukvern): add proper error handling, https://github.com/xsoulspace/officejs_dart/issues/1
      // throw _FirebaseErrorWrapper(e as FirebaseError);
    }
    rethrow;
  }
}

/// {@template dartify}
/// Returns Dart representation from JS Object.
/// {@endtemplate}
Object? dartify(final JSAny? jsObject) {
  if (jsObject == null) return null;

  if (jsObject.isA<JSString>()) {
    return (jsObject as JSString).toDart;
  }

  if (jsObject.isA<JSNumber>()) {
    return (jsObject as JSNumber).toDartDouble;
  }

  if (jsObject.isA<JSBoolean>()) {
    return (jsObject as JSBoolean).toDart;
  }

  if (jsObject.isA<JSArray>()) {
    final jsArray = jsObject as JSArray<JSAny?>;
    return List.generate(
      jsArray.length,
      (final index) => dartify(jsArray[index]),
    );
  }

  // Assume a map then...
  return dartifyMap(jsObject as JSObject);
}

/// Converts a JavaScript object to a Dart Map
Map<String, dynamic> dartifyMap(final JSObject jsObject) {
  final keys = js.objectKeys(jsObject);
  final map = <String, dynamic>{};
  for (int i = 0; i < keys.length; i++) {
    final key = keys[i].toDart;
    map[key] = dartify(jsObject.getProperty(key.toJS));
  }
  return map;
}
