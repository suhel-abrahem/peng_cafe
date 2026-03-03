import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/order_type_enum/order_type_enum.dart';
import '../../../../core/enums/tables_enum/table_type_enum.dart';
part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderModel with _$OrderModel {
  const factory OrderModel({
    required int tableNumber,
    required TableTypeEnum tableType,
    required int userId,
    @Default(OrderTypeEnum.dineIn) OrderTypeEnum? orderType,
  }) = _OrderModel;
  factory OrderModel.fromJson(Map<String, Object?> json) =>
      _$OrderModelFromJson(json);
}
