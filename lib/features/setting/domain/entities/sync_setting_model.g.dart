// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SyncSettingModel _$SyncSettingModelFromJson(Map<String, dynamic> json) =>
    _SyncSettingModel(
      auto: json['auto'] as String? ?? 'never',
      tables: json['tables'] as String? ?? 'never',
      charts: json['charts'] as String? ?? 'never',
      items: json['items'] as String? ?? 'never',
      deliveryNames: json['deliveryNames'] as String? ?? 'never',
      deliveryLocations: json['deliveryLocations'] as String? ?? 'never',
      deliveryClients: json['deliveryClients'] as String? ?? 'never',
      rule: json['rule'] as String? ?? 'never',
    );

Map<String, dynamic> _$SyncSettingModelToJson(_SyncSettingModel instance) =>
    <String, dynamic>{
      'auto': instance.auto,
      'tables': instance.tables,
      'charts': instance.charts,
      'items': instance.items,
      'deliveryNames': instance.deliveryNames,
      'deliveryLocations': instance.deliveryLocations,
      'deliveryClients': instance.deliveryClients,
      'rule': instance.rule,
    };
