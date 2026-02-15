// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderEntity _$OrderEntityFromJson(Map<String, dynamic> json) => _OrderEntity(
  id: (json['id'] as num?)?.toInt() ?? 0,
  orderNumber: json['orderNumber'] as String? ?? '',
  tableNumber: (json['tableNumber'] as num?)?.toInt() ?? 0,
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
      'status': _$OrderStatusEnumEnumMap[instance.status]!,
      'total': instance.total,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$OrderStatusEnumEnumMap = {
  OrderStatusEnum.inProgress: 'inProgress',
  OrderStatusEnum.completed: 'completed',
  OrderStatusEnum.cancelled: 'cancelled',
};
