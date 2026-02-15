import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peng_cafe/core/enums/tables_enum/table_type_enum.dart';
part 'tables_quantity_entity.freezed.dart';
part 'tables_quantity_entity.g.dart';

@freezed
abstract class TablesQuantityEntity with _$TablesQuantityEntity {
  const factory TablesQuantityEntity({
    required TableTypeEnum tableName,
    @Default(0) int quantity,
    @Default(false) bool isActive,
  }) = _TablesQuantityEntity;

  factory TablesQuantityEntity.fromJson(Map<String, Object?> json) =>
      _$TablesQuantityEntityFromJson(json);
}
