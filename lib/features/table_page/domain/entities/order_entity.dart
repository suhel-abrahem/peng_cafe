import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/order_status_enum/order_status_enum.dart';
part 'order_entity.freezed.dart';
part 'order_entity.g.dart';

@freezed
abstract class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
    @Default(0) int id,
    @Default('') String orderNumber,
    @Default(0) int tableNumber,
    @Default(OrderStatusEnum.inProgress) OrderStatusEnum status,
    @Default(0.0) double total,
    required DateTime createdAt,
  }) = _OrderEntity;
  factory OrderEntity.fromJson(Map<String, Object?> json) =>
      _$OrderEntityFromJson(json);
}
