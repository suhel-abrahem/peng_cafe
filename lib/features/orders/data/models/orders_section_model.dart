import 'package:peng_cafe/core/enums/order_type_enum/order_type_enum.dart';

import '../../../table_page/domain/entities/order_entity.dart';

class OrdersSection {
  final String title;
  final List<OrderEntity> orders;
  final double total;
  final double profit;
  final double loss;
  final double netTotal;
  final 

  OrdersSection({
    required this.title,
    required this.orders,
    required this.total,
    required this.profit,
    required this.loss,
    required this.netTotal,
  });
}
