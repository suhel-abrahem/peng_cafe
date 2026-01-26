import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_setting_can_sync_model.freezed.dart';
part 'sync_setting_can_sync_model.g.dart';

@freezed
abstract class SyncSettingCanSyncModel with _$SyncSettingCanSyncModel {
  const factory SyncSettingCanSyncModel({
    @Default(false) bool auto,
    @Default(false) bool tables,
    @Default(false) bool charts,
    @Default(false) bool items,
    @Default(false) bool salesmanNames,
    @Default(false) bool salesmanLocations,
    @Default(false) bool salesmanClients,
    @Default(false) bool rule,
  }) = $SyncSettingCanSyncModel;

  factory SyncSettingCanSyncModel.fromJson(Map<String, dynamic> json) =>
      _$SyncSettingCanSyncModelFromJson(json);
}
