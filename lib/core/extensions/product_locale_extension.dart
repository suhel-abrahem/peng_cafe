import 'package:flutter/widgets.dart';

import '../DB/app_database.dart';

extension ProductLocaleName on ProductsTableData {
  String localizedName(Locale locale) {
    switch (locale.languageCode) {
      case 'ar':
        return nameAr;
      case 'ku':
        return nameKu ?? nameAr;
      default:
        return nameAr;
    }
  }
}
