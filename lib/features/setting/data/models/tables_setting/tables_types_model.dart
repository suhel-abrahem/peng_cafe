import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peng_cafe/features/setting/domain/entities/tables_setting_entity/tables_quantity_entity.dart';
part 'tables_types_model.freezed.dart';
part 'tables_types_model.g.dart';

@freezed
abstract class TablesTypesModel with _$TablesTypesModel {
  const factory TablesTypesModel({
    @Default([]) List<TablesQuantityEntity> tablesTypes,
    @Default(false) bool isEditing,
  }) = _TablesTypesModel;

  factory TablesTypesModel.fromJson(Map<String, Object?> json) =>
      _$TablesTypesModelFromJson(json);
}
