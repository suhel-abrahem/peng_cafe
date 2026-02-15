part of 'tables_types_bloc.dart';

@freezed
abstract class TablesTypesState with _$TablesTypesState {
  const factory TablesTypesState({
    @Default(TablesTypesModel()) TablesTypesModel tablesTypes,
    @Default(false) bool isLoading,
    @Default(false) bool isEditing,
  }) = _TablesTypesState;
}
