import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:peng_cafe/core/DB/app_database.dart';
import 'package:peng_cafe/core/resource/data_state.dart';
import 'package:peng_cafe/core/usecase/usecase.dart';
import 'package:peng_cafe/features/products/data/models/product_model.dart';
import 'package:peng_cafe/features/products/domain/entities/product_entity.dart';
import 'package:peng_cafe/features/products/domain/repositories/product_repository.dart';

import '../../../../core/DB/mappers/product_mapper.dart';
import '../../../../core/enums/product_type_enum/product_type_enum.dart';
import '../../../../core/util/helper/image_storage_helper.dart';

class ProductRepositoryImplement implements ProductRepository {
  final AppDatabase database;
  ProductRepositoryImplement(this.database);

  @override
  Future<DataState<List<ProductEntity>>> getAllProducts(
    ProductModel? params,
  ) async {
    try {
      final rows = await database.productsDao.getAllProducts();

      if (rows.isEmpty) {
        return const NoDataDataState();
      }

      final products = rows
          .map((row) => productFromRow(row, params?.locale ?? 'ar'))
          .toList();

      return DataSuccess(data: products);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }

  @override
  Future<DataState<ProductEntity>> getProduct(ProductModel? product) async {
    try {
      final row = await database.productsDao.getProductById(product?.id ?? 0);

      if (row == null) {
        return const NotFoundDataState(error: 'Product not found');
      }

      final entity = productFromRow(row, product?.locale ?? 'ar');

      return DataSuccess(data: entity);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }

  @override
  Future<DataState<void>> insertProduct(ProductModel? product) async {
    String? savedImagePath;

    try {
      // 1️⃣ check if product exists
      final exists = await database.productsDao.productNameExists(
        nameAr: product?.nameAr ?? '',
        nameEn: product?.nameEn,
        nameKu: product?.nameKu,
      );

      if (exists) {
        return const ItemsAlreadyExistsDataState(
          error: 'Product already exists',
        );
      }

      // 2️⃣ save image
      savedImagePath = await ImageStorageHelper.saveProductImage(
        product?.imagePath,
      );

      // 3️⃣ insert
      final companion = ProductsTableCompanion(
        nameAr: Value(product?.nameAr ?? ''),
        nameEn: Value(product?.nameEn),
        nameKu: Value(product?.nameKu),
        descriptionAr: Value(product?.descriptionAr),
        descriptionEn: Value(product?.descriptionEn),
        descriptionKu: Value(product?.descriptionKu),
        price: Value(product?.price ?? 0.0),
        quantity: Value(product?.quantity ?? 0.0),
        imagePath: Value(savedImagePath),
        costPrice: Value(product?.costPrice ?? 0.0),
        discount: Value(product?.discount ?? 0.0),
        productType: Value(
          (product?.productType ?? ProductTypeEnum.foodAndBeverage),
        ),
      );

      await database.productsDao.insertProduct(companion);

      return const DataSuccess(data: null);
    } on SqliteException catch (e) {
      // rollback image if db failed
      await ImageStorageHelper.deleteImage(savedImagePath);

      if (e.message.contains('UNIQUE')) {
        return const ItemsAlreadyExistsDataState(
          error: 'Product already exists',
        );
      }
      return DataFailed(error: e.message);
    } catch (e) {
      // rollback image
      await ImageStorageHelper.deleteImage(savedImagePath);
      return DataFailed(error: e.toString());
    }
  }

  @override
  Future<DataState<void>> updateProduct(ProductModel? product) async {
    try {
      final old = await database.productsDao.getProductById(product?.id ?? 0);

      if (old == null) {
        return const NotFoundDataState(error: 'Product not found');
      }

      String? imagePath = old.imagePath;

      if (product?.imagePath != null) {
        imagePath = await ImageStorageHelper.saveProductImage(
          product?.imagePath,
        );
        await ImageStorageHelper.deleteImage(old.imagePath);
      }

      final updated = old.copyWith(
        nameAr: product?.nameAr ?? '',
        nameEn: Value(product?.nameEn),
        nameKu: Value(product?.nameKu),
        descriptionAr: Value(product?.descriptionAr),
        descriptionEn: Value(product?.descriptionEn),
        descriptionKu: Value(product?.descriptionKu),
        price: product?.price,
        quantity: Value(product?.quantity ?? 0.0),
        imagePath: Value(imagePath),
        costPrice: Value(product?.costPrice ?? 0.0),
        discount: Value(product?.discount ?? 0.0),
        productType: (product?.productType ?? ProductTypeEnum.foodAndBeverage),
      );

      await database.productsDao.updateProduct(updated);

      return const DataSuccess(data: null);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }

  @override
  Future<DataState<void>?> deleteAllExceptExcludedProducts(
    List<int> excludedIds,
  ) async {
    try {
      await database.productsDao.deleteProductsExcludingIds(excludedIds);
      return const DataSuccess(data: null);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }

  @override
  Future<DataState<void>?> deleteAllProducts(NoParams params) async {
    try {
      await database.productsDao.deleteAllProducts();
      return const DataSuccess(data: null);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }

  @override
  Future<DataState<void>?> deleteSelectedProducts(List<int> ids) async {
    try {
      await database.productsDao.deleteProducts(ids);
      return const DataSuccess(data: null);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }

  @override
  Future<DataState<List<ProductEntity>>> searchProducts({
    required String query,
    required String locale,
  }) async {
    try {
      final rows = await database.productsDao.searchProductsByName(query);

      final products = rows.map((row) => productFromRow(row, locale)).toList();

      return DataSuccess(data: products);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }
}
