import 'package:freezed_annotation/freezed_annotation.dart';
part 'sync_setting_model.freezed.dart';
part 'sync_setting_model.g.dart';

@freezed
abstract class SyncSettingModel with _$SyncSettingModel {
  factory SyncSettingModel({
    @Default('never') String auto,
    @Default('never') String tables,
    @Default('never') String charts,
    @Default('never') String items,
    @Default('never') String deliveryNames,
    @Default('never') String deliveryLocations,
    @Default('never') String deliveryClients,
    @Default('never') String rule,
  }) = _SyncSettingModel;
  factory SyncSettingModel.fromJson(Map<String, dynamic> json) =>
      _$SyncSettingModelFromJson(json);
}
