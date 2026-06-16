import '../../../../core/enums/duration_enum.dart';
import '../../../../core/resource/data_state.dart';
import '../../../table_page/domain/entities/order_entity.dart';
import '../../../table_page/domain/entities/order_item_entity.dart';
import '../../data/models/orders_section_model.dart';

abstract class OrdersRepository {
  Future<DataState<OrderEntity?>> getOrder(int orderId);
  Future<DataState<List<OrderItemEntity>>> getOrderItems({
    required int orderId,
    required String locale,
  });
  Future<DataState<OrdersSection>> getOrdersSummary({
    required DurationEnum duration,
  });
  Future<DataState<void>> deleteOrderById(int orderId);
}
