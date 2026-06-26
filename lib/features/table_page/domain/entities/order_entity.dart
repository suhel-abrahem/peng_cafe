import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peng_cafe/core/enums/order_type_enum/order_type_enum.dart';

import '../../../../core/enums/order_status_enum/order_status_enum.dart';
import '../../../../core/enums/tables_enum/table_type_enum.dart';
part 'order_entity.freezed.dart';
part 'order_entity.g.dart';

@freezed
abstract class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
    @Default(0) int id,
    @Default('') String orderNumber,
    @Default(0) int tableNumber,
    required TableTypeEnum tableType,
    @Default(OrderStatusEnum.inProgress) OrderStatusEnum status,
    @Default(0.0) double total,
    @Default(0.0) double netTotal,
    @Default(0.0) double profit,
    @Default(0.0) double losses,
    @Default(0.0) double discount,
    @Default(0.0) double totalAfterLosses,
    String? customerName,
    required DateTime createdAt,
    required OrderTypeEnum orderType,
  }) = _OrderEntity;
  factory OrderEntity.fromJson(Map<String, Object?> json) =>
      _$OrderEntityFromJson(json);
}
