import 'package:peng_cafe/core/resource/data_state.dart';
import 'package:peng_cafe/core/usecase/usecase.dart';
import 'package:peng_cafe/features/table_page/data/models/order_item_model.dart';
import 'package:peng_cafe/features/table_page/data/models/order_model.dart';

import '../entities/order_entity.dart';
import '../entities/order_item_entity.dart';

abstract class TableRepository {
  Future<DataState<OrderEntity?>> getActiveOrderByTable({
    required OrderModel orderModel,
  });
  Future<DataState<OrderItemEntity?>> addItem({
    required OrderItemModel orderModel,
  });
  Future<DataState<List<OrderItemEntity>>> getOrderItems({
    required GetOrderItemsParams params,
  });
  Future<DataState<void>> updateItemQuantity({
    required OrderItemModel orderModel,
  });
  Future<DataState<void>> deleteOrderItem({required int itemId});
}
