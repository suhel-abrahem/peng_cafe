import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/products_table.dart';

part 'products_dao.g.dart';

@DriftAccessor(tables: [ProductsTable])
class ProductsDao extends DatabaseAccessor<AppDatabase>
    with _$ProductsDaoMixin {
  ProductsDao(super.db);

  //Insert

  Future<int> insertProduct(ProductsTableCompanion companion) {
    return into(productsTable).insert(companion);
  }

  // Check if a product with the same name exists
  Future<bool> productNameExists({
    required String nameAr,
    String? nameEn,
    String? nameKu,
  }) async {
    final query = select(productsTable)
      ..where(
        (tbl) =>
            tbl.nameAr.equals(nameAr) |
            ((nameEn != null && nameEn.isNotEmpty)
                ? tbl.nameEn.equals(nameEn)
                : const Constant(false)) |
            ((nameKu != null && nameKu.isNotEmpty)
                ? tbl.nameKu.equals(nameKu)
                : const Constant(false)),
      );

    final result = await query.get();
    return result.isNotEmpty;
  }

  // READ

  Future<List<ProductsTableData>> getAllProducts() {
    return select(productsTable).get();
  }

  Stream<List<ProductsTableData>> watchAllProducts() {
    return (select(
      productsTable,
    )..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).watch();
  }

  Future<ProductsTableData?> getProductById(int id) {
    return (select(
      productsTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  // UPDATE

  Future<bool> updateProduct(ProductsTableData product) {
    return update(productsTable).replace(product);
  }

  // DELETE

  Future<int> deleteProduct(int id) {
    return (delete(productsTable)..where((t) => t.id.equals(id))).go();
  }

  // Batch delete selected products
  Future<int> deleteProducts(List<int> ids) {
    return (delete(productsTable)..where((t) => t.id.isIn(ids))).go();
  }

  // Delete all products (for testing or reset)
  Future<int> deleteAllProducts() {
    return (delete(productsTable)).go();
  }

  // delete all with out excluded ids
  Future<int> deleteProductsExcludingIds(List<int> excludedIds) {
    return (delete(
      productsTable,
    )..where((t) => t.id.isNotIn(excludedIds))).go();
  }

  Future<List<ProductsTableData>> searchProductsByName(String query) {
    return (select(productsTable)..where(
          (t) =>
              t.nameAr.contains(query) |
              t.nameEn.contains(query) |
              t.nameKu.contains(query),
        ))
        .get();
  }

  Future<void> decreaseProductQuantity({
    required int productId,
    required double quantity,
  }) async {
    final product = await getProductById(productId);
    if (product == null) return;

    final newQty = (product.quantity ?? 0) - quantity;

    await (update(productsTable)..where((t) => t.id.equals(productId))).write(
      ProductsTableCompanion(quantity: Value(newQty < 0 ? 0 : newQty)),
    );
  }
}
