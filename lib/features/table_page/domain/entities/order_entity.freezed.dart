// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderEntity {

 int get id; String get orderNumber; int get tableNumber; TableTypeEnum get tableType; OrderStatusEnum get status; double get total; double get netTotal; double get profit; double get losses; double get discount; double get totalAfterLosses; String? get customerName; DateTime get createdAt; OrderTypeEnum get orderType;
/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderEntityCopyWith<OrderEntity> get copyWith => _$OrderEntityCopyWithImpl<OrderEntity>(this as OrderEntity, _$identity);

  /// Serializes this OrderEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.tableType, tableType) || other.tableType == tableType)&&(identical(other.status, status) || other.status == status)&&(identical(other.total, total) || other.total == total)&&(identical(other.netTotal, netTotal) || other.netTotal == netTotal)&&(identical(other.profit, profit) || other.profit == profit)&&(identical(other.losses, losses) || other.losses == losses)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.totalAfterLosses, totalAfterLosses) || other.totalAfterLosses == totalAfterLosses)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.orderType, orderType) || other.orderType == orderType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderNumber,tableNumber,tableType,status,total,netTotal,profit,losses,discount,totalAfterLosses,customerName,createdAt,orderType);

@override
String toString() {
  return 'OrderEntity(id: $id, orderNumber: $orderNumber, tableNumber: $tableNumber, tableType: $tableType, status: $status, total: $total, netTotal: $netTotal, profit: $profit, losses: $losses, discount: $discount, totalAfterLosses: $totalAfterLosses, customerName: $customerName, createdAt: $createdAt, orderType: $orderType)';
}


}

/// @nodoc
abstract mixin class $OrderEntityCopyWith<$Res>  {
  factory $OrderEntityCopyWith(OrderEntity value, $Res Function(OrderEntity) _then) = _$OrderEntityCopyWithImpl;
@useResult
$Res call({
 int id, String orderNumber, int tableNumber, TableTypeEnum tableType, OrderStatusEnum status, double total, double netTotal, double profit, double losses, double discount, double totalAfterLosses, String? customerName, DateTime createdAt, OrderTypeEnum orderType
});




}
/// @nodoc
class _$OrderEntityCopyWithImpl<$Res>
    implements $OrderEntityCopyWith<$Res> {
  _$OrderEntityCopyWithImpl(this._self, this._then);

  final OrderEntity _self;
  final $Res Function(OrderEntity) _then;

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderNumber = null,Object? tableNumber = null,Object? tableType = null,Object? status = null,Object? total = null,Object? netTotal = null,Object? profit = null,Object? losses = null,Object? discount = null,Object? totalAfterLosses = null,Object? customerName = freezed,Object? createdAt = null,Object? orderType = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as int,tableType: null == tableType ? _self.tableType : tableType // ignore: cast_nullable_to_non_nullable
as TableTypeEnum,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatusEnum,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,netTotal: null == netTotal ? _self.netTotal : netTotal // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,losses: null == losses ? _self.losses : losses // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,totalAfterLosses: null == totalAfterLosses ? _self.totalAfterLosses : totalAfterLosses // ignore: cast_nullable_to_non_nullable
as double,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,orderType: null == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as OrderTypeEnum,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderEntity].
extension OrderEntityPatterns on OrderEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderEntity value)  $default,){
final _that = this;
switch (_that) {
case _OrderEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String orderNumber,  int tableNumber,  TableTypeEnum tableType,  OrderStatusEnum status,  double total,  double netTotal,  double profit,  double losses,  double discount,  double totalAfterLosses,  String? customerName,  DateTime createdAt,  OrderTypeEnum orderType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that.id,_that.orderNumber,_that.tableNumber,_that.tableType,_that.status,_that.total,_that.netTotal,_that.profit,_that.losses,_that.discount,_that.totalAfterLosses,_that.customerName,_that.createdAt,_that.orderType);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String orderNumber,  int tableNumber,  TableTypeEnum tableType,  OrderStatusEnum status,  double total,  double netTotal,  double profit,  double losses,  double discount,  double totalAfterLosses,  String? customerName,  DateTime createdAt,  OrderTypeEnum orderType)  $default,) {final _that = this;
switch (_that) {
case _OrderEntity():
return $default(_that.id,_that.orderNumber,_that.tableNumber,_that.tableType,_that.status,_that.total,_that.netTotal,_that.profit,_that.losses,_that.discount,_that.totalAfterLosses,_that.customerName,_that.createdAt,_that.orderType);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String orderNumber,  int tableNumber,  TableTypeEnum tableType,  OrderStatusEnum status,  double total,  double netTotal,  double profit,  double losses,  double discount,  double totalAfterLosses,  String? customerName,  DateTime createdAt,  OrderTypeEnum orderType)?  $default,) {final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that.id,_that.orderNumber,_that.tableNumber,_that.tableType,_that.status,_that.total,_that.netTotal,_that.profit,_that.losses,_that.discount,_that.totalAfterLosses,_that.customerName,_that.createdAt,_that.orderType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderEntity implements OrderEntity {
  const _OrderEntity({this.id = 0, this.orderNumber = '', this.tableNumber = 0, required this.tableType, this.status = OrderStatusEnum.inProgress, this.total = 0.0, this.netTotal = 0.0, this.profit = 0.0, this.losses = 0.0, this.discount = 0.0, this.totalAfterLosses = 0.0, this.customerName, required this.createdAt, required this.orderType});
  factory _OrderEntity.fromJson(Map<String, dynamic> json) => _$OrderEntityFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String orderNumber;
@override@JsonKey() final  int tableNumber;
@override final  TableTypeEnum tableType;
@override@JsonKey() final  OrderStatusEnum status;
@override@JsonKey() final  double total;
@override@JsonKey() final  double netTotal;
@override@JsonKey() final  double profit;
@override@JsonKey() final  double losses;
@override@JsonKey() final  double discount;
@override@JsonKey() final  double totalAfterLosses;
@override final  String? customerName;
@override final  DateTime createdAt;
@override final  OrderTypeEnum orderType;

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderEntityCopyWith<_OrderEntity> get copyWith => __$OrderEntityCopyWithImpl<_OrderEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.tableType, tableType) || other.tableType == tableType)&&(identical(other.status, status) || other.status == status)&&(identical(other.total, total) || other.total == total)&&(identical(other.netTotal, netTotal) || other.netTotal == netTotal)&&(identical(other.profit, profit) || other.profit == profit)&&(identical(other.losses, losses) || other.losses == losses)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.totalAfterLosses, totalAfterLosses) || other.totalAfterLosses == totalAfterLosses)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.orderType, orderType) || other.orderType == orderType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderNumber,tableNumber,tableType,status,total,netTotal,profit,losses,discount,totalAfterLosses,customerName,createdAt,orderType);

@override
String toString() {
  return 'OrderEntity(id: $id, orderNumber: $orderNumber, tableNumber: $tableNumber, tableType: $tableType, status: $status, total: $total, netTotal: $netTotal, profit: $profit, losses: $losses, discount: $discount, totalAfterLosses: $totalAfterLosses, customerName: $customerName, createdAt: $createdAt, orderType: $orderType)';
}


}

/// @nodoc
abstract mixin class _$OrderEntityCopyWith<$Res> implements $OrderEntityCopyWith<$Res> {
  factory _$OrderEntityCopyWith(_OrderEntity value, $Res Function(_OrderEntity) _then) = __$OrderEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String orderNumber, int tableNumber, TableTypeEnum tableType, OrderStatusEnum status, double total, double netTotal, double profit, double losses, double discount, double totalAfterLosses, String? customerName, DateTime createdAt, OrderTypeEnum orderType
});




}
/// @nodoc
class __$OrderEntityCopyWithImpl<$Res>
    implements _$OrderEntityCopyWith<$Res> {
  __$OrderEntityCopyWithImpl(this._self, this._then);

  final _OrderEntity _self;
  final $Res Function(_OrderEntity) _then;

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderNumber = null,Object? tableNumber = null,Object? tableType = null,Object? status = null,Object? total = null,Object? netTotal = null,Object? profit = null,Object? losses = null,Object? discount = null,Object? totalAfterLosses = null,Object? customerName = freezed,Object? createdAt = null,Object? orderType = null,}) {
  return _then(_OrderEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as int,tableType: null == tableType ? _self.tableType : tableType // ignore: cast_nullable_to_non_nullable
as TableTypeEnum,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatusEnum,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,netTotal: null == netTotal ? _self.netTotal : netTotal // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,losses: null == losses ? _self.losses : losses // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,totalAfterLosses: null == totalAfterLosses ? _self.totalAfterLosses : totalAfterLosses // ignore: cast_nullable_to_non_nullable
as double,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,orderType: null == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as OrderTypeEnum,
  ));
}


}

// dart format on
