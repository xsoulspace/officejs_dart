// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OfficeInfo _$$_OfficeInfoFromJson(Map<String, dynamic> json) =>
    _$_OfficeInfo(
      host: $enumDecode(_$PlatformTypeEnumMap, json['host']),
      platform: $enumDecode(_$HostTypeEnumMap, json['platform']),
    );

Map<String, dynamic> _$$_OfficeInfoToJson(_$_OfficeInfo instance) =>
    <String, dynamic>{
      'host': _$PlatformTypeEnumMap[instance.host],
      'platform': _$HostTypeEnumMap[instance.platform],
    };

const _$PlatformTypeEnumMap = {
  PlatformType.pc: 'PC',
  PlatformType.officeOnline: 'OfficeOnline',
  PlatformType.mac: 'Mac',
  PlatformType.iOS: 'iOS',
  PlatformType.android: 'Android',
  PlatformType.universal: 'Universal',
};

const _$HostTypeEnumMap = {
  HostType.word: 'Word',
  HostType.excel: 'Excel',
  HostType.powerPoint: 'PowerPoint',
  HostType.outlook: 'Outlook',
  HostType.oneNote: 'OneNote',
  HostType.project: 'Project',
  HostType.access: 'Access',
};
