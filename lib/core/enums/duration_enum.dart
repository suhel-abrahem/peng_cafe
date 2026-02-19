import 'package:peng_cafe/generated/locale_keys.g.dart';

enum DurationEnum {
  never,
  daily,
  weekly,
  monthly,
  twoMonthly,
  quarterly,
  halfYearly,
  yearly,
  allTime,
}

extension DurationEnumExtension on DurationEnum {
  String get displayName {
    switch (this) {
      case DurationEnum.never:
        return LocaleKeys.durationEnum_never;
      case DurationEnum.daily:
        return LocaleKeys.durationEnum_daily;
      case DurationEnum.weekly:
        return LocaleKeys.durationEnum_weekly;
      case DurationEnum.monthly:
        return LocaleKeys.durationEnum_monthly;
      case DurationEnum.yearly:
        return LocaleKeys.durationEnum_yearly;
      case DurationEnum.twoMonthly:
        return LocaleKeys.durationEnum_twoMonthly;
      case DurationEnum.quarterly:
        return LocaleKeys.durationEnum_quarterly;
      case DurationEnum.halfYearly:
        return LocaleKeys.durationEnum_halfYearly;
      case DurationEnum.allTime:
        return LocaleKeys.durationEnum_allTime;
    }
  }
}
