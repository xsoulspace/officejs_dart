## 0.5.0

- Migrated all Office.js interop from deprecated `dart:js` to modern `dart:js_interop` for type safety and future compatibility
- Refactored all JS interop types and constraints to use `JSAny?`, `JSArray`, and related types
- Updated all event handler and callback signatures to use statically typed functions for `toJS` compatibility
- Removed all usage of `allowInterop` and legacy JS interop helpers
- Fixed all async/await and Future handling in interop, ensuring proper promise resolution
- Cleaned up and removed problematic generic function conversions in interop utilities
- All code now passes static analysis and compiles cleanly as a Dart library

## 0.4.0

- added getCell, getRangeByIndexes to Worksheet
- added Range class
- fixed superclasses for Worksheet, Range, Workbook - now they all depends from the ClientObject as it is in Excel API
- added trackedObjects to RequestContext

## 0.3.1

- added name property for Excel Workbook

## 0.3.0

- added basic outlook context with mailbox.

## 0.2.0

- chore: set dart low boundry to 2.18.0

## 0.1.0

- Inital release.
