part of 'selection_bloc.dart';

@freezed
abstract class SelectionEvent with _$SelectionEvent {
  const factory SelectionEvent.enterSelectionMode() = EnterSelectionMode;

  const factory SelectionEvent.exitSelectionMode() = ExitSelectionMode;

  const factory SelectionEvent.toggleSelectAll() = ToggleSelectAll;

  const factory SelectionEvent.toggleProduct(int productId) = ToggleProduct;

  const factory SelectionEvent.deleteSelected() = DeleteSelected;
}
