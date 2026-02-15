part of 'home_tables_bloc.dart';

@freezed
class HomeTablesEvent with _$HomeTablesEvent {
  const factory HomeTablesEvent.selectTableType(TableTypeEnum tableType) =
      SelectTableType;

  const factory HomeTablesEvent.clearSelection() = ClearSelection;
}
