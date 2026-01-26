import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_entity.freezed.dart';

@freezed
abstract class LoginEntity with _$LoginEntity {
  const factory LoginEntity({
    @Default('') String email,
    @Default('') String password,
  }) = _LoginEntity;
}
