import 'dart:convert';
import 'package:peng_cafe/features/setting/data/models/tables_setting/tables_types_model.dart';

import '../../core/constant/language_constants.dart';
import '../../core/constant/shared_preferences_keys.dart';
import '../../core/enums/tables_enum/table_type_enum.dart';
import '../../core/resource/user_model/user_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/setting/domain/entities/tables_setting_entity/tables_quantity_entity.dart';

class AppPreferences {
  late final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  static Future<AppPreferences> init() async {
    return AppPreferences(await SharedPreferences.getInstance());
  }

  setLanguage({String? languageCode}) {
    _sharedPreferences.setString(
      SharedPreferencesKeys.PREFS_KEY_LANGUAGE,
      languageCode ?? LanguageConstant.en,
    );
  }

  String? getLanguage() {
    return _sharedPreferences.getString(
      SharedPreferencesKeys.PREFS_KEY_LANGUAGE,
    );
  }

  setAppTheme({bool? isDarkTheme}) {
    _sharedPreferences.setBool(
      SharedPreferencesKeys.PREFS_KEY_THEME,
      isDarkTheme ?? false,
    );
  }

  bool getThemeBool() {
    bool? theme = _sharedPreferences.getBool(
      SharedPreferencesKeys.PREFS_KEY_THEME,
    );
    theme ??= false;
    return theme;
  }

  Future<void> setUserFirstUse({bool state = true}) async {
    _sharedPreferences.setBool(
      SharedPreferencesKeys.PREFS_KEY_FIRST_USE,
      state,
    );
  }

  Future<bool> getUserFirstUse() async {
    return _sharedPreferences.getBool(
          SharedPreferencesKeys.PREFS_KEY_FIRST_USE,
        ) ??
        false;
  }

  Future<void> setUserLoginState({bool state = true}) async {
    _sharedPreferences.setBool(
      SharedPreferencesKeys.PREFS_KEY_USER_LOGGED_IN,
      state,
    );
  }

  bool getUserLoginState() {
    return _sharedPreferences.getBool(
          SharedPreferencesKeys.PREFS_KEY_USER_LOGGED_IN,
        ) ??
        false;
  }

  Future<void> setUserInfo(UserModel userModel) async {
    _sharedPreferences.setString(
      SharedPreferencesKeys.PREFS_KEY_USER,
      jsonEncode(userModel.toJson()),
    );
  }

  Future<String> getUserInfo() async {
    return _sharedPreferences.getString(SharedPreferencesKeys.PREFS_KEY_USER) ??
        '';
  }

  Future<void> setTablesTypesLocally(TablesTypesModel tablesTypes) async {
    _sharedPreferences.setString(
      SharedPreferencesKeys.PREFS_KEY_LOCALLY_TABLES_TYPES,
      jsonEncode(tablesTypes.toJson()),
    );
  }

  TablesTypesModel getTablesTypesLocally() {
    String tablesTypesString =
        _sharedPreferences.getString(
          SharedPreferencesKeys.PREFS_KEY_LOCALLY_TABLES_TYPES,
        ) ??
        '';
    if (tablesTypesString.isEmpty) {
      return TablesTypesModel(
        tablesTypes: [
          TablesQuantityEntity(
            tableName: TableTypeEnum.cafe,
            quantity: 10,
            isActive: true,
          ),
          TablesQuantityEntity(
            tableName: TableTypeEnum.pool,
            quantity: 0,
            isActive: false,
          ),
          TablesQuantityEntity(
            tableName: TableTypeEnum.fisha,
            quantity: 0,
            isActive: false,
          ),
          TablesQuantityEntity(
            tableName: TableTypeEnum.tableBall,
            quantity: 0,
            isActive: false,
          ),
          TablesQuantityEntity(
            tableName: TableTypeEnum.videoGame,
            quantity: 0,
            isActive: false,
          ),
        ],
      );
    } else {
      return TablesTypesModel.fromJson(jsonDecode(tablesTypesString));
    }
  }
}
