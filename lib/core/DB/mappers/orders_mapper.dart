import '../../../features/table_page/domain/entities/order_entity.dart';
import '../../enums/order_status_enum/order_status_enum.dart';
import '../app_database.dart';

OrderEntity orderFromRow(OrdersTableData row) {
  return OrderEntity(
    id: row.id,
    orderNumber: row.orderNumber,
    tableNumber: row.tableNumber,
    status: row.orderStatus,
    total: row.total,
    createdAt: row.createdAt,
  );
}
