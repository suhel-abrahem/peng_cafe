import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_entity.freezed.dart';
part 'product_entity.g.dart';

@freezed
abstract class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    @Default(0) int? id,
    @Default("") String? name,

    @Default("") String? description,

    @Default(0.0) double price,
    @Default(0) int quantity,
    @Default("") String? imagePath,
    @Default(null) DateTime? createdAt,
  }) = _ProductEntity;

  factory ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductEntityFromJson(json);
}
