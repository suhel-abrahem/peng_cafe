import 'package:peng_cafe/generated/locale_keys.g.dart';

enum TableTypeEnum { cafe, pool, videoGame, fisha, tableBall, takeAway }

extension TableTypeLocalization on TableTypeEnum {
  String get quantityLocaleKey {
    switch (this) {
      case TableTypeEnum.cafe:
        return LocaleKeys.settingsPage_tablesQuantity;

      case TableTypeEnum.pool:
        return LocaleKeys.settingsPage_poolTablesQuantity;

      case TableTypeEnum.videoGame:
        return LocaleKeys.settingsPage_videoGamesTablesQuantity;

      case TableTypeEnum.fisha:
        return LocaleKeys.settingsPage_fishaTablesQuantity;

      case TableTypeEnum.tableBall:
        return LocaleKeys.settingsPage_tableBallTablesQuantity;
      case TableTypeEnum.takeAway:
        return LocaleKeys.settingsPage_takeAwayTablesQuantity;
    }
  }
}

extension TableTypeEnumExtension on TableTypeEnum {
  String get displayName {
    switch (this) {
      case TableTypeEnum.cafe:
        return LocaleKeys.homePage_cafe;
      case TableTypeEnum.pool:
        return LocaleKeys.homePage_pool;
      case TableTypeEnum.videoGame:
        return LocaleKeys.homePage_videoGame;
      case TableTypeEnum.fisha:
        return LocaleKeys.homePage_fisha;
      case TableTypeEnum.tableBall:
        return LocaleKeys.homePage_tableBall;
      case TableTypeEnum.takeAway:
        return LocaleKeys.homePage_takeAway;
    }
  }
}
