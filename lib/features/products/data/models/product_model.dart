import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/resource/json_converter/file_json_converter.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    @Default(0) int? id,
    @Default("ar") String? locale,
    @Default("") String? nameAr,
    @Default("") String? nameEn,
    @Default(null) String? nameKu,
    @Default("") String? descriptionAr,
    @Default("") String? descriptionEn,
    @Default("") String? descriptionKu,
    @Default(0.0) double price,
    @FileJsonConverter() File? imagePath,
    @Default(0) int quantity,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
