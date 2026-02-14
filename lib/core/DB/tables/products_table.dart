import 'package:drift/drift.dart';

import '../../enums/product_type_enum/product_type_enum.dart';

class ProductsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nameAr => text().unique()();
  TextColumn get nameEn => text().nullable().unique()();
  TextColumn get nameKu => text().nullable().unique()();
  TextColumn get descriptionAr => text().nullable()();
  TextColumn get descriptionEn => text().nullable()();
  TextColumn get descriptionKu => text().nullable()();
  TextColumn get imagePath => text().nullable()();
  RealColumn get costPrice => real().nullable()();
  RealColumn get price => real()();
  RealColumn get discount => real().nullable()();
  RealColumn get quantity => real().nullable()();
  IntColumn get productType => intEnum<ProductTypeEnum>().withDefault(
    Constant(ProductTypeEnum.foodAndBeverage.index),
  )();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
