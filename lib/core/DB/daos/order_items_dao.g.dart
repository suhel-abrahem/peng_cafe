// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_items_dao.dart';

// ignore_for_file: type=lint
mixin _$OrderItemsDaoMixin on DatabaseAccessor<AppDatabase> {
  $OrderItemsTableTable get orderItemsTable => attachedDatabase.orderItemsTable;
  $ProductsTableTable get productsTable => attachedDatabase.productsTable;
  OrderItemsDaoManager get managers => OrderItemsDaoManager(this);
}

class OrderItemsDaoManager {
  final _$OrderItemsDaoMixin _db;
  OrderItemsDaoManager(this._db);
  $$OrderItemsTableTableTableManager get orderItemsTable =>
      $$OrderItemsTableTableTableManager(
        _db.attachedDatabase,
        _db.orderItemsTable,
      );
  $$ProductsTableTableTableManager get productsTable =>
      $$ProductsTableTableTableManager(_db.attachedDatabase, _db.productsTable);
}
