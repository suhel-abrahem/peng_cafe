import 'dart:io';
import 'package:drift/drift.dart';

import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';
import 'package:peng_cafe/core/DB/daos/products_dao.dart';
import 'package:peng_cafe/core/DB/daos/users_dao.dart';
import 'package:peng_cafe/core/DB/tables/products_table.dart';
import 'package:peng_cafe/core/DB/tables/order_items_table.dart';
import 'package:peng_cafe/core/DB/tables/orders_table.dart';

import '../enums/order_status_enum/order_status_enum.dart';
import '../enums/order_type_enum/order_type_enum.dart';
import '../enums/product_type_enum/product_type_enum.dart';
import '../enums/tables_enum/table_type_enum.dart';
import '../enums/user_rule_enum.dart';
import '../util/app_directories.dart';
import 'daos/order_items_dao.dart';
import 'daos/orders_dao.dart';
import 'tables/users_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [UsersTable, ProductsTable, OrderItemsTable, OrdersTable],
  daos: [UsersDao, ProductsDao, OrderItemsDao, OrdersDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 2;
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.addColumn(ordersTable, ordersTable.losses);
        await m.addColumn(ordersTable, ordersTable.totalWithLosses);
        await m.addColumn(ordersTable, ordersTable.profit);

        await m.addColumn(orderItemsTable, orderItemsTable.losses);
        await m.addColumn(orderItemsTable, orderItemsTable.totalWithLosses);
        await m.addColumn(orderItemsTable, orderItemsTable.profit);
        await m.addColumn(ordersTable, ordersTable.customerName);
      }
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbDir = await AppDirectories.databaseDir;
    final file = File('${dbDir.path}/bytex_cafe.db');
    return NativeDatabase(file);
  });
}
