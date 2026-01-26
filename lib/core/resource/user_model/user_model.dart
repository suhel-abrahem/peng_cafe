import 'dart:typed_data';

import '../../enums/user_rule_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String phoneNumber,
    @Default('') String email,
    @Default(0) int age,
    @Default("") String userRule,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
