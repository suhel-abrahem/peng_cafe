import 'package:drift/drift.dart';

class ProductsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nameAr => text().unique()();
  TextColumn get nameEn => text().unique()();
  TextColumn get nameKu => text().nullable().unique()();
  TextColumn get descriptionAr => text().nullable()();
  TextColumn get descriptionEn => text().nullable()();
  TextColumn get descriptionKu => text().nullable()();
  RealColumn get price => real()();

  IntColumn get quantity => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
