// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductEntity _$ProductEntityFromJson(Map<String, dynamic> json) =>
    _ProductEntity(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0.0,
      imagePath: json['imagePath'] as String? ?? "",
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      productType:
          $enumDecodeNullable(_$ProductTypeEnumEnumMap, json['productType']) ??
          ProductTypeEnum.foodAndBeverage,
      costPrice: (json['costPrice'] as num?)?.toDouble() ?? 0.0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ProductEntityToJson(_ProductEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'quantity': instance.quantity,
      'imagePath': instance.imagePath,
      'discount': instance.discount,
      'productType': _$ProductTypeEnumEnumMap[instance.productType],
      'costPrice': instance.costPrice,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$ProductTypeEnumEnumMap = {
  ProductTypeEnum.foodAndBeverage: 'foodAndBeverage',
  ProductTypeEnum.games: 'games',
};
