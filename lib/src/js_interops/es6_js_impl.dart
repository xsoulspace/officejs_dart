@JS()
library excel.es6_interop;

import 'package:js/js.dart';

@JS('Promise')
class PromiseJsImpl<T> {
  external PromiseJsImpl(final Function resolver);

  external PromiseJsImpl then([
    final void Function(dynamic) onResolve,
    final void Function(dynamic) onReject,
  ]);
}

@JS('Object.keys')
external List<String> objectKeys(final Object obj);

@JS('Array.from')
external Object toJSArray(final List source);

@JS('Timestamp')
abstract class TimestampJsImpl {
  external factory TimestampJsImpl(final int seconds, final int nanoseconds);
  external int get seconds;

  external int get nanoseconds;

  //external JsDate toDate();
  external int toMillis();

  external static TimestampJsImpl now();

  //external static TimestampJsImpl fromDate(JsDate date);
  external static TimestampJsImpl fromMillis(final int milliseconds);

  external bool isEqual(final TimestampJsImpl other);

  @override
  external String toString();
}
