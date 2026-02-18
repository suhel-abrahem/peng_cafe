import 'package:peng_cafe/core/DB/app_database.dart';
import 'package:peng_cafe/core/util/helper/helper.dart';

import '../../../../core/DB/daos/order_items_dao.dart';
import '../../../../core/DB/daos/orders_dao.dart';
import '../../../../core/DB/mappers/order_item_mapper.dart';
import '../../../../core/DB/mappers/orders_mapper.dart';
import '../../../table_page/domain/entities/order_entity.dart';
import '../../../table_page/domain/entities/order_item_entity.dart';
import '../../domain/repositories/orders_repository.dart';
import '../models/orders_section_model.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final AppDatabase _database;
  late OrdersDao ordersDao;
  late OrderItemsDao itemsDao;

  OrdersRepositoryImpl(this._database) {
    ordersDao = _database.ordersDao;
    itemsDao = _database.orderItemsDao;
  }

  @override
  Future<OrderEntity?> getOrder(int orderId) async {
    final row = await ordersDao.getOrderById(orderId);
    return row == null ? null : orderFromRow(row);
  }

  @override
  Future<List<OrderItemEntity>> getOrderItems({
    required int orderId,
    required String locale,
  }) async {
    final rows = await itemsDao.getItemsWithProduct(orderId);

    return rows.map((r) {
      return orderItemFromJoin(r.$1, r.$2, Helper.getLocaleByCode(locale));
    }).toList();
  }

  @override
  Future<List<OrdersSection>> getOrdersSummary() async {
    // تنظيف قديم
    await ordersDao.deleteOrdersOlderThan60Days();

    final today = await ordersDao.getTodayOrders();
    final week = await ordersDao.getLastWeekOrders();
    final month = await ordersDao.getLastMonthOrders();

    return [
      OrdersSection(
        title: 'Today',
        orders: today.map(orderFromRow).toList(),
        total: ordersDao.calculateTotal(today),
      ),
      OrdersSection(
        title: 'Last Week',
        orders: week.map(orderFromRow).toList(),
        total: ordersDao.calculateTotal(week),
      ),
      OrdersSection(
        title: 'Last Month',
        orders: month.map(orderFromRow).toList(),
        total: ordersDao.calculateTotal(month),
      ),
    ];
  }
}
