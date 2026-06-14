import 'package:drift/drift.dart';

import '../../enums/tables_enum/table_type_enum.dart';
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

  // 🔹 Get single item by order + product + tableType
  Future<OrderItemsTableData?> getItemByOrderAndProduct({
    required int orderId,
    required int productId,
    required TableTypeEnum tableType,
  }) {
    return (select(orderItemsTable)..where(
          (t) =>
              t.orderId.equals(orderId) &
              t.productId.equals(productId) &
              t.tableType.equals(tableType.index),
        ))
        .getSingleOrNull();
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

  double calculateTotal({required double price, required double quantity}) {
    return price * quantity;
  }

  double calculateDiscountAmount({
    required double total,
    required double discount,
  }) {
    return total * discount;
  }

  double calculateTotalAfterDiscount({
    required double total,
    required double discount,
  }) {
    return total - calculateDiscountAmount(total: total, discount: discount);
  }

  double calculateProfit({
    required double price,
    required double costPrice,
    required double quantity,
    required double discount,
  }) {
    final total = calculateTotal(price: price, quantity: quantity);

    final totalAfterDiscount = calculateTotalAfterDiscount(
      total: total,
      discount: discount,
    );

    final cost = costPrice * quantity;

    return totalAfterDiscount - cost;
  }

  double calculateLosses({required double profit}) {
    if (profit >= 0) return 0;
    return profit.abs();
  }

  // 🔹 Update quantity & total
  Future<int> updateQuantity({
    required int id,
    required double quantity,
  }) async {
    final item = await (select(
      orderItemsTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();

    if (item == null) return 0;

    final product = await (select(
      productsTable,
    )..where((t) => t.id.equals(item.productId))).getSingleOrNull();

    if (product == null) return 0;

    final discount = item.discount ?? 0;
    final costPrice = product.costPrice ?? 0;

    final total = calculateTotal(price: product.price, quantity: quantity);

    final totalAfterDiscount = calculateTotalAfterDiscount(
      total: total,
      discount: discount,
    );

    final profit = calculateProfit(
      price: product.price,
      costPrice: costPrice,
      quantity: quantity,
      discount: discount,
    );

    final losses = calculateLosses(profit: profit);

    return (update(orderItemsTable)..where((t) => t.id.equals(id))).write(
      OrderItemsTableCompanion(
        quantity: Value(quantity),
        total: Value(total),
        losses: Value(losses),
        profit: Value(profit),
        totalWithLosses: Value(totalAfterDiscount),
      ),
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
