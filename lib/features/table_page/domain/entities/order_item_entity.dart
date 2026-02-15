import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/product_type_enum/product_type_enum.dart';
import '../../../../core/enums/tables_enum/table_type_enum.dart';

part 'order_item_entity.freezed.dart';
part 'order_item_entity.g.dart';

@freezed
abstract class OrderItemEntity with _$OrderItemEntity {
  const factory OrderItemEntity({
    required int id,
    required int orderId,
    required int productId,
    required double quantity,
    required double price,
    required double total,
    String? productName,
    double? discount,
    required TableTypeEnum tableType,
    required int tableNumber,
    required ProductTypeEnum productType,
    required DateTime createdAt,
  }) = _OrderItemEntity;
  factory OrderItemEntity.fromJson(Map<String, Object?> json) =>
      _$OrderItemEntityFromJson(json);
}
