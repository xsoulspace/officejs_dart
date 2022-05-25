// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excel_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorksheetDeletedEventArgs _$$_WorksheetDeletedEventArgsFromJson(
        Map<String, dynamic> json) =>
    _$_WorksheetDeletedEventArgs(
      source: $enumDecode(_$EventSourceEnumMap, json['source']),
      worksheetId: json['worksheetId'] as String,
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_WorksheetDeletedEventArgsToJson(
        _$_WorksheetDeletedEventArgs instance) =>
    <String, dynamic>{
      'source': _$EventSourceEnumMap[instance.source],
      'worksheetId': instance.worksheetId,
      'type': _$EventTypeEnumMap[instance.type],
    };

const _$EventSourceEnumMap = {
  EventSource.local: 'Local',
  EventSource.remote: 'Remote',
};

const _$EventTypeEnumMap = {
  EventType.worksheetChanged: 'WorksheetChanged',
  EventType.worksheetSelectionChanged: 'worksheetSelectionChanged',
  EventType.worksheetAdded: 'WorksheetAdded',
  EventType.worksheetActivated: 'WorksheetActivated',
  EventType.worksheetDeactivated: 'WorksheetDeactivated',
  EventType.tableChanged: 'tableChanged',
  EventType.tableSelectionChanged: 'tableSelectionChanged',
  EventType.worksheetDeleted: 'WorksheetDeleted',
  EventType.chartAdded: 'chartAdded',
  EventType.chartActivated: 'chartActivated',
  EventType.chartDeactivated: 'chartDeactivated',
  EventType.chartDeleted: 'chartDeleted',
  EventType.worksheetCalculated: 'worksheetCalculated',
  EventType.visualSelectionChanged: 'visualSelectionChanged',
  EventType.agaveVisualUpdate: 'agaveVisualUpdate',
  EventType.tableAdded: 'tableAdded',
  EventType.tableDeleted: 'tableDeleted',
  EventType.tableFiltered: 'tableFiltered',
  EventType.worksheetFiltered: 'worksheetFiltered',
  EventType.shapeActivated: 'shapeActivated',
  EventType.shapeDeactivated: 'shapeDeactivated',
  EventType.visualChange: 'visualChange',
  EventType.workbookAutoSaveSettingChanged: 'workbookAutoSaveSettingChanged',
  EventType.worksheetFormatChanged: 'worksheetFormatChanged',
  EventType.ribbonCommandExecuted: 'ribbonCommandExecuted',
  EventType.worksheetRowSorted: 'worksheetRowSorted',
  EventType.worksheetColumnSorted: 'worksheetColumnSorted',
  EventType.worksheetSingleClicked: 'worksheetSingleClicked',
  EventType.worksheetRowHiddenChanged: 'worksheetRowHiddenChanged',
  EventType.commentAdded: 'commentAdded',
  EventType.commentDeleted: 'commentDeleted',
  EventType.commentChanged: 'commentChanged',
  EventType.linkedDataTypeRefreshRequestCompleted:
      'linkedDataTypeRefreshRequestCompleted',
  EventType.linkedDataTypeRefreshModeChanged:
      'linkedDataTypeRefreshModeChanged',
  EventType.linkedDataTypeLinkedDataTypeAdded:
      'linkedDataTypeLinkedDataTypeAdded',
  EventType.worksheetFormulaChanged: 'worksheetFormulaChanged',
  EventType.workbookActivated: 'WorkbookActivated',
  EventType.linkedWorkbookWorkbookLinksChanged:
      'linkedWorkbookWorkbookLinksChanged',
  EventType.linkedWorkbookRefreshCompleted: 'linkedWorkbookRefreshCompleted',
  EventType.worksheetProtectionChanged: 'worksheetProtectionChanged',
  EventType.worksheetNameChanged: 'WorksheetNameChanged',
  EventType.worksheetVisibilityChanged: 'WorksheetVisibilityChanged',
  EventType.worksheetMoved: 'WorksheetMoved',
  EventType.lineageActivityUpdateAvailable: 'lineageActivityUpdateAvailable',
};

_$_WorksheetAddedEventArgs _$$_WorksheetAddedEventArgsFromJson(
        Map<String, dynamic> json) =>
    _$_WorksheetAddedEventArgs(
      source: $enumDecode(_$EventSourceEnumMap, json['source']),
      worksheetId: json['worksheetId'] as String,
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_WorksheetAddedEventArgsToJson(
        _$_WorksheetAddedEventArgs instance) =>
    <String, dynamic>{
      'source': _$EventSourceEnumMap[instance.source],
      'worksheetId': instance.worksheetId,
      'type': _$EventTypeEnumMap[instance.type],
    };

_$_WorksheetActivatedEventArgs _$$_WorksheetActivatedEventArgsFromJson(
        Map<String, dynamic> json) =>
    _$_WorksheetActivatedEventArgs(
      worksheetId: json['worksheetId'] as String,
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_WorksheetActivatedEventArgsToJson(
        _$_WorksheetActivatedEventArgs instance) =>
    <String, dynamic>{
      'worksheetId': instance.worksheetId,
      'type': _$EventTypeEnumMap[instance.type],
    };

_$_WorksheetChangedEventArgs _$$_WorksheetChangedEventArgsFromJson(
        Map<String, dynamic> json) =>
    _$_WorksheetChangedEventArgs(
      address: json['address'] as String,
      changeType: $enumDecode(_$DataChangeTypeEnumMap, json['changeType']),
      source: $enumDecode(_$EventSourceEnumMap, json['source']),
      worksheetId: json['worksheetId'] as String,
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_WorksheetChangedEventArgsToJson(
        _$_WorksheetChangedEventArgs instance) =>
    <String, dynamic>{
      'address': instance.address,
      'changeType': _$DataChangeTypeEnumMap[instance.changeType],
      'source': _$EventSourceEnumMap[instance.source],
      'worksheetId': instance.worksheetId,
      'type': _$EventTypeEnumMap[instance.type],
    };

const _$DataChangeTypeEnumMap = {
  DataChangeType.unknown: 'Unknown',
  DataChangeType.rangeEdited: 'Unknown',
  DataChangeType.rowInserted: 'Unknown',
  DataChangeType.rowDeleted: 'Unknown',
  DataChangeType.columnInserted: 'ColumnInserted',
  DataChangeType.columnDeleted: 'ColumnDeleted',
  DataChangeType.cellInserted: 'CellInserted',
  DataChangeType.cellDeleted: 'CellDeleted',
};

_$_WorksheetNameChangedEventArgs _$$_WorksheetNameChangedEventArgsFromJson(
        Map<String, dynamic> json) =>
    _$_WorksheetNameChangedEventArgs(
      nameAfter: json['nameAfter'] as String,
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      nameBefore: json['nameBefore'] as String,
      source: $enumDecode(_$EventSourceEnumMap, json['source']),
      worksheetId: json['worksheetId'] as String,
    );

Map<String, dynamic> _$$_WorksheetNameChangedEventArgsToJson(
        _$_WorksheetNameChangedEventArgs instance) =>
    <String, dynamic>{
      'nameAfter': instance.nameAfter,
      'type': _$EventTypeEnumMap[instance.type],
      'nameBefore': instance.nameBefore,
      'source': _$EventSourceEnumMap[instance.source],
      'worksheetId': instance.worksheetId,
    };

_$_WorksheetMovedEventArgs _$$_WorksheetMovedEventArgsFromJson(
        Map<String, dynamic> json) =>
    _$_WorksheetMovedEventArgs(
      positionAfter: json['positionAfter'] as int,
      positionBefore: json['positionBefore'] as int,
      source: $enumDecode(_$EventSourceEnumMap, json['source']),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      worksheetId: json['worksheetId'] as String,
    );

Map<String, dynamic> _$$_WorksheetMovedEventArgsToJson(
        _$_WorksheetMovedEventArgs instance) =>
    <String, dynamic>{
      'positionAfter': instance.positionAfter,
      'positionBefore': instance.positionBefore,
      'source': _$EventSourceEnumMap[instance.source],
      'type': _$EventTypeEnumMap[instance.type],
      'worksheetId': instance.worksheetId,
    };
