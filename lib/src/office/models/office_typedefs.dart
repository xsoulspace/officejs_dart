import 'package:freezed_annotation/freezed_annotation.dart';

/// Specifies the host Office application in which the add-in is running.
enum HostType {
  /// The Office host is Microsoft Word.
  @JsonValue('Word')
  word,

  /// The Office host is Microsoft Excel.
  @JsonValue('Excel')
  excel,

  /// The Office host is Microsoft PowerPoint.
  @JsonValue('PowerPoint')
  powerPoint,

  /// The Office host is Microsoft Outlook.
  @JsonValue('Outlook')
  outlook,

  /// The Office host is Microsoft OneNote.
  @JsonValue('OneNote')
  oneNote,

  /// The Office host is Microsoft Project.
  @JsonValue('Project')
  project,

  /// The Office host is Microsoft Access.
  ///
  /// **Important**: We no longer recommend that you create and use
  /// Access web apps and databases in SharePoint.
  /// As an alternative, we recommend that you use
  /// {@link https://powerapps.microsoft.com/ | Microsoft PowerApps}
  /// to build no-code business solutions for web and mobile devices.
  @JsonValue('Access')
  access
}

/// Specifies the OS or other platform on which the Office host application
/// is running.
enum PlatformType {
  /// The platform is PC (Windows).
  @JsonValue('PC')
  pc,

  /// The platform is Office on the web (in a browser).
  @JsonValue('OfficeOnline')
  officeOnline,

  /// The platform is Mac.
  @JsonValue('Mac')
  mac,

  /// The platform an iOS device.
  @JsonValue('iOS')
  iOS,

  /// The platform is an Android device.
  @JsonValue('Android')
  android,

  /// The platform is WinRT.
  @JsonValue('Universal')
  universal
}

/// Specifies an item's type.
///
/// @remarks
///
/// **{@link https://learn.microsoft.com/office/dev/add-ins/outlook/outlook-add-ins-overview#extension-points | Applicable Outlook mode}**: Compose or Read
enum ItemType {
  /// An email, meeting request, meeting response, or meeting cancellation.
  @JsonValue('message')
  message,

  /// An appointment item.
  @JsonValue('appointment')
  appointment
}
