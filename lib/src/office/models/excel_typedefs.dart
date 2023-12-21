import 'package:freezed_annotation/freezed_annotation.dart';

/// [Api set: ExcelApi 1.7]
enum EventSource {
  /// Local means the event comes from a local user session.
  @JsonValue('Local')
  local,

  /// Remote means the event comes from a remote user session.
  @JsonValue('Remote')
  remote,
}

/// [Api set: ExcelApi 1.7]
enum EventType {
  /// `WorksheetChanged` represents the type of event registered on a `Worksheet` or `WorksheetCollection` and occurs when data changes.
  @JsonValue('WorksheetChanged')
  worksheetChanged,

  /// `WorksheetSelectionChanged` represents the type of event registered on a `Worksheet` and occurs when the selection changes.
  worksheetSelectionChanged,

  /// `WorksheetAdded` represents the type of event registered on a `WorksheetCollection` and occurs when a new worksheet is added to the workbook.
  @JsonValue('WorksheetAdded')
  worksheetAdded,

  /// `WorksheetActivated` represents the type of event registered on a `Worksheet` or `WorksheetCollection` and occurs when a worksheet activates.
  @JsonValue('WorksheetActivated')
  worksheetActivated,

  /// `WorksheetDeactivated` represents the type of event registered on a `Worksheet` or `WorksheetCollection` and occurs when a worksheet deactivates.
  @JsonValue('WorksheetDeactivated')
  worksheetDeactivated,

  /// `TableChanged` represents the type of event registered on a `Table` and occurs when data changes.
  tableChanged,

  /// `TableSelectionChanged` represents the type of event registered on a `Table` and occurs when the selection changes.
  tableSelectionChanged,

  /// `WorksheetDeleted` represents the type of event registered on a `WorksheetCollection` and occurs when a worksheet is deleted from the workbook.
  @JsonValue('WorksheetDeleted')
  worksheetDeleted,

  /// `ChartAdded` represents the type of event registered on a `ChartCollection` and occurs when a new chart is added to the worksheet.
  chartAdded,

  /// `ChartActivated` represents the type of event registered on a `Chart` or `ChartCollection` and occurs when a chart activates.
  chartActivated,

  /// `ChartDeactivated` represents the type of event registered on a `Chart` or `ChartCollection` and occurs when a chart deactivates.
  chartDeactivated,

  /// `ChartDeleted` represents the type of event registered on a `ChartCollection` and occurs when a chart is deleted from the worksheet.
  chartDeleted,

  /// `WorksheetCalculated` represents the type of event registered on a `Worksheet` or `WorksheetCollection` and occurs when a worksheet is calculated.
  worksheetCalculated,

  /// `VisualSelectionChanged` represents the type of event registered on a `VisualCollection` and occurs when the visual selection changes.
  visualSelectionChanged,

  /// `AgaveVisualUpdate` represents the type of an event that is associated with an agave visual and carries a new data view following a data change.
  agaveVisualUpdate,

  /// `TableAdded` represents the type of event registered on a `TableCollection` and occurs when a table is added.
  tableAdded,

  /// `TableDeleted` represents the type of event that is registered on a `TableCollection` and occurs when a table is deleted.
  tableDeleted,

  /// `TableFiltered` represents the type of event registered on a table or `TableCollection` and occurs when the data of a table is filtered.
  tableFiltered,

  /// `WorksheetFiltered` represents the type of event registered on a worksheet or `WorksheetCollection` and occurs when the data of an AutoFilter in the worksheet is filtered.
  worksheetFiltered,

  /// `ShapeActivated` represents the type of event that is registered on a `Shape` and occurs when the shape activates.
  shapeActivated,

  /// `ShapeDeactivated` represents the type of event that is registered on a `Shape` and occurs when the shape deactivates.
  shapeDeactivated,

  /// `VisualChange` represents the type of event registered on a `Visual` and occurs when there is a visual change.
  visualChange,

  /// `WorkbookAutoSaveSettingChanged` represents the type of event registered on a workbook and occurs when there is an auto save setting change.
  workbookAutoSaveSettingChanged,

  /// `WorksheetFormatChanged` represents the type of event registered on a worksheet and occurs when a format is changed.
  worksheetFormatChanged,

  /// `RibbonCommandExecuted` represents the type of event registered on the ribbon and occurs when a user clicks on the ribbon
  ribbonCommandExecuted,

  /// `WorksheetRowSorted` represents the type of event registered on a worksheet and occurs when rows are sorted.
  worksheetRowSorted,

  /// `WorksheetColumnSorted` represents the type of event registered on a worksheet and occurs columns are sorted.
  worksheetColumnSorted,

  /// `WorksheetSingleClicked` represents the type of event registered on a worksheet and occurs when a cell is left-clicked or tapped.
  worksheetSingleClicked,

  /// `WorksheetRowHiddenChanged` represents the type of event registered on a worksheet and occurs when a row's hidden state is changed.
  worksheetRowHiddenChanged,

  /// `CommentAdded` represents the type of event that is registered on a comment collection and occurs when comments are added.
  ///
  commentAdded,

  /// `CommentDeleted` represents the type of event that is registered on a comment collection and occurs when comments are deleted.
  commentDeleted,

  /// `CommentChanged` represents the type of event that is registered on a comment collection and occurs when comments are changed.
  commentChanged,

  /// `RefreshRequestCompleted` represents the type of event registered on a `LinkedDataType` and occurs when a request to refresh a data source is completed.
  linkedDataTypeRefreshRequestCompleted,

  /// `RefreshModeChanged` represents the type of event registered on a `LinkedDataType` and occurs when the linked data type refresh mode is changed.
  linkedDataTypeRefreshModeChanged,

  /// `LinkedDataTypeAdded` represents the type of event registered on a `LinkedDataType` and occurs when a new linked data type is added to the workbook.
  linkedDataTypeLinkedDataTypeAdded,

  /// `WorksheetFormulaChanged` represents the type of event registered on a worksheet and occurs when a formula is changed.
  worksheetFormulaChanged,

  /// `WorkbookActivated` represents the type of event which is fired when a workbook is activated.
  @JsonValue('WorkbookActivated')
  workbookActivated,

  /// `WorkbookLinksChanged` represents the type of event which is fired when a workbook link is changed.
  linkedWorkbookWorkbookLinksChanged,

  /// `WorkbookLinksRefreshCompleted` represents the type of event registered on a linked Workbook and occurs when a linked workbook completes a refresh.
  linkedWorkbookRefreshCompleted,

  /// WorksheetProtectionChanged represents the type of event registered on worksheet, and occurs when protection status is changed.
  worksheetProtectionChanged,

  /// WorksheetNameChanged represents the type of event registered on a worksheet that occurs when its name changes.
  @JsonValue('WorksheetNameChanged')
  worksheetNameChanged,

  /// WorksheetVisibilityChanged represents the type of event registered on a worksheet that occurs when its visibility changes.
  @JsonValue('WorksheetVisibilityChanged')
  worksheetVisibilityChanged,

  /// WorksheetMoved represents the type of event registered on a worksheet that occurs when it is moved within a workbook.
  @JsonValue('WorksheetMoved')
  worksheetMoved,

  /// LineageActivityUpdateAvailable represents the type of event registered when new revision updates lineage model.
  lineageActivityUpdateAvailable,
}

///[Api set: ExcelApi 1.7]
enum DataChangeType {
  /// `Unknown` indicates that the type of data change is not one of the listed types.
  /// [Api set: ExcelApi The name of this value was 'Others' in ExcelApi 1.7]
  @JsonValue('Unknown')
  unknown,

  /// `RangeEdited` indicates that the data change event is triggered by a range being edited.
  /// [Api set: ExcelApi 1.7]
  @JsonValue('Unknown')
  rangeEdited,

  /// `RowInserted` indicates that the data change event is triggered by inserting new rows.
  /// [Api set: ExcelApi 1.7]
  @JsonValue('Unknown')
  rowInserted,

  /// `RowDeleted` indicates that the data change event is triggered by deleting rows.
  /// [Api set: ExcelApi 1.7]
  @JsonValue('Unknown')
  rowDeleted,

  /// `ColumnInserted` indicates that the data change event is triggered by inserting new columns.
  /// [Api set: ExcelApi 1.7]
  @JsonValue('ColumnInserted')
  columnInserted,

  /// `ColumnDeleted` indicates that the data change event is triggered by deleting columns.
  /// [Api set: ExcelApi 1.7]
  @JsonValue('ColumnDeleted')
  columnDeleted,

  /// `CellInserted` indicates that the data change event is triggered by inserting new cells.
  /// [Api set: ExcelApi 1.7]
  @JsonValue('CellInserted')
  cellInserted,

  /// `CellDeleted` indicates that the data change event is triggered by deleting cells.
  /// [Api set: ExcelApi 1.7]
  @JsonValue('CellDeleted')
  cellDeleted,
}
