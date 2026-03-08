// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    _OrderItemModel(
      locale: json['locale'] as String? ?? "ar",
      id: (json['id'] as num?)?.toInt(),
      orderId: (json['orderId'] as num?)?.toInt() ?? 0,
      productId: (json['productId'] as num?)?.toInt() ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble(),
      tableType: $enumDecode(_$TableTypeEnumEnumMap, json['tableType']),
      tableNumber: (json['tableNumber'] as num?)?.toInt() ?? 0,
      productType: $enumDecode(_$ProductTypeEnumEnumMap, json['productType']),
    );

Map<String, dynamic> _$OrderItemModelToJson(_OrderItemModel instance) =>
    <String, dynamic>{
      'locale': instance.locale,
      'id': instance.id,
      'orderId': instance.orderId,
      'productId': instance.productId,
      'price': instance.price,
      'quantity': instance.quantity,
      'discount': instance.discount,
      'tableType': _$TableTypeEnumEnumMap[instance.tableType]!,
      'tableNumber': instance.tableNumber,
      'productType': _$ProductTypeEnumEnumMap[instance.productType]!,
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
