import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/order_items_table.dart';
import '../tables/products_table.dart';

part 'order_items_dao.g.dart';

@DriftAccessor(tables: [OrderItemsTable, ProductsTable])
class OrderItemsDao extends DatabaseAccessor<AppDatabase>
    with _$OrderItemsDaoMixin {
  OrderItemsDao(super.db);

  // 🔹 Add item
  Future<int> addItem(OrderItemsTableCompanion item) {
    return into(orderItemsTable).insert(item);
  }

  // 🔹 Get single item by order + product
  Future<OrderItemsTableData?> getItem({
    required int orderId,
    required int productId,
  }) {
    return (select(orderItemsTable)..where(
          (t) => t.orderId.equals(orderId) & t.productId.equals(productId),
        ))
        .getSingleOrNull();
  }

  // 🔹 Update quantity & total
  Future<int> updateQuantity({
    required int id,
    required double quantity,
    required double total,
  }) {
    return (update(orderItemsTable)..where((t) => t.id.equals(id))).write(
      OrderItemsTableCompanion(quantity: Value(quantity), total: Value(total)),
    );
  }

  // 🔹 Delete item
  Future<int> deleteItem(int id) {
    return (delete(orderItemsTable)..where((t) => t.id.equals(id))).go();
  }

  // 🔥 Get items with product (JOIN)
  Future<List<(OrderItemsTableData, ProductsTableData)>> getItemsWithProduct(
    int orderId,
  ) async {
    final query = select(orderItemsTable).join([
      innerJoin(
        productsTable,
        productsTable.id.equalsExp(orderItemsTable.productId),
      ),
    ])..where(orderItemsTable.orderId.equals(orderId));

    final rows = await query.get();

    return rows.map((row) {
      final orderItem = row.readTable(orderItemsTable);
      final product = row.readTable(productsTable);
      return (orderItem, product);
    }).toList();
  }

  // 🔹 Get items without join (simple)
  Future<List<OrderItemsTableData>> getItemsByOrder(int orderId) {
    return (select(
      orderItemsTable,
    )..where((t) => t.orderId.equals(orderId))).get();
  }
}
