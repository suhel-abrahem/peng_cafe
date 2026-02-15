// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TablesTypesModel _$TablesTypesModelFromJson(Map<String, dynamic> json) =>
    _TablesTypesModel(
      tablesTypes:
          (json['tablesTypes'] as List<dynamic>?)
              ?.map(
                (e) => TablesQuantityEntity.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      isEditing: json['isEditing'] as bool? ?? false,
    );

Map<String, dynamic> _$TablesTypesModelToJson(_TablesTypesModel instance) =>
    <String, dynamic>{
      'tablesTypes': instance.tablesTypes,
      'isEditing': instance.isEditing,
    };
