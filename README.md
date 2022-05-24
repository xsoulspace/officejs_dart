<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Unofficial Office.js (https://github.com/OfficeDev/office-js) wrapper for Flutter/Dart

Please note: the package is a Work In Progress and in highly risk of change.
Do not use it in production.

## Features

<!-- TODO: List what your package can do. Maybe include images, gifs, or videos. -->

## Getting started

To start, add in the index.html "Initialize office" `then` section.
That's all you need to do)

```javascript
window.addEventListener("load", function (ev) {
  // Download main.dart.js
  _flutter.loader
    .loadEntrypoint({
      serviceWorker: {
        serviceWorkerVersion: serviceWorkerVersion,
      },
    })
    .then(function (engineInitializer) {
      return engineInitializer.initializeEngine();
    })
    .then(function (appRunner) {
      return appRunner.runApp();
    })
    /** Initialize office **/
    .then(function () {
      console.log("intializing office");
      const officeEl = document.getElementById("office");
      if (officeEl != null) return;

      const scriptTag = document.createElement("script");
      scriptTag.src =
        "https://appsforoffice.microsoft.com/lib/1/hosted/office.js";
      scriptTag.id = "office";
      scriptTag.addEventListener("load", () => {
        console.log("office loaded");
        class OfficeHelpers {
          runExcel = Excel.run;
          officeOnReady = Office.onReady;
        }
        window["getOfficeHelpers"] = () => new OfficeHelpers();
        console.log("helpers injected");
      });
      document.getElementsByTagName("head")[0].appendChild(scriptTag);
    });
});
```

## Usage

<!--
TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
``` -->

## Additional information

<!-- TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more. -->
