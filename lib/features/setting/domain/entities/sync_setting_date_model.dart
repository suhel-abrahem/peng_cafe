import 'package:freezed_annotation/freezed_annotation.dart';
part 'sync_setting_date_model.freezed.dart';
part 'sync_setting_date_model.g.dart';

@freezed
abstract class SyncSettingDateModel with _$SyncSettingDateModel {
  const factory SyncSettingDateModel({
    @Default('') String auto,
    @Default('') String tables,
    @Default('') String charts,
    @Default('') String items,
    @Default('') String salesmanNames,
    @Default('') String salesmanLocations,
    @Default('') String salesmanClients,
  }) = $SyncSettingDateModel;
  factory SyncSettingDateModel.fromJson(Map<String, dynamic> json) =>
      _$SyncSettingDateModelFromJson(json);
}
