import 'package:drift/drift.dart';
import 'package:peng_cafe/core/enums/duration_enum.dart';

import '../../enums/order_status_enum/order_status_enum.dart';
import '../../enums/order_type_enum/order_type_enum.dart';
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

  //get table type from order id
  Future<int?> getTableTypeByOrderId(int orderId) {
    return (select(ordersTable)..where((t) => t.id.equals(orderId)))
        .map((row) => row.tableType.index)
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
  Future<int> closeOrder(
    int orderId, {
    OrderTypeEnum? orderType,
    double? withdrawalAmount,
  }) {
    return (update(ordersTable)..where((t) => t.id.equals(orderId))).write(
      OrdersTableCompanion(
        orderStatus: Value(OrderStatusEnum.completed),
        endAt: Value(DateTime.now()),
        total: orderType == OrderTypeEnum.withdrawal
            ? Value(-withdrawalAmount!)
            : Value.absent(),
      ),
    );
  }

  // reopen order
  Future<int> reopenOrder(int orderId) {
    return (update(ordersTable)..where((t) => t.id.equals(orderId))).write(
      OrdersTableCompanion(
        orderStatus: Value(OrderStatusEnum.inProgress),
        endAt: const Value(null),
      ),
    );
  }

  // get table number from order id
  Future<int?> getTableNumberByOrderId(int orderId) {
    return (select(ordersTable)..where((t) => t.id.equals(orderId)))
        .map((row) => row.tableNumber)
        .getSingleOrNull();
  }

  Future<OrdersTableData?> getOrderByOrderNumber(String orderNumber) {
    return (select(
      ordersTable,
    )..where((t) => t.orderNumber.equals(orderNumber))).getSingleOrNull();
  }

  Expression<bool> _closedOnly(OrdersTable t) {
    return t.orderStatus.equals(OrderStatusEnum.completed.index);
  }

  Future<List<OrdersTableData>> getTodayOrders() {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day);

    return (select(ordersTable)..where(
          (t) => _closedOnly(t) & t.createdAt.isBiggerOrEqualValue(start),
        ))
        .get();
  }

  Future<List<OrdersTableData>> getLastWeekOrders() {
    final start = DateTime.now().subtract(const Duration(days: 7));

    return (select(ordersTable)..where(
          (t) => _closedOnly(t) & t.createdAt.isBiggerOrEqualValue(start),
        ))
        .get();
  }

  Future<List<OrdersTableData>> getLastMonthOrders() {
    final start = DateTime.now().subtract(const Duration(days: 30));

    return (select(ordersTable)..where(
          (t) => _closedOnly(t) & t.createdAt.isBiggerOrEqualValue(start),
        ))
        .get();
  }

  Future<List<OrdersTableData>> getAllOrders() {
    return (select(ordersTable)..where((t) => _closedOnly(t))).get();
  }

  Future<int> deleteOlderOrders(DurationEnum duration) {
    int days;
    switch (duration) {
      case DurationEnum.never:
        days = -1;
        break;
      case DurationEnum.daily:
        days = 1;
        break;
      case DurationEnum.weekly:
        days = 7;
        break;
      case DurationEnum.monthly:
        days = 30;
        break;
      case DurationEnum.twoMonthly:
        days = 60;
        break;
      case DurationEnum.quarterly:
        days = 90;
        break;
      case DurationEnum.halfYearly:
        days = 180;
        break;
      case DurationEnum.yearly:
        days = 365;
        break;
      case DurationEnum.allTime:
        days = -1;
        break;
    }
    if (days == -1) {
      return Future.value(0);
    }
    final limit = DateTime.now().subtract(Duration(days: days));

    return (delete(
      ordersTable,
    )..where((t) => t.createdAt.isSmallerThanValue(limit))).go();
  }

  Future<OrdersTableData?> getOrderById(int orderId) {
    return (select(
      ordersTable,
    )..where((t) => t.id.equals(orderId))).getSingleOrNull();
  }

  double calculateTotal(List<OrdersTableData> orders) {
    double total = 0;

    for (final o in orders) {
      if (OrderTypeEnum.values[o.orderType.index] == OrderTypeEnum.withdrawal) {
        total -= o.total;
      } else {
        total += o.total;
      }
    }

    return total;
  }

  Future<List<OrdersTableData>> getOrdersBetween(DateTime from, DateTime to) {
    return (select(ordersTable)..where(
          (t) =>
              t.createdAt.isBetweenValues(from, to) &
              t.orderStatus.equals(OrderStatusEnum.completed.index),
        ))
        .get();
  }
}
