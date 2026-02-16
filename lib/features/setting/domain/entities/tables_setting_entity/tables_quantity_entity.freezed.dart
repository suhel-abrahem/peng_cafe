// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tables_quantity_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TablesQuantityEntity {

 TableTypeEnum get tableName; TableTypeEnum get tableType; int get quantity; bool get isActive;
/// Create a copy of TablesQuantityEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TablesQuantityEntityCopyWith<TablesQuantityEntity> get copyWith => _$TablesQuantityEntityCopyWithImpl<TablesQuantityEntity>(this as TablesQuantityEntity, _$identity);

  /// Serializes this TablesQuantityEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TablesQuantityEntity&&(identical(other.tableName, tableName) || other.tableName == tableName)&&(identical(other.tableType, tableType) || other.tableType == tableType)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tableName,tableType,quantity,isActive);

@override
String toString() {
  return 'TablesQuantityEntity(tableName: $tableName, tableType: $tableType, quantity: $quantity, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $TablesQuantityEntityCopyWith<$Res>  {
  factory $TablesQuantityEntityCopyWith(TablesQuantityEntity value, $Res Function(TablesQuantityEntity) _then) = _$TablesQuantityEntityCopyWithImpl;
@useResult
$Res call({
 TableTypeEnum tableName, TableTypeEnum tableType, int quantity, bool isActive
});




}
/// @nodoc
class _$TablesQuantityEntityCopyWithImpl<$Res>
    implements $TablesQuantityEntityCopyWith<$Res> {
  _$TablesQuantityEntityCopyWithImpl(this._self, this._then);

  final TablesQuantityEntity _self;
  final $Res Function(TablesQuantityEntity) _then;

/// Create a copy of TablesQuantityEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tableName = null,Object? tableType = null,Object? quantity = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
tableName: null == tableName ? _self.tableName : tableName // ignore: cast_nullable_to_non_nullable
as TableTypeEnum,tableType: null == tableType ? _self.tableType : tableType // ignore: cast_nullable_to_non_nullable
as TableTypeEnum,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TablesQuantityEntity].
extension TablesQuantityEntityPatterns on TablesQuantityEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TablesQuantityEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TablesQuantityEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TablesQuantityEntity value)  $default,){
final _that = this;
switch (_that) {
case _TablesQuantityEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TablesQuantityEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TablesQuantityEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TableTypeEnum tableName,  TableTypeEnum tableType,  int quantity,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TablesQuantityEntity() when $default != null:
return $default(_that.tableName,_that.tableType,_that.quantity,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TableTypeEnum tableName,  TableTypeEnum tableType,  int quantity,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _TablesQuantityEntity():
return $default(_that.tableName,_that.tableType,_that.quantity,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TableTypeEnum tableName,  TableTypeEnum tableType,  int quantity,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _TablesQuantityEntity() when $default != null:
return $default(_that.tableName,_that.tableType,_that.quantity,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TablesQuantityEntity implements TablesQuantityEntity {
  const _TablesQuantityEntity({required this.tableName, required this.tableType, this.quantity = 0, this.isActive = false});
  factory _TablesQuantityEntity.fromJson(Map<String, dynamic> json) => _$TablesQuantityEntityFromJson(json);

@override final  TableTypeEnum tableName;
@override final  TableTypeEnum tableType;
@override@JsonKey() final  int quantity;
@override@JsonKey() final  bool isActive;

/// Create a copy of TablesQuantityEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TablesQuantityEntityCopyWith<_TablesQuantityEntity> get copyWith => __$TablesQuantityEntityCopyWithImpl<_TablesQuantityEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TablesQuantityEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TablesQuantityEntity&&(identical(other.tableName, tableName) || other.tableName == tableName)&&(identical(other.tableType, tableType) || other.tableType == tableType)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tableName,tableType,quantity,isActive);

@override
String toString() {
  return 'TablesQuantityEntity(tableName: $tableName, tableType: $tableType, quantity: $quantity, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$TablesQuantityEntityCopyWith<$Res> implements $TablesQuantityEntityCopyWith<$Res> {
  factory _$TablesQuantityEntityCopyWith(_TablesQuantityEntity value, $Res Function(_TablesQuantityEntity) _then) = __$TablesQuantityEntityCopyWithImpl;
@override @useResult
$Res call({
 TableTypeEnum tableName, TableTypeEnum tableType, int quantity, bool isActive
});




}
/// @nodoc
class __$TablesQuantityEntityCopyWithImpl<$Res>
    implements _$TablesQuantityEntityCopyWith<$Res> {
  __$TablesQuantityEntityCopyWithImpl(this._self, this._then);

  final _TablesQuantityEntity _self;
  final $Res Function(_TablesQuantityEntity) _then;

/// Create a copy of TablesQuantityEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tableName = null,Object? tableType = null,Object? quantity = null,Object? isActive = null,}) {
  return _then(_TablesQuantityEntity(
tableName: null == tableName ? _self.tableName : tableName // ignore: cast_nullable_to_non_nullable
as TableTypeEnum,tableType: null == tableType ? _self.tableType : tableType // ignore: cast_nullable_to_non_nullable
as TableTypeEnum,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
