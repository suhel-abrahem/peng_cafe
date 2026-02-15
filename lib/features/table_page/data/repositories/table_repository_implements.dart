import 'package:drift/drift.dart';
import 'package:peng_cafe/core/resource/data_state.dart';
import 'package:peng_cafe/features/table_page/data/models/order_item_model.dart';
import 'package:peng_cafe/features/table_page/data/models/order_model.dart';
import 'package:peng_cafe/features/table_page/domain/entities/order_entity.dart';
import 'package:peng_cafe/features/table_page/domain/entities/order_item_entity.dart';

import '../../../../core/DB/app_database.dart';
import '../../../../core/DB/mappers/order_item_mapper.dart';
import '../../../../core/DB/mappers/orders_mapper.dart';
import '../../domain/repositories/table_repository.dart';

class TableRepositoryImplements implements TableRepository {
  final AppDatabase _database;

  TableRepositoryImplements(this._database);

  @override
  Future<DataState<OrderEntity?>> getActiveOrderByTable({
    OrderModel? orderModel,
  }) async {
    try {
      final ordersDao = _database.ordersDao;

      final existing = await ordersDao.getActiveOrderByTable(
        orderModel!.tableNumber,
      );

      if (existing != null) {
        return DataSuccess(data: orderFromRow(existing));
      }

      final orderNumber = 'ORD-${DateTime.now().millisecondsSinceEpoch}';

      await ordersDao.createOrder(
        OrdersTableCompanion(
          orderNumber: Value(orderNumber),
          tableNumber: Value(orderModel.tableNumber),
          price: const Value(0),
          total: const Value(0),
          userId: Value(orderModel.userId),
        ),
      );

      final created = await ordersDao.getOrderByOrderNumber(orderNumber);

      if (created == null) {
        return const DataFailed(error: 'Failed to create order');
      }

      return DataSuccess(data: orderFromRow(created));
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }

  @override
  Future<DataState<OrderItemEntity?>> addItem({
    OrderItemModel? orderModel,
  }) async {
    try {
      final dao = _database.orderItemsDao;

      await dao.addItem(
        OrderItemsTableCompanion(
          orderId: Value(orderModel!.orderId),
          productId: Value(orderModel.productId),
          quantity: Value(orderModel.quantity),
          price: Value(orderModel.price),
          total: Value(orderModel.quantity * orderModel.price),
          tableType: Value(orderModel.tableType),
          tableNumber: Value(orderModel.tableNumber),
          productType: Value(orderModel.productType),
        ),
      );

      final created = await dao.getItem(
        orderId: orderModel.orderId,
        productId: orderModel.productId,
      );

      return DataSuccess(data: orderItemFromRow(created!));
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }

  @override
  Future<DataState<void>> updateItemQuantity({
    required OrderItemModel orderModel,
  }) async {
    try {
      final dao = _database.orderItemsDao;

      if (orderModel.quantity <= 0) {
        await dao.deleteItem(orderModel.id);
        return const DataSuccess(data: null);
      }

      final total = orderModel.quantity * orderModel.price;

      await dao.updateQuantity(
        id: orderModel.id,
        quantity: orderModel.quantity,
        total: total,
      );

      return const DataSuccess(data: null);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }

  @override
  Future<DataState<List<OrderItemEntity>>> getOrderItems({
    required int orderId,
  }) async {
    try {
      final rows = await _database.orderItemsDao.getItemsByOrder(orderId);

      final items = rows.map(orderItemFromRow).toList();
      return DataSuccess(data: items);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }

  @override
  Future<DataState<void>> deleteOrderItem({required int itemId}) async {
    try {
      await _database.orderItemsDao.deleteItem(itemId);
      return const DataSuccess(data: null);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }
}
