// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  tableNumber: (json['tableNumber'] as num).toInt(),
  tableType: $enumDecode(_$TableTypeEnumEnumMap, json['tableType']),
  userId: (json['userId'] as num).toInt(),
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'tableNumber': instance.tableNumber,
      'tableType': _$TableTypeEnumEnumMap[instance.tableType]!,
      'userId': instance.userId,
    };

const _$TableTypeEnumEnumMap = {
  TableTypeEnum.cafe: 'cafe',
  TableTypeEnum.pool: 'pool',
  TableTypeEnum.videoGame: 'videoGame',
  TableTypeEnum.fisha: 'fisha',
  TableTypeEnum.tableBall: 'tableBall',
  TableTypeEnum.takeAway: 'takeAway',
};
