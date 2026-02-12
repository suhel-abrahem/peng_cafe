import 'dart:io';
import 'package:drift/drift.dart';

import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';
import 'package:peng_cafe/core/DB/daos/products_dao.dart';
import 'package:peng_cafe/core/DB/daos/users_dao.dart';
import 'package:peng_cafe/core/DB/tables/products_table.dart';

import '../util/app_directories.dart';
import 'tables/users_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [UsersTable, ProductsTable],
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
