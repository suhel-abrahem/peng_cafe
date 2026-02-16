// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderEntity _$OrderEntityFromJson(Map<String, dynamic> json) => _OrderEntity(
  id: (json['id'] as num?)?.toInt() ?? 0,
  orderNumber: json['orderNumber'] as String? ?? '',
  tableNumber: (json['tableNumber'] as num?)?.toInt() ?? 0,
  tableType: $enumDecode(_$TableTypeEnumEnumMap, json['tableType']),
  status:
      $enumDecodeNullable(_$OrderStatusEnumEnumMap, json['status']) ??
      OrderStatusEnum.inProgress,
  total: (json['total'] as num?)?.toDouble() ?? 0.0,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$OrderEntityToJson(_OrderEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderNumber': instance.orderNumber,
      'tableNumber': instance.tableNumber,
      'tableType': _$TableTypeEnumEnumMap[instance.tableType]!,
      'status': _$OrderStatusEnumEnumMap[instance.status]!,
      'total': instance.total,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$TableTypeEnumEnumMap = {
  TableTypeEnum.cafe: 'cafe',
  TableTypeEnum.pool: 'pool',
  TableTypeEnum.videoGame: 'videoGame',
  TableTypeEnum.fisha: 'fisha',
  TableTypeEnum.tableBall: 'tableBall',
  TableTypeEnum.takeAway: 'takeAway',
};

const _$OrderStatusEnumEnumMap = {
  OrderStatusEnum.inProgress: 'inProgress',
  OrderStatusEnum.completed: 'completed',
  OrderStatusEnum.cancelled: 'cancelled',
};
