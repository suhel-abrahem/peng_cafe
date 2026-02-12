part of 'delete_product_bloc.dart';

@freezed
class DeleteProductEvent with _$DeleteProductEvent {
  const factory DeleteProductEvent.started() = DeleteProductEventStarted;
  const factory DeleteProductEvent.canDelete() = DeleteProductEventCanDelete;
  const factory DeleteProductEvent.deleteAll() = DeleteProductEventDeleteAll;
  const factory DeleteProductEvent.deleteSelected(List<int> ids) =
      DeleteProductEventDeleteSelected;
  const factory DeleteProductEvent.deleteAllExceptExcluded(
    List<int> excludedIds,
  ) = DeleteProductEventDeleteAllExceptExcluded;
}
