import 'dart:js_interop';

/// {@template promise_js_impl}
/// JavaScript Promise implementation for Dart interop
/// {@endtemplate}
@JS('Promise')
@staticInterop
class PromiseJsImpl<T> {
  /// {@macro promise_js_impl}
  external factory PromiseJsImpl(final JSFunction resolver);
}

extension PromiseJsImplExtension<T> on PromiseJsImpl<T> {
  external PromiseJsImpl<U> then<U>([
    final JSFunction? onResolve,
    final JSFunction? onReject,
  ]);
}

/// Gets the keys of a JavaScript object
@JS('Object.keys')
external JSArray<JSString> objectKeys(final JSObject obj);

/// Converts a Dart List to a JavaScript Array
@JS('Array.from')
external JSArray<JSAny?> toJSArray(final JSArray<JSAny?> source);

/// {@template timestamp_js_impl}
/// JavaScript Timestamp implementation for Dart interop
/// {@endtemplate}
@JS('Timestamp')
@staticInterop
class TimestampJsImpl {
  /// {@macro timestamp_js_impl}
  external factory TimestampJsImpl(
    final JSNumber seconds,
    final JSNumber nanoseconds,
  );
}

extension TimestampJsImplExtension on TimestampJsImpl {
  external JSNumber get seconds;
  external JSNumber get nanoseconds;
  external JSNumber toMillis();
  external bool isEqual(final TimestampJsImpl other);
}

@JS('Timestamp.now')
external TimestampJsImpl timestampNow();

@JS('Timestamp.fromMillis')
external TimestampJsImpl timestampFromMillis(final JSNumber milliseconds);
