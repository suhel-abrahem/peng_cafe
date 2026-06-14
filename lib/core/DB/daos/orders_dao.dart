import 'package:drift/drift.dart';
import 'package:peng_cafe/core/enums/duration_enum.dart';

import '../../enums/order_status_enum/order_status_enum.dart';
import '../../enums/order_type_enum/order_type_enum.dart';
import '../../enums/tables_enum/table_type_enum.dart';
import '../app_database.dart';
import '../tables/order_items_table.dart';
import '../tables/orders_table.dart';

part 'orders_dao.g.dart';

@DriftAccessor(tables: [OrdersTable, OrderItemsTable])
class OrdersDao extends DatabaseAccessor<AppDatabase> with _$OrdersDaoMixin {
  OrdersDao(super.db);

  // Create new order
  Future<int> createOrder(OrdersTableCompanion order) {
    return into(ordersTable).insert(order);
  }

  // Update client/customer name
  Future<int> updateCustomerName({
    required int orderId,
    required String? customerName,
  }) {
    return (update(ordersTable)..where((t) => t.id.equals(orderId))).write(
      OrdersTableCompanion(customerName: Value(customerName)),
    );
  }

  // Get active order by table number
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

  // Get table type from order id
  Future<int?> getTableTypeByOrderId(int orderId) {
    return (select(ordersTable)..where((t) => t.id.equals(orderId)))
        .map((row) => row.tableType.index)
        .getSingleOrNull();
  }


  // Update totals
  Future<int> updateOrderTotals({
    required int orderId,
    required double price,
    double? discount,
    required double total,
    required double losses,
    required double profit,
    required double totalWithLosses,
  }) {
    return (update(ordersTable)..where((t) => t.id.equals(orderId))).write(
      OrdersTableCompanion(
        price: Value(price),
        discount: Value(discount),
        total: Value(total),
        losses: Value(losses),
        profit: Value(profit),
        totalWithLosses: Value(totalWithLosses),
      ),
    );
  }

  // Recalculate order totals from order items
  Future<int> recalculateOrderTotals(int orderId) async {
    final items = await (select(
      attachedDatabase.orderItemsTable,
    )..where((t) => t.orderId.equals(orderId))).get();

    if (items.isEmpty) {
      return (update(ordersTable)..where((t) => t.id.equals(orderId))).write(
        const OrdersTableCompanion(
          price: Value(0),
          discount: Value(null),
          total: Value(0),
          losses: Value(0),
          profit: Value(0),
          totalWithLosses: Value(0),
        ),
      );
    }

    final price = items.fold<double>(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    final total = items.fold<double>(0, (sum, item) => sum + item.total);

    final losses = items.fold<double>(0, (sum, item) => sum + item.losses);

    final profit = items.fold<double>(0, (sum, item) => sum + item.profit);

    final totalWithLosses = items.fold<double>(
      0,
      (sum, item) => sum + item.totalWithLosses,
    );

    return updateOrderTotals(
      orderId: orderId,
      price: price,
      discount: null,
      total: total,
      losses: losses,
      profit: profit,
      totalWithLosses: totalWithLosses,
    );
  }

  // Close order
  Future<int> closeOrder(
    int orderId, {
    OrderTypeEnum? orderType,
    double? withdrawalAmount,
    String? customerName,
  }) {
    final isWithdrawal = orderType == OrderTypeEnum.withdrawal;
    final amount = withdrawalAmount ?? 0;

    return (update(ordersTable)..where((t) => t.id.equals(orderId))).write(
      OrdersTableCompanion(
        orderStatus: Value(OrderStatusEnum.completed),
        endAt: Value(DateTime.now()),
        orderType: orderType != null ? Value(orderType) : const Value.absent(),
        customerName: customerName != null
            ? Value(customerName)
            : const Value.absent(),

        // Withdrawal is stored as negative value.
        total: isWithdrawal ? Value(-amount) : const Value.absent(),
        totalWithLosses: isWithdrawal ? Value(-amount) : const Value.absent(),

        // Withdrawal is not normal profit/loss.
        profit: isWithdrawal ? const Value(0) : const Value.absent(),
        losses: isWithdrawal ? const Value(0) : const Value.absent(),
      ),
    );
  }

  // Reopen order
  Future<int> reopenOrder(int orderId) {
    return (update(ordersTable)..where((t) => t.id.equals(orderId))).write(
      OrdersTableCompanion(
        orderStatus: Value(OrderStatusEnum.inProgress),
        endAt: const Value(null),
      ),
    );
  }

  // Get table number from order id
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

  Future<OrdersTableData?> getOrderById(int orderId) {
    return (select(
      ordersTable,
    )..where((t) => t.id.equals(orderId))).getSingleOrNull();
  }

  Expression<bool> _closedOnly(OrdersTable t) {
    return t.orderStatus.equals(OrderStatusEnum.completed.index);
  }

  DateTime _startOfMonth({required int year, required int month}) {
    return DateTime(year, month, 1);
  }

  DateTime _startOfNextMonth({required int year, required int month}) {
    if (month == 12) {
      return DateTime(year + 1, 1, 1);
    }

    return DateTime(year, month + 1, 1);
  }

  DateTime _startOfYear(int year) {
    return DateTime(year, 1, 1);
  }

  DateTime _startOfNextYear(int year) {
    return DateTime(year + 1, 1, 1);
  }

  // Today closed orders
  Future<List<OrdersTableData>> getTodayOrders() {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day);
    final end = start.add(const Duration(days: 1));

    return (select(ordersTable)..where(
          (t) =>
              _closedOnly(t) &
              t.createdAt.isBiggerOrEqualValue(start) &
              t.createdAt.isSmallerThanValue(end),
        ))
        .get();
  }

  // Last 7 days closed orders
  Future<List<OrdersTableData>> getLastWeekOrders() {
    final start = DateTime.now().subtract(const Duration(days: 7));

    return (select(ordersTable)..where(
          (t) => _closedOnly(t) & t.createdAt.isBiggerOrEqualValue(start),
        ))
        .get();
  }

  // Last 30 days closed orders
  Future<List<OrdersTableData>> getLastMonthOrders() {
    final start = DateTime.now().subtract(const Duration(days: 30));

    return (select(ordersTable)..where(
          (t) => _closedOnly(t) & t.createdAt.isBiggerOrEqualValue(start),
        ))
        .get();
  }

  // All closed orders, with optional year/month filter
  Future<List<OrdersTableData>> getAllOrders({int? year, int? month}) {
    final query = select(ordersTable)
      ..where((t) {
        Expression<bool> expression = _closedOnly(t);

        if (year != null && month != null) {
          final start = _startOfMonth(year: year, month: month);
          final end = _startOfNextMonth(year: year, month: month);

          expression =
              expression &
              t.createdAt.isBiggerOrEqualValue(start) &
              t.createdAt.isSmallerThanValue(end);
        } else if (year != null) {
          final start = _startOfYear(year);
          final end = _startOfNextYear(year);

          expression =
              expression &
              t.createdAt.isBiggerOrEqualValue(start) &
              t.createdAt.isSmallerThanValue(end);
        }

        return expression;
      })
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);

    return query.get();
  }

  // Orders between two dates
  Future<List<OrdersTableData>> getOrdersBetween(DateTime from, DateTime to) {
    return (select(ordersTable)
          ..where(
            (t) =>
                _closedOnly(t) &
                t.createdAt.isBiggerOrEqualValue(from) &
                t.createdAt.isSmallerThanValue(to),
          )
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();
  }

  // Orders by client/customer name
  Future<List<OrdersTableData>> getOrdersByCustomerName(String customerName) {
    return (select(ordersTable)
          ..where(
            (t) => _closedOnly(t) & t.customerName.like('%$customerName%'),
          )
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();
  }

  Future<int> deleteOrderById(int id) {
    return (delete(ordersTable)..where((t) => t.id.equals(id))).go();
  }

  Future<int> deleteOlderOrders(DurationEnum duration) async {
    int days;

    switch (duration) {
      case DurationEnum.never:
      case DurationEnum.allTime:
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
    }

    if (days == -1) return 0;

    final limit = DateTime.now().subtract(Duration(days: days));

    return (delete(
      ordersTable,
    )..where((t) => t.createdAt.isSmallerThanValue(limit))).go();
  }

  // Calculate total money from list of orders
  double calculateTotal(List<OrdersTableData> orders) {
    return orders.fold<double>(0, (sum, order) => sum + order.total);
  }

  // Calculate profit from list of orders
  double calculateProfitTotal(List<OrdersTableData> orders) {
    return orders.fold<double>(0, (sum, order) => sum + order.profit);
  }

  // Calculate losses from list of orders
  double calculateLossesTotal(List<OrdersTableData> orders) {
    return orders.fold<double>(0, (sum, order) => sum + order.losses);
  }

  // Calculate total with losses from list of orders
  double calculateTotalWithLosses(List<OrdersTableData> orders) {
    return orders.fold<double>(0, (sum, order) => sum + order.totalWithLosses);
  }

  // Optional: calculate all summary values in one place
  OrdersSummary calculateOrdersSummary(List<OrdersTableData> orders) {
    return OrdersSummary(
      total: calculateTotal(orders),
      profit: calculateProfitTotal(orders),
      losses: calculateLossesTotal(orders),
      totalWithLosses: calculateTotalWithLosses(orders),
      count: orders.length,
    );
  }
}

class OrdersSummary {
  final double total;
  final double profit;
  final double losses;
  final double totalWithLosses;
  final int count;

  const OrdersSummary({
    required this.total,
    required this.profit,
    required this.losses,
    required this.totalWithLosses,
    required this.count,
  });
}
