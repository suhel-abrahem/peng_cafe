part of 'tables_types_bloc.dart';

@freezed
class TablesTypesEvent with _$TablesTypesEvent {
  const factory TablesTypesEvent.load() = TablesTypesLoad;

  const factory TablesTypesEvent.toggleEdit() = TablesTypesToggleEdit;

  const factory TablesTypesEvent.updateQuantity({
    required TableTypeEnum tableName,
    required int quantity,
  }) = TablesTypesUpdateQuantity;

  const factory TablesTypesEvent.toggleActivation({
    required TableTypeEnum tableName,
    required bool isActive,
  }) = TablesTypesToggleActivation;

  const factory TablesTypesEvent.save() = TablesTypesSave;
}
