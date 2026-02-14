import 'dart:convert';
import '../../core/constant/language_constants.dart';
import '../../core/constant/shared_preferences_keys.dart';
import '../../core/resource/user_model/user_model.dart';

import '../../core/util/helper/helper.dart';
import '../../features/setting/domain/entities/sync_setting_model.dart';

import '../../core/enums/sync_type_enum.dart';
import '../../features/setting/domain/entities/sync_setting_can_sync_model.dart';
import '../../features/setting/domain/entities/sync_setting_date_model.dart';
import '../theme/app_theme.dart';

import '../../core/enums/theme_enums.dart';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

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

  Map<String, dynamic> getSyncType() {
    String? savesData = _sharedPreferences.getString(
      SharedPreferencesKeys.PREFS_KEY_SYNC_TYPE,
    );
    return savesData != null
        ? jsonDecode(savesData)
        : SyncSettingModel(
            auto: SyncTypeEnum.custom.formattedValue,
            tables: SyncTypeEnum.never.formattedValue,
            charts: SyncTypeEnum.never.formattedValue,
            items: SyncTypeEnum.never.formattedValue,
            deliveryNames: SyncTypeEnum.never.formattedValue,
            deliveryLocations: SyncTypeEnum.never.formattedValue,
            deliveryClients: SyncTypeEnum.never.formattedValue,
            rule: SyncTypeEnum.never.formattedValue,
          ).toJson();
  }

  Future<void> setSyncType({required SyncSettingModel syncModel}) async {
    await _sharedPreferences.setString(
      SharedPreferencesKeys.PREFS_KEY_SYNC_TYPE,
      jsonEncode(syncModel.toJson()),
    );
  }

  Future<void> setDataLocally({
    required String key,
    required List<String> dataAsJson,
  }) async {
    await _sharedPreferences.setStringList(key, dataAsJson);
  }

  List<String>? getDataLocally(String key) {
    return _sharedPreferences.getStringList(key);
  }

  // Future<void> setCollectionsNames(
  //     {required String key, required List<String> collectionsNames}) async {
  //   await sharedPreferences.setString(key, jsonEncode(collectionsNames));
  // }

  // List<String> getCollectionsNames() {
  //   return jsonDecode(sharedPreferences
  //           .getString(SharedPreferencesKeys.PREFS_KEY_COLLECTIONS_NAMES) ??
  //       '[]') as List<String>;
  // }

  Map<String, dynamic> getSyncDate() {
    String? savesData = _sharedPreferences.getString(
      SharedPreferencesKeys.PREFS_KEY_SYNC_DATE,
    );
    return savesData != null
        ? jsonDecode(savesData)
        : const SyncSettingDateModel().toJson();
  }

  Future<void> setSyncDate({
    required SyncSettingDateModel syncDateModel,
  }) async {
    await _sharedPreferences.setString(
      SharedPreferencesKeys.PREFS_KEY_SYNC_DATE,
      jsonEncode(syncDateModel.toJson()),
    );
  }

  Future<void> checkDateToSync() async {
    Map<String, dynamic> dates = getSyncDate();
    Map<String, dynamic> syncTimes = getSyncType();
    Map<String, dynamic> canSync = getCanSync();
    dates.forEach((key, value) {
      if (syncTimes[key] != SyncTypeEnum.always.formattedValue &&
          syncTimes[key] != SyncTypeEnum.never.formattedValue &&
          syncTimes[key] != SyncTypeEnum.custom.formattedValue) {
        DateTime time = DateTime.tryParse(value ?? '') ?? DateTime.now();

        DateTime timeNow = DateTime.now();
        bool comparisonResult =
            ((time.isBefore(timeNow)) || (time.isAtSameMomentAs(timeNow)));

        if (comparisonResult) {
          String? durationAsString = syncTimes[key];
          Duration duration = Helper.convertStringToDurations(durationAsString);
          dates[key] = timeNow.add(duration).toString();
          canSync[key] = true;
        }
      } else if (syncTimes[key] == SyncTypeEnum.always.formattedValue) {
        canSync[key] = true;
      } else {
        canSync[key] = false;
      }
    });
    await setSyncDate(
      syncDateModel: SyncSettingDateModel.fromJson(
        jsonDecode(jsonEncode(dates)),
      ),
    );
    await setCanSync(
      syncCanSyncModel: SyncSettingCanSyncModel.fromJson(
        jsonDecode(jsonEncode(canSync)),
      ),
    );
  }

  Map<String, dynamic> getCanSync() {
    String? savesData = _sharedPreferences.getString(
      SharedPreferencesKeys.PREFS_KEY_SYNC_CAN_SYNC,
    );
    return savesData != null
        ? jsonDecode(savesData)
        : const SyncSettingCanSyncModel().toJson();
  }

  Future<void> setCanSync({
    required SyncSettingCanSyncModel syncCanSyncModel,
  }) async {
    await _sharedPreferences.setString(
      SharedPreferencesKeys.PREFS_KEY_SYNC_CAN_SYNC,
      jsonEncode(syncCanSyncModel.toJson()),
    );
  }

  Future<void> resetCanSync({required String key, bool canSync = false}) async {
    Map<String, dynamic> canSyncs = getCanSync();
    canSyncs[key] = canSync;
    await setCanSync(
      syncCanSyncModel: SyncSettingCanSyncModel.fromJson(
        jsonDecode(jsonEncode(canSyncs)),
      ),
    );
  }

  Future<void> setTablesQuantity({required int quantity}) async {
    await _sharedPreferences.setInt(
      SharedPreferencesKeys.PREFS_KEY_LOCALLY_TABLES_QUANTITY,
      quantity,
    );
  }

  int getTablesQuantity() {
    return _sharedPreferences.getInt(
          SharedPreferencesKeys.PREFS_KEY_LOCALLY_TABLES_QUANTITY,
        ) ??
        0;
  }

  Future<void> setPoolTablesQuantity({required int quantity}) async {
    await _sharedPreferences.setInt(
      SharedPreferencesKeys.PREFS_KEY_LOCALLY_POOL_TABLES_QUANTITY,
      quantity,
    );
  }

  int getPoolTablesQuantity() {
    return _sharedPreferences.getInt(
          SharedPreferencesKeys.PREFS_KEY_LOCALLY_POOL_TABLES_QUANTITY,
        ) ??
        0;
  }

  Future<void> setVideoGamesTablesQuantity({required int quantity}) async {
    await _sharedPreferences.setInt(
      SharedPreferencesKeys.PREFS_KEY_LOCALLY_VIDEO_GAMES_TABLES,
      quantity,
    );
  }

  int getVideoGamesTablesQuantity() {
    return _sharedPreferences.getInt(
          SharedPreferencesKeys.PREFS_KEY_LOCALLY_VIDEO_GAMES_TABLES,
        ) ??
        0;
  }

  Future<void> setFishaTablesQuantity({required int quantity}) async {
    await _sharedPreferences.setInt(
      SharedPreferencesKeys.PREFS_KEY_LOCALLY_FISHA_TABLES,
      quantity,
    );
  }

  int getFishaTablesQuantity() {
    return _sharedPreferences.getInt(
          SharedPreferencesKeys.PREFS_KEY_LOCALLY_FISHA_TABLES,
        ) ??
        0;
  }

  Future<void> setTableBallTablesQuantity({required int quantity}) async {
    await _sharedPreferences.setInt(
      SharedPreferencesKeys.PREFS_KEY_LOCALLY_TABLE_BALL_TABLES,
      quantity,
    );
  }

  int getTableBallTablesQuantity() {
    return _sharedPreferences.getInt(
          SharedPreferencesKeys.PREFS_KEY_LOCALLY_TABLE_BALL_TABLES,
        ) ??
        0;
  }

  Future<void> setTablesType({required List<String> type}) async {
    await _sharedPreferences.setStringList(
      SharedPreferencesKeys.PREFS_KEY_LOCALLY_TABLES_TYPE,
      type,
    );
  }

  List<String> getTablesType() {
    return _sharedPreferences.getStringList(
          SharedPreferencesKeys.PREFS_KEY_LOCALLY_TABLES_TYPE,
        ) ??
        [];
  }
}
