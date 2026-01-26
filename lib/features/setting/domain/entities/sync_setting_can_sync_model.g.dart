// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_setting_can_sync_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

$SyncSettingCanSyncModel _$$SyncSettingCanSyncModelFromJson(
  Map<String, dynamic> json,
) => $SyncSettingCanSyncModel(
  auto: json['auto'] as bool? ?? false,
  tables: json['tables'] as bool? ?? false,
  charts: json['charts'] as bool? ?? false,
  items: json['items'] as bool? ?? false,
  salesmanNames: json['salesmanNames'] as bool? ?? false,
  salesmanLocations: json['salesmanLocations'] as bool? ?? false,
  salesmanClients: json['salesmanClients'] as bool? ?? false,
  rule: json['rule'] as bool? ?? false,
);

Map<String, dynamic> _$$SyncSettingCanSyncModelToJson(
  $SyncSettingCanSyncModel instance,
) => <String, dynamic>{
  'auto': instance.auto,
  'tables': instance.tables,
  'charts': instance.charts,
  'items': instance.items,
  'salesmanNames': instance.salesmanNames,
  'salesmanLocations': instance.salesmanLocations,
  'salesmanClients': instance.salesmanClients,
  'rule': instance.rule,
};
