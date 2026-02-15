import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/tables_enum/table_type_enum.dart';

part 'home_tables_bloc.freezed.dart';
part 'home_tables_event.dart';
part 'home_tables_state.dart';

class HomeTablesBloc extends Bloc<HomeTablesEvent, HomeTablesState> {
  HomeTablesBloc() : super(const HomeTablesState()) {
    on<SelectTableType>(_onSelectTableType);
    on<ClearSelection>(_onClearSelection);
  }

  void _onSelectTableType(
    SelectTableType event,
    Emitter<HomeTablesState> emit,
  ) {
    emit(state.copyWith(selectedTable: event.tableType));
  }

  void _onClearSelection(ClearSelection event, Emitter<HomeTablesState> emit) {
    emit(const HomeTablesState());
  }
}
