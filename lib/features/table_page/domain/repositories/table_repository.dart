import 'package:peng_cafe/core/resource/data_state.dart';
import 'package:peng_cafe/features/table_page/data/models/order_item_model.dart';
import 'package:peng_cafe/features/table_page/data/models/order_model.dart';

import '../entities/order_entity.dart';
import '../entities/order_item_entity.dart';

abstract class TableRepository {
  Future<DataState<OrderEntity?>> getActiveOrderByTable({
    OrderModel? orderModel,
  });
  Future<DataState<OrderItemEntity?>> addItem({OrderItemModel? orderModel});
  Future<DataState<List<OrderItemEntity>>> getOrderItems({
    required int orderId,
  });
  Future<DataState<void>> updateItemQuantity({
    required OrderItemModel orderModel,
  });
  Future<DataState<void>> deleteOrderItem({required int itemId});
}
