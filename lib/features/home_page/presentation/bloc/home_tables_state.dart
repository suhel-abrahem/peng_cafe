part of 'home_tables_bloc.dart';

@freezed
abstract class HomeTablesState with _$HomeTablesState {
  const factory HomeTablesState({TableTypeEnum? selectedTable}) =
      _HomeTablesState;
}
