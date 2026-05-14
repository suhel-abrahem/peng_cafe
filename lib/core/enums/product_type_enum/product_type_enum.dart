import 'package:easy_localization/easy_localization.dart';
import 'package:peng_cafe/generated/locale_keys.g.dart';

enum ProductTypeEnum { foodAndBeverage, games }

extension ProductTypeEnumDisplayName on ProductTypeEnum {
  get displayName {
    if (this == ProductTypeEnum.foodAndBeverage) {
      return LocaleKeys.productsPage_addProductForm_foodAndBeverage.tr();
    } else if (this == ProductTypeEnum.games) {
      return LocaleKeys.productsPage_addProductForm_games.tr();
    }
  }
}
