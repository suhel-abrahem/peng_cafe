import 'package:peng_cafe/core/resource/data_state.dart';
import 'package:peng_cafe/core/usecase/usecase.dart';
import 'package:peng_cafe/features/products/data/models/product_model.dart';

import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<DataState<List<ProductEntity>?>?> getAllProducts(ProductModel? locale);
  Future<DataState<ProductEntity>?> getProduct(ProductModel? productModel);
  Future<DataState<void>?> insertProduct(ProductModel? productModel);
  Future<DataState<void>?> updateProduct(ProductModel? productModel);
  Future<DataState<void>?> deleteSelectedProducts(List<int> ids);
  Future<DataState<void>?> deleteAllProducts(NoParams params);
  Future<DataState<void>?> deleteAllExceptExcludedProducts(
    List<int> excludedIds,
  );
  Future<DataState<List<ProductEntity>>> searchProducts({
    required String query,
    required String locale,
  });
}
