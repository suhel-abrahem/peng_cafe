import 'package:drift/drift.dart';
import 'package:peng_cafe/core/DB/app_database.dart';
import 'package:peng_cafe/core/resource/data_state.dart';
import 'package:peng_cafe/features/products/data/models/product_model.dart';
import 'package:peng_cafe/features/products/domain/entities/product_entity.dart';
import 'package:peng_cafe/features/products/domain/repositories/product_repository.dart';

import '../../../../core/DB/mappers/product_mapper.dart';
import '../../../../core/util/helper/image_storage_helper.dart';

class ProductRepositoryImplement implements ProductRepository {
  final AppDatabase database;
  ProductRepositoryImplement(this.database);
  @override
  Future<DataState<void>?> deleteProduct(ProductModel? productModel) async {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<ProductEntity>?>?> getAllProducts(
    ProductModel? locale,
  ) async {
    DataState<List<ProductEntity>?>? dataState;
    try {
      List<ProductsTableData>? rawProducts = await database.productsDao
          .getAllProducts();

      final products = rawProducts
          .map((row) => productFromRow(row, locale?.locale ?? 'ar'))
          .toList();
      dataState = DataSuccess(data: products);
    } catch (e) {
      dataState = DataFailed(error: e.toString());
      return dataState;
    }
    return dataState;
  }

  @override
  Future<DataState<ProductEntity>?> getProduct(ProductModel? productModel) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<DataState<void>?> insertProduct(ProductModel? productModel) async {
    DataState<void>? dataState;
    try {
      final imagePath = await ImageStorageHelper.saveProductImage(
        productModel?.imagePath,
      );
      final companion = ProductsTableCompanion(
        nameAr: Value(productModel?.nameAr ?? ""),
        nameEn: Value(productModel?.nameEn),
        nameKu: Value(productModel?.nameKu),
        descriptionAr: Value(productModel?.descriptionAr),
        descriptionEn: Value(productModel?.descriptionEn),
        descriptionKu: Value(productModel?.descriptionKu),
        price: Value(productModel?.price ?? 0.0),
        quantity: Value(productModel?.quantity ?? 0),
        imagePath: Value(imagePath),
      );
      await database.productsDao.insertProduct(companion);
      dataState = const DataSuccess(data: null);
    } catch (e) {
      dataState = DataFailed(error: e.toString());
    }
    return Future.value(dataState);
  }

  @override
  Future<DataState<void>?> updateProduct(ProductModel? productModel) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
