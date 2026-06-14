import 'package:peng_cafe/core/DB/app_database.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/util/helper/helper.dart';

import '../../../../config/app/app_preferences.dart';
import '../../../../core/DB/daos/order_items_dao.dart';
import '../../../../core/DB/daos/orders_dao.dart';
import '../../../../core/DB/mappers/order_item_mapper.dart';
import '../../../../core/DB/mappers/orders_mapper.dart';
import '../../../../core/enums/duration_enum.dart';
import '../../../../core/resource/data_state.dart';
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
  Future<DataState<OrderEntity?>> getOrder(int orderId) async {
    final row = await ordersDao.getOrderById(orderId);
    return row == null
        ? NoDataDataState()
        : DataSuccess(data: orderFromRow(row));
  }

  @override
  Future<DataState<List<OrderItemEntity>>> getOrderItems({
    required int orderId,
    required String locale,
  }) async {
    final rows = await itemsDao.getItemsWithProduct(orderId);

    return DataSuccess(
      data: rows.map((r) {
        return orderItemFromJoin(r.$1, r.$2, Helper.getLocaleByCode(locale));
      }).toList(),
    );
  }

  @override
  Future<DataState<List<OrdersSection>>> getOrdersSummary({
    required DurationEnum duration,
  }) async {
    try {
      final DurationEnum durationToDeleteOrders =
          getItInstance<AppPreferences>().getDurationToDeleteOrders();
      await ordersDao.deleteOlderOrders(durationToDeleteOrders);
      List<OrdersTableData> orders = [];
      if (duration == DurationEnum.never) {
        orders = [];
      } else if (duration == DurationEnum.daily) {
        print('Getting daily orders');
        orders = await ordersDao.getTodayOrders();
      } else if (duration == DurationEnum.weekly) {
        print('Getting weekly orders');
        orders = await ordersDao.getLastWeekOrders();
      } else if (duration == DurationEnum.monthly) {
        print('Getting monthly orders');
        orders = await ordersDao.getLastMonthOrders();
      } else {
        print("Getting all orders");
        orders = await ordersDao.getAllOrders();
      }

      return DataSuccess(
        data: [
          OrdersSection(
            title: duration.displayName,
            orders: orders.map(orderFromRow).toList(),
            total: ordersDao.calculateTotal(orders),
            profit: ordersDao.calculateProfitTotal(orders),
            loss: ordersDao.calculateLossesTotal(orders),
            netTotal: ordersDao.calculateTotalWithLosses(orders),
          ),
        ],
      );
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }

  @override
  Future<DataState<void>> deleteOrderById(int orderId) async {
    try {
      if (orderId.isNaN) {
        return DataFailed(error: "id cant be nan");
      }
      await ordersDao.deleteOrderById(orderId);
      return DataSuccess();
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }
}
