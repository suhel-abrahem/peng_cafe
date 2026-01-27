import '../../../features/products/domain/entities/product_entity.dart';

import '../app_database.dart';

ProductEntity productFromRow(ProductsTableData row, String locale) {
  late final String name;
  String? description;

  switch (locale) {
    case 'en':
      name = row.nameEn;
      description = row.descriptionEn;
      break;
    case 'ku':
      name = row.nameKu ?? row.nameAr;
      description = row.descriptionKu ?? row.descriptionAr;
      break;
    default:
      name = row.nameAr;
      description = row.descriptionAr;
  }

  return ProductEntity(
    id: row.id,
    name: name,
    description: description,
    price: row.price,
    quantity: row.quantity,
    createdAt: row.createdAt,
  );
}
