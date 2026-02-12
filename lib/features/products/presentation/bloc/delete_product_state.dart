part of 'delete_product_bloc.dart';

@freezed
class DeleteProductState with _$DeleteProductState {
  const factory DeleteProductState.initial() = DeleteProductStateInitial;
  const factory DeleteProductState.loading() = DeleteProductStateLoading;
  const factory DeleteProductState.success() = DeleteProductStateSuccess;
  const factory DeleteProductState.error(String message) =
      DeleteProductStateError;
  const factory DeleteProductState.canDelete() = DeleteProductStateCanDelete;
}
