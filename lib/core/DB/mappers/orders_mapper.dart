import '../../../features/table_page/domain/entities/order_entity.dart';
import '../../enums/order_status_enum/order_status_enum.dart';
import '../../enums/order_type_enum/order_type_enum.dart';
import '../../enums/tables_enum/table_type_enum.dart';
import '../app_database.dart';

OrderEntity orderFromRow(OrdersTableData row) {
  return OrderEntity(
    id: row.id,
    orderNumber: row.orderNumber,
    tableNumber: row.tableNumber,
    status: row.orderStatus,
    total: row.total,
    customerName: row.customerName,
    losses: row.losses,
    discount: row.discount ?? 0.0,
    profit: row.profit,
    createdAt: row.createdAt,
    netTotal: row.totalAfterDiscount,
    totalAfterLosses: row.totalWithLosses,
    tableType: TableTypeEnum.values[row.tableType.index],
    orderType: OrderTypeEnum.values[row.orderType.index],
  );
}
