import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peng_cafe/core/enums/product_type_enum/product_type_enum.dart';
part 'product_entity.freezed.dart';
part 'product_entity.g.dart';

@freezed
abstract class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    @Default(0) int? id,
    @Default("") String? name,

    @Default("") String? description,

    @Default(0.0) double price,
    @Default(0.0) double? quantity,
    @Default("") String? imagePath,
    @Default(0.0) double? discount,
    @Default(ProductTypeEnum.foodAndBeverage) ProductTypeEnum? productType,
    @Default(0.0) double? costPrice,
    @Default(null) DateTime? createdAt,
  }) = _ProductEntity;

  factory ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductEntityFromJson(json);
}
