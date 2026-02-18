import '../../../table_page/domain/entities/order_entity.dart';
import '../../../table_page/domain/entities/order_item_entity.dart';
import '../../data/models/orders_section_model.dart';

abstract class OrdersRepository {
  Future<OrderEntity?> getOrder(int orderId);
  Future<List<OrderItemEntity>> getOrderItems({
    required int orderId,
    required String locale,
  });
  Future<List<OrdersSection>> getOrdersSummary();
}
