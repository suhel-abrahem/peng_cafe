import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/product_type_enum/product_type_enum.dart';
import '../../../../core/enums/tables_enum/table_type_enum.dart';

part 'order_item_model.freezed.dart';
part 'order_item_model.g.dart';

@freezed
abstract class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    @Default(0) int id,
    @Default(0) int orderId,
    @Default(0) int productId,
    @Default(0.0) double price,
    @Default(0.0) double quantity,
    double? discount,
    @Default(TableTypeEnum.cafe) TableTypeEnum tableType,
    @Default(0) int tableNumber,
    @Default(ProductTypeEnum.foodAndBeverage) ProductTypeEnum productType,
  }) = _OrderItemModel;
  factory OrderItemModel.fromJson(Map<String, Object?> json) =>
      _$OrderItemModelFromJson(json);
}
