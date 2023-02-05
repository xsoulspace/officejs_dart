// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'office_typedefs.dart';

part 'office_models.freezed.dart';
part 'office_models.g.dart';

@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class OfficeInfo with _$OfficeInfo {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory OfficeInfo({
    required final HostType host,
    final PlatformType? platform,
  }) = _OfficeInfo;
  const OfficeInfo._();
  factory OfficeInfo.fromJson(final Map<String, dynamic> json) =>
      _$OfficeInfoFromJson(json);
}
