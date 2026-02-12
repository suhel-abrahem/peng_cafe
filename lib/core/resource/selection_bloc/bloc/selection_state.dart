part of 'selection_bloc.dart';

@freezed
abstract class SelectionState with _$SelectionState {
  const factory SelectionState({
    @Default(false) bool isSelectMode,
    @Default(false) bool isSelectAll,

    @Default(<int>{}) Set<int> selectedIds,

    @Default(<int>{}) Set<int> excludedIds,
  }) = _ProductsSelectionState;
}
