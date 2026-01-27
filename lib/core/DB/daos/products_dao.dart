import 'package:drift/drift.dart';
import 'package:peng_cafe/core/DB/app_database.dart';
import 'package:peng_cafe/core/DB/tables/products_table.dart';

part 'products_dao.g.dart';

@DriftAccessor(tables: [ProductsTable])
class ProductsDao extends DatabaseAccessor<AppDatabase>
    with _$ProductsDaoMixin {
  ProductsDao(super.db);

  Future<int> insertProduct(ProductsTableCompanion product) =>
      into(productsTable).insert(product);

  Future<List<ProductsTableData>> getAllProducts() =>
      select(productsTable).get();
  Future<ProductsTableData?> getProductById(int id) {
    return (select(
      productsTable,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<bool> updateProduct(ProductsTableData product) {
    return update(productsTable).replace(product);
  }

  Future<int> deleteProduct(int id) {
    return (delete(productsTable)..where((p) => p.id.equals(id))).go();
  }

  Stream<List<ProductsTableData>> watchProducts() =>
      select(productsTable).watch();
}
