import 'package:drift/drift.dart';
import 'package:peng_cafe/core/resource/data_state.dart';
import 'package:peng_cafe/core/usecase/usecase.dart';
import 'package:peng_cafe/core/util/helper/helper.dart';
import 'package:peng_cafe/features/table_page/data/models/order_item_model.dart';
import 'package:peng_cafe/features/table_page/data/models/order_model.dart';
import 'package:peng_cafe/features/table_page/domain/entities/order_entity.dart';
import 'package:peng_cafe/features/table_page/domain/entities/order_item_entity.dart';

import '../../../../core/DB/app_database.dart';
import '../../../../core/DB/mappers/order_item_mapper.dart';
import '../../../../core/DB/mappers/orders_mapper.dart';
import '../../../../core/enums/order_status_enum/order_status_enum.dart';
import '../../../../core/enums/order_type_enum/order_type_enum.dart';
import '../../domain/repositories/table_repository.dart';

class TableRepositoryImplements implements TableRepository {
  final AppDatabase _database;

  TableRepositoryImplements(this._database);

  // =========================
  // 1) GET OR CREATE ORDER
  // =========================
  @override
  Future<DataState<OrderEntity?>> getActiveOrderByTable({
    required OrderModel orderModel,
  }) async {
    try {
      final ordersDao = _database.ordersDao;

      final existing = await ordersDao.getActiveOrderByTable(
        tableNumber: orderModel.tableNumber,
        tableType: orderModel.tableType,
      );

      if (existing != null &&
          orderModel.orderType != OrderTypeEnum.withdrawal) {
        print(
          'Found existing active order ${existing.id} for table ${orderModel.tableNumber} and type ${orderModel.orderType}',
        );
        return DataSuccess(data: orderFromRow(existing));
      }
      print(
        'No active order found, creating new one for table ${orderModel.tableNumber} and type ${orderModel.tableType}',
      );
      final orderNumber = 'ORD-${DateTime.now().millisecondsSinceEpoch}';

      await ordersDao.createOrder(
        OrdersTableCompanion(
          orderNumber: Value(orderNumber),
          tableNumber: Value(orderModel.tableNumber),
          tableType: Value(orderModel.tableType), // ✅ important
          price: const Value(0),
          total: const Value(0),
          userId: Value(orderModel.userId),
          orderType: Value(orderModel.orderType ?? OrderTypeEnum.dineIn),
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

  // =========================
  // 2) ADD ITEM (OR INCREASE)
  // =========================
  @override
  Future<DataState<OrderItemEntity?>> addItem({
    required OrderItemModel orderModel,
  }) async {
    try {
      final dao = _database.orderItemsDao;

      // ✅ prevent duplicates (order + product + tableType)
      final existing = await dao.getItemByOrderAndProduct(
        orderId: orderModel.orderId,
        productId: orderModel.productId,
        tableType: orderModel.tableType,
      );

      if (existing != null) {
        final newQty = existing.quantity + 1;
        final newTotal = newQty * existing.price;

        await dao.updateQuantity(
          id: existing.id,
          quantity: newQty,
          total: newTotal,
        );

        // ✅ return updated with product name (JOIN)
        final rows = await dao.getItemsWithProduct(orderModel.orderId);
        final updated = rows.firstWhere((r) => r.$1.id == existing.id);

        return DataSuccess(
          data: orderItemFromJoin(
            updated.$1,
            updated.$2,
            Helper.getLocaleByCode(orderModel.locale),
          ),
        );
      }

      // ✅ insert new item with quantity=1 always
      await dao.addItem(
        OrderItemsTableCompanion(
          orderId: Value(orderModel.orderId),
          productId: Value(orderModel.productId),
          quantity: const Value(1),
          price: Value(orderModel.price),
          total: Value(orderModel.price),
          tableType: Value(orderModel.tableType),
          tableNumber: Value(orderModel.tableNumber),
          productType: Value(orderModel.productType),
        ),
      );

      // ✅ fetch created with product name (JOIN)
      final rows = await dao.getItemsWithProduct(orderModel.orderId);
      final created = rows.firstWhere(
        (r) =>
            r.$1.productId == orderModel.productId &&
            r.$1.tableType == orderModel.tableType.index,
      );

      return DataSuccess(
        data: orderItemFromJoin(
          created.$1,
          created.$2,
          Helper.getLocaleByCode(orderModel.locale),
        ),
      );
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }

  // =========================
  // 3) GET ORDER ITEMS (WITH PRODUCT NAMES)
  // =========================
  @override
  Future<DataState<List<OrderItemEntity>>> getOrderItems({
    required GetOrderItemsParams params,
  }) async {
    try {
      final rows = await _database.orderItemsDao.getItemsWithProduct(
        params.orderId,
      );

      final items = rows
          .map(
            (row) => orderItemFromJoin(
              row.$1,
              row.$2,
              Helper.getLocaleByCode(params.locale),
            ),
          )
          .toList();

      return DataSuccess(data: items);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }

  // =========================
  // 4) UPDATE ITEM QUANTITY (MANUAL INPUT)
  // =========================
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
      if (orderModel.id == null) {
        return const DataFailed(
          error: 'Item ID is required for quantity update',
        );
      }
      await dao.updateQuantity(
        id: orderModel.id ?? 0,
        quantity: orderModel.quantity,
        total: total,
      );

      return const DataSuccess(data: null);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }

  // =========================
  // 5) DELETE ORDER ITEM
  // =========================
  @override
  Future<DataState<void>> deleteOrderItem({required int itemId}) async {
    try {
      await _database.orderItemsDao.deleteItem(itemId);
      return const DataSuccess(data: null);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }

  @override
  Future<DataState<void>> closeOrder({
    required int orderId,
    required double paidAmount,
    required double remaining,
  }) async {
    try {
      print(
        'Closing order $orderId with paidAmount=$paidAmount and remaining=$remaining',
      );
      final ordersDao = _database.ordersDao;
      final itemsDao = _database.orderItemsDao;

      // 1️⃣ get all items
      final items = await itemsDao.getItemsByOrder(orderId);
      OrderTypeEnum? orderType;
      await ordersDao.getOrderById(orderId).then((onValue) {
        orderType = onValue?.orderType;
      });
      if (items.isEmpty && orderType != OrderTypeEnum.withdrawal) {
        return const DataFailed(error: 'Order has no items');
      }

      // 2️⃣ calculate totals
      double price = 0;
      double discount = 0;
      if (orderType == OrderTypeEnum.withdrawal) {
        price = paidAmount;
      } else {
        for (final item in items) {
          price += item.total;
          discount += item.discount ?? 0;
        }
      }

      final total = price - discount;

      // 3️⃣ update order totals
      await ordersDao.updateOrderTotals(
        orderId: orderId,
        price: price,
        discount: discount,
        total: total,
      );
      await ordersDao.closeOrder(orderId);
      // 4️⃣ 🔥 decrease product quantities
      for (final item in items) {
        print(
          'Decreasing product ${item.productId} by quantity ${item.quantity}',
        );
        await _database.productsDao.decreaseProductQuantity(
          productId: item.productId,
          quantity: item.quantity,
        );
      }
      // 4️⃣ close order

      // ⛔️ optional (later):
      // save payment log (paidAmount / remaining)

      return const DataSuccess(data: null);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }
}
