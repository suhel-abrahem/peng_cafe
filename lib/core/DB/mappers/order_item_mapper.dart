import '../../../../core/DB/app_database.dart';
import '../../../../core/enums/product_type_enum/product_type_enum.dart';
import '../../../../core/enums/tables_enum/table_type_enum.dart';
import '../../../features/table_page/domain/entities/order_item_entity.dart';

OrderItemEntity orderItemFromRow(OrderItemsTableData row) {
  return OrderItemEntity(
    id: row.id,
    orderId: row.orderId,
    productId: row.productId,
    quantity: row.quantity,
    price: row.price,
    total: row.total,
    discount: row.discount,
    tableType: TableTypeEnum.values[row.tableType.index],
    tableNumber: row.tableNumber,
    productType: ProductTypeEnum.values[row.productType.index],
    createdAt: row.createdAt,
  );
}
