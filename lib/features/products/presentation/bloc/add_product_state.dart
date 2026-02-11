part of 'add_product_bloc.dart';

@freezed
class AddProductState with _$AddProductState {
  const factory AddProductState.initial() = AddProductStateInitial;
  const factory AddProductState.loading() = AddProductStateLoading;
  const factory AddProductState.success() = AddProductStateSuccess;
  const factory AddProductState.error(String message) = AddProductStateError;
}
