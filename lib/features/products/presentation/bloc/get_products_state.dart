part of 'get_products_bloc.dart';

@freezed
class GetProductsState with _$GetProductsState {
  const factory GetProductsState.initial() = GetProductsStateInitial;
  const factory GetProductsState.loading() = GetProductsStateLoading;
  const factory GetProductsState.loaded(List<ProductEntity> products) =
      GetProductsStateLoaded;
  const factory GetProductsState.noData() = GetProductsStateNoData;
  const factory GetProductsState.error(String message) = GetProductsStateError;
}
