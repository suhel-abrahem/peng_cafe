import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection_event.dart';
part 'selection_state.dart';
part 'selection_bloc.freezed.dart';

class SelectionBloc extends Bloc<SelectionEvent, SelectionState> {
  SelectionBloc() : super(const SelectionState()) {
    on<EnterSelectionMode>(_onEnterSelection);
    on<ExitSelectionMode>(_onExitSelection);
    on<ToggleSelectAll>(_onToggleSelectAll);
    on<ToggleProduct>(_onToggleProduct);
  }
  void _onEnterSelection(
    EnterSelectionMode event,
    Emitter<SelectionState> emit,
  ) {
    emit(state.copyWith(isSelectMode: true));
  }

  void _onExitSelection(ExitSelectionMode event, Emitter<SelectionState> emit) {
    emit(const SelectionState());
  }

  void _onToggleSelectAll(ToggleSelectAll event, Emitter<SelectionState> emit) {
    emit(
      state.copyWith(
        isSelectMode: true,
        isSelectAll: !state.isSelectAll,
        selectedIds: {},
        excludedIds: {},
      ),
    );
  }

  void _onToggleProduct(ToggleProduct event, Emitter<SelectionState> emit) {
    if (state.isSelectAll) {
      final excluded = {...state.excludedIds};

      excluded.contains(event.productId)
          ? excluded.remove(event.productId)
          : excluded.add(event.productId);

      emit(state.copyWith(excludedIds: excluded));
    } else {
      final selected = {...state.selectedIds};

      selected.contains(event.productId)
          ? selected.remove(event.productId)
          : selected.add(event.productId);

      emit(
        state.copyWith(
          selectedIds: selected,
          isSelectMode: selected.isNotEmpty,
        ),
      );
    }
  }
}
