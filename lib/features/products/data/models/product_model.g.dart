// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      locale: json['locale'] as String? ?? "ar",
      nameAr: json['nameAr'] as String? ?? "",
      nameEn: json['nameEn'] as String? ?? "",
      nameKu: json['nameKu'] as String? ?? null,
      descriptionAr: json['descriptionAr'] as String? ?? "",
      descriptionEn: json['descriptionEn'] as String? ?? "",
      descriptionKu: json['descriptionKu'] as String? ?? "",
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      imagePath: const FileJsonConverter().fromJson(
        json['imagePath'] as String?,
      ),
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locale': instance.locale,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'nameKu': instance.nameKu,
      'descriptionAr': instance.descriptionAr,
      'descriptionEn': instance.descriptionEn,
      'descriptionKu': instance.descriptionKu,
      'price': instance.price,
      'imagePath': const FileJsonConverter().toJson(instance.imagePath),
      'quantity': instance.quantity,
    };
