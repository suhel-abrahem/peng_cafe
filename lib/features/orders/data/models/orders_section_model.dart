import '../../../table_page/domain/entities/order_entity.dart';

class OrdersSection {
  final String title;
  final List<OrderEntity> orders;
  final double total;
  final double profit;
  final double loss;
  final double netTotal;

  OrdersSection({
    required this.title,
    required this.orders,
    required this.total,
    required this.profit,
    required this.loss,
    required this.netTotal,
  });
}
