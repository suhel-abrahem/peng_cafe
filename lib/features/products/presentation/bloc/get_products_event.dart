part of 'get_products_bloc.dart';

@freezed
class GetProductsEvent with _$GetProductsEvent {
  const factory GetProductsEvent.started() = GetProductsEventStarted;

  const factory GetProductsEvent.getProducts({ProductModel? productsModel}) =
      GetProductsEventGetProducts;
  const factory GetProductsEvent.getProduct({ProductModel? productModel}) =
      GetProductsEventGetProduct;
}
