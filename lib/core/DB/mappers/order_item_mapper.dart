import 'package:flutter/widgets.dart';
import '../../../../core/DB/app_database.dart';
import '../../../../core/enums/product_type_enum/product_type_enum.dart';
import '../../../../core/enums/tables_enum/table_type_enum.dart';
import '../../../../features/table_page/domain/entities/order_item_entity.dart';
import '../../../../core/extensions/product_locale_extension.dart';

OrderItemEntity orderItemFromJoin(
  OrderItemsTableData item,
  ProductsTableData product,
  Locale locale,
) {
  return OrderItemEntity(
    id: item.id,
    orderId: item.orderId,
    productId: item.productId,
    quantity: item.quantity,
    price: item.price,
    total: item.total,
    productName: product.localizedName(locale), // ✅ FIXED
    discount: item.discount,
    tableType: TableTypeEnum.values[item.tableType.index],
    tableNumber: item.tableNumber,
    productType: ProductTypeEnum.values[item.productType.index],
    createdAt: item.createdAt,
  );
}
