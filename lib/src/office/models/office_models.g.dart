// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OfficeInfo _$$_OfficeInfoFromJson(final Map<String, dynamic> json) =>
    _$_OfficeInfo(
      host: $enumDecode(_$HostTypeEnumMap, json['host']),
      platform: $enumDecodeNullable(_$PlatformTypeEnumMap, json['platform']),
    );

Map<String, dynamic> _$$_OfficeInfoToJson(final _$_OfficeInfo instance) =>
    <String, dynamic>{
      'host': _$HostTypeEnumMap[instance.host],
      'platform': _$PlatformTypeEnumMap[instance.platform],
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

const _$PlatformTypeEnumMap = {
  PlatformType.pc: 'PC',
  PlatformType.officeOnline: 'OfficeOnline',
  PlatformType.mac: 'Mac',
  PlatformType.iOS: 'iOS',
  PlatformType.android: 'Android',
  PlatformType.universal: 'Universal',
};
