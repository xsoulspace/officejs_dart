/// original source: https://github.com/FirebaseExtended/firebase-dart
import 'dart:async';
import 'dart:js';

import 'package:js/js_util.dart' as util;

import '../js_interpops/es6_js_impl.dart' as js;

dynamic jsifyList(final Iterable list) =>
    js.toJSArray(list.map(jsify).toList());

/// Returns the JS implementation from Dart Object.
dynamic jsify(final Object? dartObject) {
  if (_isBasicType(dartObject)) {
    return dartObject;
  }

  if (dartObject is DateTime) {
    return js.TimestampJsImpl.fromMillis(dartObject.millisecondsSinceEpoch);
  }

  if (dartObject is Iterable) {
    return jsifyList(dartObject);
  }

  if (dartObject is Map) {
    final jsMap = util.newObject();
    dartObject.forEach((final key, final value) {
      util.setProperty(jsMap, key, jsify(value));
    });
    return jsMap;
  }

  if (dartObject is Function) {
    return allowInterop(dartObject);
  }

  throw ArgumentError.value(dartObject, 'dartObject', 'Could not convert');
}

/// Calls [method] on JavaScript object [jsObject].
dynamic callMethod(
  final Object jsObject,
  final String method,
  final List<dynamic> args,
) =>
    util.callMethod(jsObject, method, args);

/// Calls [method] on JavaScript object [jsObject].
T allowSafePromiseInterop<T>(
  final Object jsObject,
  final String method,
  final Function callback,
) {
  // ignore: avoid_dynamic_calls
  return (jsObject as JsObject)[method]
      .apply(jsObject, [allowInterop(callback)]);
}

/// Returns `true` if the [value] is a very basic built-in type - e.g.
/// `null`, [num], [bool] or [String]. It returns `false` in the other case.
bool _isBasicType(final Object? value) {
  if (value == null || value is num || value is bool || value is String) {
    return true;
  }
  return false;
}

/// Handles the [PromiseJsImpl] object.
Future<T> handleThenable<T>(final js.PromiseJsImpl<T> thenable) async {
  T value;
  try {
    value = await util.promiseToFuture(thenable);
  } catch (e) {
    if (util.hasProperty(e, 'code')) {
      // throw _FirebaseErrorWrapper(e as FirebaseError);
    }
    rethrow;
  }
  return value;
}

/// Handles the [Future] object with the provided [mapper] function.
js.PromiseJsImpl<S> handleFutureWithMapper<T, S>(
  final Future<T> future,
  final S Function(T value) mapper,
) =>
    js.PromiseJsImpl<S>(
      allowInterop((
        final void Function(S) resolve,
        final Null Function(Object) reject,
      ) {
        future.then((final value) {
          final mappedValue = mapper(value);
          resolve(mappedValue);
        }).catchError(reject);
      }),
    );

/// Resolves error.
void Function(Object) resolveError(final Completer c) =>
    allowInterop(c.completeError);

/// Returns Dart representation from JS Object.
dynamic dartify(final Object? jsObject) {
  if (_isBasicType(jsObject)) {
    return jsObject;
  }

  // Handle list
  if (jsObject is Iterable) {
    return jsObject.map(dartify).toList();
  }

  // Assume a map then...
  return dartifyMap(jsObject!);
}

Map<String, dynamic> dartifyMap(final Object jsObject) {
  final keys = js.objectKeys(jsObject);
  final map = <String, dynamic>{};
  for (final key in keys) {
    map[key] = dartify(util.getProperty(jsObject, key));
  }
  return map;
}
