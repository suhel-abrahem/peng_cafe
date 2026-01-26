// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_setting_date_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

$SyncSettingDateModel _$$SyncSettingDateModelFromJson(
  Map<String, dynamic> json,
) => $SyncSettingDateModel(
  auto: json['auto'] as String? ?? '',
  tables: json['tables'] as String? ?? '',
  charts: json['charts'] as String? ?? '',
  items: json['items'] as String? ?? '',
  salesmanNames: json['salesmanNames'] as String? ?? '',
  salesmanLocations: json['salesmanLocations'] as String? ?? '',
  salesmanClients: json['salesmanClients'] as String? ?? '',
);

Map<String, dynamic> _$$SyncSettingDateModelToJson(
  $SyncSettingDateModel instance,
) => <String, dynamic>{
  'auto': instance.auto,
  'tables': instance.tables,
  'charts': instance.charts,
  'items': instance.items,
  'salesmanNames': instance.salesmanNames,
  'salesmanLocations': instance.salesmanLocations,
  'salesmanClients': instance.salesmanClients,
};
