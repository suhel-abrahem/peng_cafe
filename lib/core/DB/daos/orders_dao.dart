import 'package:drift/drift.dart';
import '../../enums/order_status_enum/order_status_enum.dart';
import '../../enums/tables_enum/table_type_enum.dart';
import '../app_database.dart';
import '../tables/orders_table.dart';

part 'orders_dao.g.dart';

@DriftAccessor(tables: [OrdersTable])
class OrdersDao extends DatabaseAccessor<AppDatabase> with _$OrdersDaoMixin {
  OrdersDao(super.db);

  //  Create new order
  Future<int> createOrder(OrdersTableCompanion order) {
    return into(ordersTable).insert(order);
  }

  //  Get active order by table number
  Future<OrdersTableData?> getActiveOrderByTable({
    required int tableNumber,
    required TableTypeEnum tableType,
  }) {
    return (select(ordersTable)..where(
          (t) =>
              t.tableNumber.equals(tableNumber) &
              t.tableType.equals(tableType.index) &
              t.orderStatus.equals(OrderStatusEnum.inProgress.index),
        ))
        .getSingleOrNull();
  }

  //  Update totals
  Future<int> updateOrderTotals({
    required int orderId,
    required double price,
    double? discount,
    required double total,
  }) {
    return (update(ordersTable)..where((t) => t.id.equals(orderId))).write(
      OrdersTableCompanion(
        price: Value(price),
        discount: Value(discount),
        total: Value(total),
      ),
    );
  }

  //  Close order
  Future<int> closeOrder(int orderId) {
    return (update(ordersTable)..where((t) => t.id.equals(orderId))).write(
      OrdersTableCompanion(
        orderStatus: Value(OrderStatusEnum.completed),
        endAt: Value(DateTime.now()),
      ),
    );
  }

  Future<OrdersTableData?> getOrderByOrderNumber(String orderNumber) {
    return (select(
      ordersTable,
    )..where((t) => t.orderNumber.equals(orderNumber))).getSingleOrNull();
  }
}
