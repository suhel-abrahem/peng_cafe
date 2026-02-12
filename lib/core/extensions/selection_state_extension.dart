import '../resource/selection_bloc/bloc/selection_bloc.dart';

extension SelectionStateX on SelectionState {
  bool get hasSelection => isSelectAll || selectedIds.isNotEmpty;

  bool isSelected(int id) {
    if (isSelectAll) {
      return !excludedIds.contains(id);
    }
    return selectedIds.contains(id);
  }

  int effectiveSelectedCount(int totalItems) {
    if (!isSelectAll) return selectedIds.length;
    return totalItems - excludedIds.length;
  }
}
