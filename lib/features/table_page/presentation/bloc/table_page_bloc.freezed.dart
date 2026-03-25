// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TablePageEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TablePageEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TablePageEvent()';
}


}

/// @nodoc
class $TablePageEventCopyWith<$Res>  {
$TablePageEventCopyWith(TablePageEvent _, $Res Function(TablePageEvent) __);
}


/// Adds pattern-matching-related methods to [TablePageEvent].
extension TablePageEventPatterns on TablePageEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadTable value)?  loadTable,TResult Function( _AddProduct value)?  addProduct,TResult Function( _SetItemQuantity value)?  setItemQuantity,TResult Function( _DeleteItem value)?  deleteItem,TResult Function( _RefreshItems value)?  refreshItems,TResult Function( _Checkout value)?  checkout,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadTable() when loadTable != null:
return loadTable(_that);case _AddProduct() when addProduct != null:
return addProduct(_that);case _SetItemQuantity() when setItemQuantity != null:
return setItemQuantity(_that);case _DeleteItem() when deleteItem != null:
return deleteItem(_that);case _RefreshItems() when refreshItems != null:
return refreshItems(_that);case _Checkout() when checkout != null:
return checkout(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadTable value)  loadTable,required TResult Function( _AddProduct value)  addProduct,required TResult Function( _SetItemQuantity value)  setItemQuantity,required TResult Function( _DeleteItem value)  deleteItem,required TResult Function( _RefreshItems value)  refreshItems,required TResult Function( _Checkout value)  checkout,}){
final _that = this;
switch (_that) {
case _LoadTable():
return loadTable(_that);case _AddProduct():
return addProduct(_that);case _SetItemQuantity():
return setItemQuantity(_that);case _DeleteItem():
return deleteItem(_that);case _RefreshItems():
return refreshItems(_that);case _Checkout():
return checkout(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadTable value)?  loadTable,TResult? Function( _AddProduct value)?  addProduct,TResult? Function( _SetItemQuantity value)?  setItemQuantity,TResult? Function( _DeleteItem value)?  deleteItem,TResult? Function( _RefreshItems value)?  refreshItems,TResult? Function( _Checkout value)?  checkout,}){
final _that = this;
switch (_that) {
case _LoadTable() when loadTable != null:
return loadTable(_that);case _AddProduct() when addProduct != null:
return addProduct(_that);case _SetItemQuantity() when setItemQuantity != null:
return setItemQuantity(_that);case _DeleteItem() when deleteItem != null:
return deleteItem(_that);case _RefreshItems() when refreshItems != null:
return refreshItems(_that);case _Checkout() when checkout != null:
return checkout(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int tableNumber,  TableTypeEnum tableType,  int userId,  String locale,  OrderTypeEnum? orderType,  int? orderId,  bool? isEditing)?  loadTable,TResult Function( OrderItemModel item)?  addProduct,TResult Function( int itemId,  double quantity,  TableTypeEnum tableType,  int? tableNumber,  String locale,  int? orderId)?  setItemQuantity,TResult Function( int itemId,  String locale,  int? orderId)?  deleteItem,TResult Function( String? locale)?  refreshItems,TResult Function( double paidAmount,  double remaining)?  checkout,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadTable() when loadTable != null:
return loadTable(_that.tableNumber,_that.tableType,_that.userId,_that.locale,_that.orderType,_that.orderId,_that.isEditing);case _AddProduct() when addProduct != null:
return addProduct(_that.item);case _SetItemQuantity() when setItemQuantity != null:
return setItemQuantity(_that.itemId,_that.quantity,_that.tableType,_that.tableNumber,_that.locale,_that.orderId);case _DeleteItem() when deleteItem != null:
return deleteItem(_that.itemId,_that.locale,_that.orderId);case _RefreshItems() when refreshItems != null:
return refreshItems(_that.locale);case _Checkout() when checkout != null:
return checkout(_that.paidAmount,_that.remaining);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int tableNumber,  TableTypeEnum tableType,  int userId,  String locale,  OrderTypeEnum? orderType,  int? orderId,  bool? isEditing)  loadTable,required TResult Function( OrderItemModel item)  addProduct,required TResult Function( int itemId,  double quantity,  TableTypeEnum tableType,  int? tableNumber,  String locale,  int? orderId)  setItemQuantity,required TResult Function( int itemId,  String locale,  int? orderId)  deleteItem,required TResult Function( String? locale)  refreshItems,required TResult Function( double paidAmount,  double remaining)  checkout,}) {final _that = this;
switch (_that) {
case _LoadTable():
return loadTable(_that.tableNumber,_that.tableType,_that.userId,_that.locale,_that.orderType,_that.orderId,_that.isEditing);case _AddProduct():
return addProduct(_that.item);case _SetItemQuantity():
return setItemQuantity(_that.itemId,_that.quantity,_that.tableType,_that.tableNumber,_that.locale,_that.orderId);case _DeleteItem():
return deleteItem(_that.itemId,_that.locale,_that.orderId);case _RefreshItems():
return refreshItems(_that.locale);case _Checkout():
return checkout(_that.paidAmount,_that.remaining);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int tableNumber,  TableTypeEnum tableType,  int userId,  String locale,  OrderTypeEnum? orderType,  int? orderId,  bool? isEditing)?  loadTable,TResult? Function( OrderItemModel item)?  addProduct,TResult? Function( int itemId,  double quantity,  TableTypeEnum tableType,  int? tableNumber,  String locale,  int? orderId)?  setItemQuantity,TResult? Function( int itemId,  String locale,  int? orderId)?  deleteItem,TResult? Function( String? locale)?  refreshItems,TResult? Function( double paidAmount,  double remaining)?  checkout,}) {final _that = this;
switch (_that) {
case _LoadTable() when loadTable != null:
return loadTable(_that.tableNumber,_that.tableType,_that.userId,_that.locale,_that.orderType,_that.orderId,_that.isEditing);case _AddProduct() when addProduct != null:
return addProduct(_that.item);case _SetItemQuantity() when setItemQuantity != null:
return setItemQuantity(_that.itemId,_that.quantity,_that.tableType,_that.tableNumber,_that.locale,_that.orderId);case _DeleteItem() when deleteItem != null:
return deleteItem(_that.itemId,_that.locale,_that.orderId);case _RefreshItems() when refreshItems != null:
return refreshItems(_that.locale);case _Checkout() when checkout != null:
return checkout(_that.paidAmount,_that.remaining);case _:
  return null;

}
}

}

/// @nodoc


class _LoadTable implements TablePageEvent {
  const _LoadTable({required this.tableNumber, required this.tableType, required this.userId, required this.locale, this.orderType, this.orderId, this.isEditing});
  

 final  int tableNumber;
 final  TableTypeEnum tableType;
 final  int userId;
 final  String locale;
 final  OrderTypeEnum? orderType;
 final  int? orderId;
 final  bool? isEditing;

/// Create a copy of TablePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadTableCopyWith<_LoadTable> get copyWith => __$LoadTableCopyWithImpl<_LoadTable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadTable&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.tableType, tableType) || other.tableType == tableType)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.orderType, orderType) || other.orderType == orderType)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing));
}


@override
int get hashCode => Object.hash(runtimeType,tableNumber,tableType,userId,locale,orderType,orderId,isEditing);

@override
String toString() {
  return 'TablePageEvent.loadTable(tableNumber: $tableNumber, tableType: $tableType, userId: $userId, locale: $locale, orderType: $orderType, orderId: $orderId, isEditing: $isEditing)';
}


}

/// @nodoc
abstract mixin class _$LoadTableCopyWith<$Res> implements $TablePageEventCopyWith<$Res> {
  factory _$LoadTableCopyWith(_LoadTable value, $Res Function(_LoadTable) _then) = __$LoadTableCopyWithImpl;
@useResult
$Res call({
 int tableNumber, TableTypeEnum tableType, int userId, String locale, OrderTypeEnum? orderType, int? orderId, bool? isEditing
});




}
/// @nodoc
class __$LoadTableCopyWithImpl<$Res>
    implements _$LoadTableCopyWith<$Res> {
  __$LoadTableCopyWithImpl(this._self, this._then);

  final _LoadTable _self;
  final $Res Function(_LoadTable) _then;

/// Create a copy of TablePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tableNumber = null,Object? tableType = null,Object? userId = null,Object? locale = null,Object? orderType = freezed,Object? orderId = freezed,Object? isEditing = freezed,}) {
  return _then(_LoadTable(
tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as int,tableType: null == tableType ? _self.tableType : tableType // ignore: cast_nullable_to_non_nullable
as TableTypeEnum,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,orderType: freezed == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as OrderTypeEnum?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,isEditing: freezed == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class _AddProduct implements TablePageEvent {
  const _AddProduct({required this.item});
  

 final  OrderItemModel item;

/// Create a copy of TablePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddProductCopyWith<_AddProduct> get copyWith => __$AddProductCopyWithImpl<_AddProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddProduct&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'TablePageEvent.addProduct(item: $item)';
}


}

/// @nodoc
abstract mixin class _$AddProductCopyWith<$Res> implements $TablePageEventCopyWith<$Res> {
  factory _$AddProductCopyWith(_AddProduct value, $Res Function(_AddProduct) _then) = __$AddProductCopyWithImpl;
@useResult
$Res call({
 OrderItemModel item
});


$OrderItemModelCopyWith<$Res> get item;

}
/// @nodoc
class __$AddProductCopyWithImpl<$Res>
    implements _$AddProductCopyWith<$Res> {
  __$AddProductCopyWithImpl(this._self, this._then);

  final _AddProduct _self;
  final $Res Function(_AddProduct) _then;

/// Create a copy of TablePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_AddProduct(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as OrderItemModel,
  ));
}

/// Create a copy of TablePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderItemModelCopyWith<$Res> get item {
  
  return $OrderItemModelCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc


class _SetItemQuantity implements TablePageEvent {
  const _SetItemQuantity({required this.itemId, required this.quantity, required this.tableType, this.tableNumber, required this.locale, this.orderId});
  

 final  int itemId;
 final  double quantity;
 final  TableTypeEnum tableType;
 final  int? tableNumber;
 final  String locale;
 final  int? orderId;

/// Create a copy of TablePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetItemQuantityCopyWith<_SetItemQuantity> get copyWith => __$SetItemQuantityCopyWithImpl<_SetItemQuantity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetItemQuantity&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.tableType, tableType) || other.tableType == tableType)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,itemId,quantity,tableType,tableNumber,locale,orderId);

@override
String toString() {
  return 'TablePageEvent.setItemQuantity(itemId: $itemId, quantity: $quantity, tableType: $tableType, tableNumber: $tableNumber, locale: $locale, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$SetItemQuantityCopyWith<$Res> implements $TablePageEventCopyWith<$Res> {
  factory _$SetItemQuantityCopyWith(_SetItemQuantity value, $Res Function(_SetItemQuantity) _then) = __$SetItemQuantityCopyWithImpl;
@useResult
$Res call({
 int itemId, double quantity, TableTypeEnum tableType, int? tableNumber, String locale, int? orderId
});




}
/// @nodoc
class __$SetItemQuantityCopyWithImpl<$Res>
    implements _$SetItemQuantityCopyWith<$Res> {
  __$SetItemQuantityCopyWithImpl(this._self, this._then);

  final _SetItemQuantity _self;
  final $Res Function(_SetItemQuantity) _then;

/// Create a copy of TablePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? quantity = null,Object? tableType = null,Object? tableNumber = freezed,Object? locale = null,Object? orderId = freezed,}) {
  return _then(_SetItemQuantity(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,tableType: null == tableType ? _self.tableType : tableType // ignore: cast_nullable_to_non_nullable
as TableTypeEnum,tableNumber: freezed == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as int?,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _DeleteItem implements TablePageEvent {
  const _DeleteItem({required this.itemId, required this.locale, this.orderId});
  

 final  int itemId;
 final  String locale;
 final  int? orderId;

/// Create a copy of TablePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteItemCopyWith<_DeleteItem> get copyWith => __$DeleteItemCopyWithImpl<_DeleteItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,itemId,locale,orderId);

@override
String toString() {
  return 'TablePageEvent.deleteItem(itemId: $itemId, locale: $locale, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$DeleteItemCopyWith<$Res> implements $TablePageEventCopyWith<$Res> {
  factory _$DeleteItemCopyWith(_DeleteItem value, $Res Function(_DeleteItem) _then) = __$DeleteItemCopyWithImpl;
@useResult
$Res call({
 int itemId, String locale, int? orderId
});




}
/// @nodoc
class __$DeleteItemCopyWithImpl<$Res>
    implements _$DeleteItemCopyWith<$Res> {
  __$DeleteItemCopyWithImpl(this._self, this._then);

  final _DeleteItem _self;
  final $Res Function(_DeleteItem) _then;

/// Create a copy of TablePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? locale = null,Object? orderId = freezed,}) {
  return _then(_DeleteItem(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _RefreshItems implements TablePageEvent {
  const _RefreshItems({required this.locale});
  

 final  String? locale;

/// Create a copy of TablePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshItemsCopyWith<_RefreshItems> get copyWith => __$RefreshItemsCopyWithImpl<_RefreshItems>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshItems&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,locale);

@override
String toString() {
  return 'TablePageEvent.refreshItems(locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$RefreshItemsCopyWith<$Res> implements $TablePageEventCopyWith<$Res> {
  factory _$RefreshItemsCopyWith(_RefreshItems value, $Res Function(_RefreshItems) _then) = __$RefreshItemsCopyWithImpl;
@useResult
$Res call({
 String? locale
});




}
/// @nodoc
class __$RefreshItemsCopyWithImpl<$Res>
    implements _$RefreshItemsCopyWith<$Res> {
  __$RefreshItemsCopyWithImpl(this._self, this._then);

  final _RefreshItems _self;
  final $Res Function(_RefreshItems) _then;

/// Create a copy of TablePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? locale = freezed,}) {
  return _then(_RefreshItems(
locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Checkout implements TablePageEvent {
  const _Checkout({required this.paidAmount, required this.remaining});
  

 final  double paidAmount;
 final  double remaining;

/// Create a copy of TablePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutCopyWith<_Checkout> get copyWith => __$CheckoutCopyWithImpl<_Checkout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Checkout&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.remaining, remaining) || other.remaining == remaining));
}


@override
int get hashCode => Object.hash(runtimeType,paidAmount,remaining);

@override
String toString() {
  return 'TablePageEvent.checkout(paidAmount: $paidAmount, remaining: $remaining)';
}


}

/// @nodoc
abstract mixin class _$CheckoutCopyWith<$Res> implements $TablePageEventCopyWith<$Res> {
  factory _$CheckoutCopyWith(_Checkout value, $Res Function(_Checkout) _then) = __$CheckoutCopyWithImpl;
@useResult
$Res call({
 double paidAmount, double remaining
});




}
/// @nodoc
class __$CheckoutCopyWithImpl<$Res>
    implements _$CheckoutCopyWith<$Res> {
  __$CheckoutCopyWithImpl(this._self, this._then);

  final _Checkout _self;
  final $Res Function(_Checkout) _then;

/// Create a copy of TablePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? paidAmount = null,Object? remaining = null,}) {
  return _then(_Checkout(
paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$TablePageState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TablePageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TablePageState()';
}


}

/// @nodoc
class $TablePageStateCopyWith<$Res>  {
$TablePageStateCopyWith(TablePageState _, $Res Function(TablePageState) __);
}


/// Adds pattern-matching-related methods to [TablePageState].
extension TablePageStatePatterns on TablePageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _CheckoutSuccess value)?  checkoutSuccess,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _CheckoutSuccess() when checkoutSuccess != null:
return checkoutSuccess(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _CheckoutSuccess value)  checkoutSuccess,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _CheckoutSuccess():
return checkoutSuccess(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _CheckoutSuccess value)?  checkoutSuccess,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _CheckoutSuccess() when checkoutSuccess != null:
return checkoutSuccess(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( OrderEntity order,  List<OrderItemEntity> items)?  loaded,TResult Function( OrderEntity order,  List<OrderItemEntity> items,  double paidAmount,  double remaining)?  checkoutSuccess,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.order,_that.items);case _CheckoutSuccess() when checkoutSuccess != null:
return checkoutSuccess(_that.order,_that.items,_that.paidAmount,_that.remaining);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( OrderEntity order,  List<OrderItemEntity> items)  loaded,required TResult Function( OrderEntity order,  List<OrderItemEntity> items,  double paidAmount,  double remaining)  checkoutSuccess,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.order,_that.items);case _CheckoutSuccess():
return checkoutSuccess(_that.order,_that.items,_that.paidAmount,_that.remaining);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( OrderEntity order,  List<OrderItemEntity> items)?  loaded,TResult? Function( OrderEntity order,  List<OrderItemEntity> items,  double paidAmount,  double remaining)?  checkoutSuccess,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.order,_that.items);case _CheckoutSuccess() when checkoutSuccess != null:
return checkoutSuccess(_that.order,_that.items,_that.paidAmount,_that.remaining);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements TablePageState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TablePageState.initial()';
}


}




/// @nodoc


class _Loading implements TablePageState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TablePageState.loading()';
}


}




/// @nodoc


class _Loaded implements TablePageState {
  const _Loaded({required this.order, required final  List<OrderItemEntity> items}): _items = items;
  

 final  OrderEntity order;
 final  List<OrderItemEntity> _items;
 List<OrderItemEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of TablePageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.order, order) || other.order == order)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,order,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'TablePageState.loaded(order: $order, items: $items)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $TablePageStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 OrderEntity order, List<OrderItemEntity> items
});


$OrderEntityCopyWith<$Res> get order;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of TablePageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? order = null,Object? items = null,}) {
  return _then(_Loaded(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as OrderEntity,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemEntity>,
  ));
}

/// Create a copy of TablePageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderEntityCopyWith<$Res> get order {
  
  return $OrderEntityCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}

/// @nodoc


class _CheckoutSuccess implements TablePageState {
  const _CheckoutSuccess({required this.order, required final  List<OrderItemEntity> items, required this.paidAmount, required this.remaining}): _items = items;
  

 final  OrderEntity order;
 final  List<OrderItemEntity> _items;
 List<OrderItemEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  double paidAmount;
 final  double remaining;

/// Create a copy of TablePageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutSuccessCopyWith<_CheckoutSuccess> get copyWith => __$CheckoutSuccessCopyWithImpl<_CheckoutSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutSuccess&&(identical(other.order, order) || other.order == order)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.remaining, remaining) || other.remaining == remaining));
}


@override
int get hashCode => Object.hash(runtimeType,order,const DeepCollectionEquality().hash(_items),paidAmount,remaining);

@override
String toString() {
  return 'TablePageState.checkoutSuccess(order: $order, items: $items, paidAmount: $paidAmount, remaining: $remaining)';
}


}

/// @nodoc
abstract mixin class _$CheckoutSuccessCopyWith<$Res> implements $TablePageStateCopyWith<$Res> {
  factory _$CheckoutSuccessCopyWith(_CheckoutSuccess value, $Res Function(_CheckoutSuccess) _then) = __$CheckoutSuccessCopyWithImpl;
@useResult
$Res call({
 OrderEntity order, List<OrderItemEntity> items, double paidAmount, double remaining
});


$OrderEntityCopyWith<$Res> get order;

}
/// @nodoc
class __$CheckoutSuccessCopyWithImpl<$Res>
    implements _$CheckoutSuccessCopyWith<$Res> {
  __$CheckoutSuccessCopyWithImpl(this._self, this._then);

  final _CheckoutSuccess _self;
  final $Res Function(_CheckoutSuccess) _then;

/// Create a copy of TablePageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? order = null,Object? items = null,Object? paidAmount = null,Object? remaining = null,}) {
  return _then(_CheckoutSuccess(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as OrderEntity,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemEntity>,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of TablePageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderEntityCopyWith<$Res> get order {
  
  return $OrderEntityCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}

/// @nodoc


class _Error implements TablePageState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of TablePageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TablePageState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $TablePageStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of TablePageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
