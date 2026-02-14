import 'dart:ffi';

import 'package:drift/drift.dart';
import 'package:peng_cafe/core/enums/product_type_enum/product_type_enum.dart';
import 'package:peng_cafe/core/enums/tables_enum/table_type_enum.dart';

import '../../enums/order_type_enum/order_type_enum.dart';

class OrderItemsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get orderId =>
      integer().customConstraint('REFERENCES orders(id)')();
  IntColumn get productId =>
      integer().customConstraint('REFERENCES products(id)')();
  RealColumn get quantity => real().withDefault(const Constant(1))();
  IntColumn get tableType =>
      intEnum<TableType>().withDefault(Constant(TableType.cafe.index))();
  IntColumn get tableNumber => integer()();
  RealColumn get price => real()();
  RealColumn get discount => real().nullable()();
  RealColumn get total => real()();
  IntColumn get orderType => intEnum<OrderTypeEnum>().withDefault(
    Constant(OrderTypeEnum.dineIn.index),
  )();
  IntColumn get productType => intEnum<ProductTypeEnum>().withDefault(
    Constant(ProductTypeEnum.foodAndBeverage.index),
  )();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
