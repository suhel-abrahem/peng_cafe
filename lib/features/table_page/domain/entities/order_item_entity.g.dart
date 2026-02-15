// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItemEntity _$OrderItemEntityFromJson(Map<String, dynamic> json) =>
    _OrderItemEntity(
      id: (json['id'] as num).toInt(),
      orderId: (json['orderId'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      quantity: (json['quantity'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      productName: json['productName'] as String?,
      discount: (json['discount'] as num?)?.toDouble(),
      tableType: $enumDecode(_$TableTypeEnumEnumMap, json['tableType']),
      tableNumber: (json['tableNumber'] as num).toInt(),
      productType: $enumDecode(_$ProductTypeEnumEnumMap, json['productType']),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$OrderItemEntityToJson(_OrderItemEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'price': instance.price,
      'total': instance.total,
      'productName': instance.productName,
      'discount': instance.discount,
      'tableType': _$TableTypeEnumEnumMap[instance.tableType]!,
      'tableNumber': instance.tableNumber,
      'productType': _$ProductTypeEnumEnumMap[instance.productType]!,
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

const _$ProductTypeEnumEnumMap = {
  ProductTypeEnum.foodAndBeverage: 'foodAndBeverage',
  ProductTypeEnum.games: 'games',
};
