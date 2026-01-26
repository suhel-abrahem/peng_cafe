// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  firstName: json['firstName'] as String? ?? '',
  lastName: json['lastName'] as String? ?? '',
  phoneNumber: json['phoneNumber'] as String? ?? '',
  email: json['email'] as String? ?? '',
  age: (json['age'] as num?)?.toInt() ?? 0,
  userRule: json['userRule'] as String? ?? "",
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'age': instance.age,
      'userRule': instance.userRule,
    };
