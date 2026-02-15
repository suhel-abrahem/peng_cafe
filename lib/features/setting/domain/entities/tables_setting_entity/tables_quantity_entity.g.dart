// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables_quantity_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TablesQuantityEntity _$TablesQuantityEntityFromJson(
  Map<String, dynamic> json,
) => _TablesQuantityEntity(
  tableName: $enumDecode(_$TableTypeEnumEnumMap, json['tableName']),
  quantity: (json['quantity'] as num?)?.toInt() ?? 0,
  isActive: json['isActive'] as bool? ?? false,
);

Map<String, dynamic> _$TablesQuantityEntityToJson(
  _TablesQuantityEntity instance,
) => <String, dynamic>{
  'tableName': _$TableTypeEnumEnumMap[instance.tableName]!,
  'quantity': instance.quantity,
  'isActive': instance.isActive,
};

const _$TableTypeEnumEnumMap = {
  TableTypeEnum.cafe: 'cafe',
  TableTypeEnum.pool: 'pool',
  TableTypeEnum.videoGame: 'videoGame',
  TableTypeEnum.fisha: 'fisha',
  TableTypeEnum.tableBall: 'tableBall',
  TableTypeEnum.takeAway: 'takeAway',
};
