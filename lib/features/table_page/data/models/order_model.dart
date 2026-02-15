import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/tables_enum/table_type_enum.dart';
part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderModel with _$OrderModel {
  const factory OrderModel({
    required int tableNumber,
    TableTypeEnum? tableType,
    required int userId,
  }) = _OrderModel;
  factory OrderModel.fromJson(Map<String, Object?> json) =>
      _$OrderModelFromJson(json);
}
