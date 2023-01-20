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

<p align="center">
  <a title="License" href="https://github.com/xsoulspace/officejs_dart/blob/master/LICENSE" ><img src="https://img.shields.io/github/license/xsoulspace/officejs_dart.svg" /></a>
  <a title="Discord" href="https://discord.com/invite/y54DpJwmAn" ><img src="https://img.shields.io/discord/696688204476055592.svg" /></a>
  <a title="Contributor Covenant" href="https://github.com/xsoulspace/officejs_dart/blob/master/CODE_OF_CONDUCT.md" ><img src="https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg" /></a>
  <a title="Contributors" href="https://github.com/xsoulspace/officejs_dart/graphs/contributors" ><img src="https://img.shields.io/github/contributors/xsoulspace/officejs_dart.svg" /></a>
</p>

Unofficial Office.js (https://github.com/OfficeDev/office-js) wrapper for Flutter/Dart

Please note: the package is a Work In Progress and in highly risk of change.
Do not use it in production.

## Features

<!-- TODO: List what your package can do. Maybe include images, gifs, or videos. -->

## Getting started with Excel

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
          officeOnReady = Office.onReady;
          // may cause an error Excel is not defined
          runExcel = Excel.run;
        }
        window["getOfficeHelpers"] = () => new OfficeHelpers();
        console.log("helpers injected");
      });
      document.getElementsByTagName("head")[0].appendChild(scriptTag);
    });
});
```

## Getting started with Outlook

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
          officeOnReady = Office.onReady;
          context = Office.context;
        }
        window["getOfficeHelpers"] = () => new OfficeHelpers();
        console.log("helpers injected");
      });
      document.getElementsByTagName("head")[0].appendChild(scriptTag);
    });
});
```

## Donations / Sponsor

Please sponsor or donate to the creator on [Boosty](https://boosty.to/arenukvern) or [CloudTips](https://pay.cloudtips.ru/p/1629cd27).

Thank you for your support and have a great day! 🌄

## Getting Help

If you need help getting started or have questions, check out our [Discord Community](https://discord.gg/y54DpJwmAn).

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
