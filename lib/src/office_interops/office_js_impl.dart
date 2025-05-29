import 'dart:js_interop';

///  Represents the runtime environment of the add-in and provides
/// access to key objects of the API.
///  The current context exists as a property of Office.
/// It is accessed using `Office.context`.
///
///  @remarks
///
///  **Applications**: Excel, Outlook, PowerPoint, Project, Word
///
@JS('Office.Context')
@staticInterop
class ContextJsImpl {}

extension ContextJsImplExtension on ContextJsImpl {
  /// Provides access to the Microsoft Outlook add-in object model.
  ///
  /// @remarks
  ///
  /// **{@link https://learn.microsoft.com/office/dev/add-ins/outlook/understanding-outlook-add-in-permissions | Minimum permission level}**: **restricted**
  ///
  /// **{@link https://learn.microsoft.com/office/dev/add-ins/outlook/outlook-add-ins-overview#extension-points | Applicable Outlook mode}**: Compose or Read
  ///
  /// **Key properties**:
  ///
  /// - `diagnostics`: Provides diagnostic information to an Outlook add-in.
  ///
  /// - `item`: Provides methods and properties for accessing a message or
  /// appointment in an Outlook add-in.
  ///
  /// - `userProfile`: Provides information about the user in an Outlook add-in.
  external MailboxJsImpl get mailbox;
}

/// Provides access to the Microsoft Outlook add-in object model.
///
/// Key properties:
///
/// - `diagnostics`: Provides diagnostic information to an Outlook add-in.
///
/// - `item`: Provides methods and properties for accessing a message or
///  appointment in an Outlook add-in.
///
/// - `userProfile`: Provides information about the user in an Outlook add-in.
///
/// @remarks
///
/// **{@link https://learn.microsoft.com/office/dev/add-ins/outlook/understanding-outlook-add-in-permissions | Minimum permission level}**: **restricted**
///
/// **{@link https://learn.microsoft.com/office/dev/add-ins/outlook/outlook-add-ins-overview#extension-points | Applicable Outlook mode}**: Compose or Read
@JS('Office.Mailbox')
@staticInterop
class MailboxJsImpl {}

extension MailboxJsImplExtension on MailboxJsImpl {
  /// Gets the item that is currently selected in a message or appointment.
  ///
  /// The `item` property returns an `ItemRead` for read mode or `ItemCompose` for compose mode.
  /// The `item` property returns `undefined` for any Outlook items that are not supported.
  /// Currently, only message and appointment items are supported.
  ///
  /// @remarks
  ///
  /// **{@link https://learn.microsoft.com/office/dev/add-ins/outlook/understanding-outlook-add-in-permissions | Minimum permission level}**: **restricted**
  ///
  /// **{@link https://learn.microsoft.com/office/dev/add-ins/outlook/outlook-add-ins-overview#extension-points | Applicable Outlook mode}**: Compose or Read
  external ItemJsImpl? get item;
}

/// The item namespace is used to access the currently selected message,
/// meeting request, or appointment.
/// You can determine the type of the item by using the `itemType` property.
///
/// To see the full member list, refer to the
/// {@link https://learn.microsoft.com/javascript/api/requirement-sets/outlook/requirement-set-1.12/office.context.mailbox.item | Object Model} page.
///
/// If you want to see IntelliSense for only a specific type or mode, cast
/// this item to one of the following:
///
/// - {@link Office.AppointmentCompose | AppointmentCompose}
///
/// - {@link Office.AppointmentRead | AppointmentRead}
///
/// - {@link Office.MessageCompose | MessageCompose}
///
/// - {@link Office.MessageRead | MessageRead}
///
/// @remarks
///
/// **{@link https://learn.microsoft.com/office/dev/add-ins/outlook/understanding-outlook-add-in-permissions | Minimum permission level}**: **restricted**
///
/// **{@link https://learn.microsoft.com/office/dev/add-ins/outlook/outlook-add-ins-overview#extension-points | Applicable Outlook mode}**: Appointment Organizer, Appointment Attendee, Message Compose, Message Read
@JS('Office.Item')
@staticInterop
class ItemJsImpl {}

extension ItemJsImplExtension on ItemJsImpl {
  /// Gets the type of item that an instance represents.
  ///
  /// The `itemType` property returns one of the `ItemType` enumeration values,
  /// indicating whether the item object instance is a message or an appointment.
  ///
  /// @remarks
  ///
  /// **{@link https://learn.microsoft.com/office/dev/add-ins/outlook/understanding-outlook-add-in-permissions | Minimum permission level}**: **restricted**
  ///
  /// **{@link https://learn.microsoft.com/office/dev/add-ins/outlook/outlook-add-ins-overview#extension-points | Applicable Outlook mode}**: Compose or Read
  external JSString? get itemType;
}
