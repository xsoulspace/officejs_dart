**Revised Step-by-Step Plan**

Before start: read the https://dart.dev/interop/js-interop to understand the js interop in dart.

**Phase 1: Dart SDK Upgrade to 3.9.0**

(This phase remains unchanged from the previous plan. It focuses on updating `pubspec.yaml`, running `dart pub get`, `dart fix --apply`, `dart analyze`, and `dart test`.)

1.  **Update `pubspec.yaml` SDK Constraint**
2.  **Update Project Dependencies**
3.  **Apply Automated Code Fixes**
4.  **Static Analysis and Manual Resolution**
5.  **Execute Tests**

**Phase 2: Office JS API SDK Migration to `dart:js_interop`**

This phase focuses on modernizing the JavaScript interop layer. The agent will now autonomously query and read relevant portions of `index.d.ts`.

**Preamble for Agent:** This phase involves migrating Dart code that interfaces with the Office JS API to use the modern `dart:js_interop` package. You will need to identify Office JS API elements in the Dart code, then locate their definitions within the `index.d.ts` file using search and partial reads, and finally refactor the Dart code.

1.  **Identify Existing JS Interop Files:**

    - **Instruction for Agent:** Search the codebase for Dart files currently using older JS interop packages (`package:js`, `dart:js_util`) or files located in directories likely to contain JS interop code (e.g., `lib/src/js_interops/`, `lib/src/office_interops/`, `lib/src/office/models/`).
    - **Tool:** `codebase_search`
      - `query`: "import 'package:js/js.dart'; OR import 'dart:js_util'; OR @JS("
      - `explanation`: "To find files using old JS interop mechanisms."
    - **Tool:** `list_dir` (as needed, based on search results or project structure)
      - `relative_workspace_path`: e.g., `lib/src/js_interops/`
      - `explanation`: "To explore potential interop directories."

2.  **Iterative Migration of Office JS API Interop Code:**

    - **Instruction for Agent:** For each Dart file or logical module identified:

      - **A. Read Current Dart File:**
        - **Tool:** `read_file` (target: the Dart file being migrated)
        - `explanation`: "To get the current Dart interop code."
      - **B. Identify Target Office JS API Element:**
        - **Instruction for Agent:** Analyze the Dart code (e.g., class names, `@JS(...)` annotations, method names) to determine the specific Office JS API element it represents (e.g., `Excel.Worksheet`, `Excel.Worksheet.name`, `Office.Context.document.getAsync`). Note the namespace if present (e.g., `Excel`, `Office`).
      - **C. Locate and Read TypeScript Definition from `index.d.ts`:**
        - **Instruction for Agent:** Based on the identified Office JS API element (e.g., `Excel.Worksheet`):
          1.  **Search `index.d.ts` for Namespace/Module (if applicable):** If the element is namespaced (e.g., `Excel.Worksheet`), first try to locate the start of the namespace block.
              - **Tool:** `grep_search`
                - `query`: e.g., `namespace Excel {`, `declare module Office {`
                - `include_pattern`: `**/index.d.ts` (or the specific path if known by the user)
                - `explanation`: "To locate the namespace block for `[Namespace]` in `index.d.ts`."
          2.  **Search `index.d.ts` for Element Definition:** Use `grep_search` to find lines in `index.d.ts` that define the specific element (class, interface, enum). Be precise.
              - **Tool:** `grep_search`
                - `query`: e.g., `class Worksheet `, `interface Range {`, `enum BindingType {` (note the space or opening brace to target definitions)
                - `include_pattern`: `**/index.d.ts`
                - `explanation`: "To locate the definition of the Office JS API element `[Element Name]` in `index.d.ts`."
          3.  **Determine Line Range:** From the `grep_search` results (prioritizing matches within a relevant namespace if found), identify the starting line number of the definition. Estimate an appropriate range of lines to read (e.g., start line to start line + 50 or 100, adjusted based on typical definition complexity). This might be iterative: read a chunk, if it looks incomplete (e.g., unmatched braces), expand the read.
          4.  **Read Definition Snippet:** Use `read_file` to read the determined line range from `index.d.ts`.
              - **Tool:** `read_file`
                - `target_file`: `path/to/index.d.ts` (user must confirm this path if not standard)
                - `start_line_one_indexed`: (determined from grep results)
                - `end_line_one_indexed_inclusive`: (determined from grep results + offset)
                - `explanation`: "To read the TypeScript definition of `[Element Name]` from `index.d.ts`."
              - **Instruction for Agent:** If the definition seems incomplete (e.g., unmatched braces, truncated method signatures), intelligently request a slightly larger or adjusted block of lines from `index.d.ts`. The goal is to get the complete definition of the _target element_ without reading excessive unrelated parts of the file.
      - **D. Analyze Retrieved TypeScript Definition & Existing Dart Code:**
        - **Instruction for Agent:** Parse and analyze the retrieved TypeScript snippet from `index.d.ts`. Compare it against the existing Dart code. Pay close attention to:
          - Property names, types (and their nullability/optionality), and read/write access.
          - Method names, parameter order, parameter types (including optionality and any union types), and return types (especially `Promise<T>`).
          - Enum definitions (names and values).
          - Class/interface inheritance or implementation.
      - **E. Generate Updated Dart Interop Code using `dart:js_interop`:**

        - **Instruction for Agent:** Draft the updated Dart code based on the comparison, adhering to `dart:js_interop` best practices:

          - **Classes/Interfaces:**
            - Use `@JS()` for global objects/namespaces or constructors.
            - Use `@JS() @staticInterop class ActualJsType {}` to represent the JS type.
            - Use `extension type DartTypeName(ActualJsType underlyingJsObject) { ... members ... }` for instance members.
          - **Types:**

            - JS Primitives: `JSString`, `JSNumber`, `JSBoolean`.
            - Nullable/Optional: `JSString?`, `JSNumber?`, etc.
            - Objects: The corresponding `@staticInterop` Dart type (e.g., `ExcelRange`).
            - Arrays: `JSArray<T>` (e.g., `JSArray<JSString>`, `JSArray<ExcelWorksheet>`).
            - Functions/Callbacks: `JSFunction`.
            - Promises: `JSPromise<T>`. Use `promiseToFuture<DartType>(jsPromise)` from `dart:js_util` (or its `dart:js_interop` equivalent if fully migrated) for conversion.
            - Union Types (e.g., `string | string[]`): May require multiple Dart methods, or `JSAny` if handled dynamically (less safe).

              ```typescript
              // TS: load(propertyNames: string | string[]): void;
              ```

              ```dart
              // Dart (Option 1: separate methods)
              external void loadProperty(JSString propertyName);
              external void loadProperties(JSArray<JSString> propertyNames);

              // Dart (Option 2: JSAny - use with caution)
              // external void load(JSAny propertyNames);
              ```

          - **Properties:**
            - `external JSString get propertyName;`
            - `external set propertyName(JSString value);`
          - **Methods:**
            - `external JSReturnType methodName(JSParamType1 param1, [JSParamType2? param2]);`
          - **Enums:**
            - String-based TS enums: Often map to Dart `String` constants or `JSString` constants using `.toJS`.
              ```typescript
              // TS: enum Color { Red = "RED", Blue = "BLUE" }
              ```
              ```dart
              // Dart:
              class Color { // Or an extension type on JSObject if it's a JS enum object
                static final JSString Red = 'RED'.toJS;
                static final JSString Blue = 'BLUE'.toJS;
              }
              ```
            - Number-based TS enums: Map to `JSNumber` constants.
          - **Static Members:** Place static members directly in the `@JS()` annotated class (the one without `@staticInterop`).

          **Conceptual Example (Agent Reference based on previous example and typical Office.js patterns):**

          - **If TypeScript definition for `Excel.Range` is retrieved:**
            ```typescript
            // Snippet from index.d.ts (retrieved by agent)
            declare namespace Excel {
              class Range {
                address: string;
                getCell(row: number, column: number): Excel.Range;
                load(propertyNames: string | string[]): Excel.Range;
                // ... other members
              }
            }
            ```
          - **New Dart (using `dart:js_interop`):**

            ```dart
            import 'dart:js_interop';
            import 'dart:js_interop_unsafe'; // For promiseToFuture if still needed

            // If 'Excel' itself is a global object with 'Range' as a property/constructor
            @JS('Excel')
            external $ExcelNamespace get Excel; // Assuming 'Excel' is a global

            @JS()
            @staticInterop
            class $ExcelNamespace {}

            extension type ExcelNamespaceExtension($ExcelNamespace $e) {
              // If Range is a constructor like: new Excel.Range(...)
              // external ExcelRange Range(JSAny arg1, ...);

              // If Range is a property or method returning a Range object
              // external ExcelRange get Range; // Or some method
            }

            // More likely, Excel.Range is directly addressable or part of a context.
            // Assuming Excel.Range is the type:
            @JS('Excel.Range') // Or just @JS() if not globally addressable by this string
            @staticInterop
            class ExcelRange {}

            extension type ExcelRangeExtension(ExcelRange r) {
              external JSString get address;
              external ExcelRange getCell(JSNumber row, JSNumber column);

              // Handle 'load' overload
              @JS('load') // Dart and JS method names match
              external ExcelRange loadSingle(JSString propertyName);
              @JS('load')
              external ExcelRange loadMultiple(JSArray<JSString> propertyNames);

              // If it's a `RequestContext.sync().then(() => ...)` pattern,
              // methods often return `void` or the object itself for chaining,
              // and Promises are handled via the context.
              // The Office.js `*.load()` methods often return the object itself for chaining.
            }
            ```

      - **F. Apply Code Changes:**
        - **Tool:** `edit_file` (target: the Dart file being migrated)
        - `code_edit`: (Agent generates based on Step E)
        - `instructions`: "I am refactoring the interop code for `[Office JS API Element]` to use `dart:js_interop` based on its TypeScript definition from `index.d.ts`."
      - **G. Analyze and Iterate:**
        - **Tool:** `run_terminal_cmd` (`command`: `dart analyze [path_to_modified_file]`)
        - `explanation`: "To check the updated interop code for analysis issues."
        - **Instruction for Agent:** If issues arise, revisit Step D/E to refine the generated Dart code, then re-apply and re-analyze. It might be necessary to re-query `index.d.ts` for more context (e.g., related types).

3.  **Refactor Common Interop Utilities:**

    - (This step remains largely the same: identify shared utilities, refactor them to `dart:js_interop`, use `promiseToFuture` or new patterns for async operations. The `Office.context.sync()` pattern is particularly important for application-specific APIs and involves `JSPromise`.)

4.  **Final Project-Wide Analysis and Testing:**
    - (This step remains the same: `dart analyze` for the whole project, `dart test`, debug and fix.)

Learn from mistakes and improve the plan.

**Cited Sources:**

- [Dart JavaScript Interoperability](https://dart.dev/interop/js-interop)
- [Understanding the Office JavaScript API](https://learn.microsoft.com/en-us/office/dev/add-ins/develop/understanding-the-javascript-api-for-office)
