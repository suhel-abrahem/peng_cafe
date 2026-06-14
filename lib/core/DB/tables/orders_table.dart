import 'package:drift/drift.dart';

import '../../enums/order_status_enum/order_status_enum.dart';
import '../../enums/order_type_enum/order_type_enum.dart';
import '../../enums/tables_enum/table_type_enum.dart';
import 'users_table.dart';

class OrdersTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get orderNumber => text().unique()();
  TextColumn get customerName => text().nullable()();
  IntColumn get tableNumber => integer()();
  RealColumn get price => real()();
  RealColumn get discount => real().nullable()();
  RealColumn get total => real()();
  RealColumn get losses => real().withDefault(const Constant(0))();
  RealColumn get profit => real().withDefault(const Constant(0))();
  RealColumn get totalWithLosses => real().withDefault(const Constant(0))();
  IntColumn get tableType => intEnum<TableTypeEnum>()();

  IntColumn get orderType => intEnum<OrderTypeEnum>().withDefault(
    Constant(OrderTypeEnum.dineIn.index),
  )();
  IntColumn get orderStatus => intEnum<OrderStatusEnum>().withDefault(
    Constant(OrderStatusEnum.inProgress.index),
  )();
  IntColumn get userId =>
      integer().customConstraint('NOT NULL REFERENCES users(id)')();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get endAt => dateTime().nullable()();
}
