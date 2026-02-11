part of 'add_product_bloc.dart';

@freezed
class AddProductEvent with _$AddProductEvent {
  const factory AddProductEvent.started() = AddProductEventStarted;
  const factory AddProductEvent.addProduct({
    required ProductModel productModel,
  }) = AddProductEventAddProduct;
}
