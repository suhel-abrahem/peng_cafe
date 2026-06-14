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
  netTotal: (json['netTotal'] as num?)?.toDouble() ?? 0.0,
  profit: (json['profit'] as num?)?.toDouble() ?? 0.0,
  losses: (json['losses'] as num?)?.toDouble() ?? 0.0,
  discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
  customerName: json['customerName'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  orderType: $enumDecode(_$OrderTypeEnumEnumMap, json['orderType']),
);

Map<String, dynamic> _$OrderEntityToJson(_OrderEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderNumber': instance.orderNumber,
      'tableNumber': instance.tableNumber,
      'tableType': _$TableTypeEnumEnumMap[instance.tableType]!,
      'status': _$OrderStatusEnumEnumMap[instance.status]!,
      'total': instance.total,
      'netTotal': instance.netTotal,
      'profit': instance.profit,
      'losses': instance.losses,
      'discount': instance.discount,
      'customerName': instance.customerName,
      'createdAt': instance.createdAt.toIso8601String(),
      'orderType': _$OrderTypeEnumEnumMap[instance.orderType]!,
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

const _$OrderTypeEnumEnumMap = {
  OrderTypeEnum.dineIn: 'dineIn',
  OrderTypeEnum.takeAway: 'takeAway',
  OrderTypeEnum.withdrawal: 'withdrawal',
};
