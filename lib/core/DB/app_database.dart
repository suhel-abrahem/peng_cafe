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
import 'tables/users_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [UsersTable, ProductsTable, OrderItemsTable, OrdersTable],
  daos: [UsersDao, ProductsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbDir = await AppDirectories.databaseDir;
    final file = File('${dbDir.path}/bytex_cafe.db');
    return NativeDatabase(file);
  });
}
