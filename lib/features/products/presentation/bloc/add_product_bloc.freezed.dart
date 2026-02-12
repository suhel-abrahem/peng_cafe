// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddProductEvent()';
}


}

/// @nodoc
class $AddProductEventCopyWith<$Res>  {
$AddProductEventCopyWith(AddProductEvent _, $Res Function(AddProductEvent) __);
}


/// Adds pattern-matching-related methods to [AddProductEvent].
extension AddProductEventPatterns on AddProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddProductEventStarted value)?  started,TResult Function( AddProductEventAddProduct value)?  addProduct,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddProductEventStarted() when started != null:
return started(_that);case AddProductEventAddProduct() when addProduct != null:
return addProduct(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddProductEventStarted value)  started,required TResult Function( AddProductEventAddProduct value)  addProduct,}){
final _that = this;
switch (_that) {
case AddProductEventStarted():
return started(_that);case AddProductEventAddProduct():
return addProduct(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddProductEventStarted value)?  started,TResult? Function( AddProductEventAddProduct value)?  addProduct,}){
final _that = this;
switch (_that) {
case AddProductEventStarted() when started != null:
return started(_that);case AddProductEventAddProduct() when addProduct != null:
return addProduct(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( ProductModel productModel)?  addProduct,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddProductEventStarted() when started != null:
return started();case AddProductEventAddProduct() when addProduct != null:
return addProduct(_that.productModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( ProductModel productModel)  addProduct,}) {final _that = this;
switch (_that) {
case AddProductEventStarted():
return started();case AddProductEventAddProduct():
return addProduct(_that.productModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( ProductModel productModel)?  addProduct,}) {final _that = this;
switch (_that) {
case AddProductEventStarted() when started != null:
return started();case AddProductEventAddProduct() when addProduct != null:
return addProduct(_that.productModel);case _:
  return null;

}
}

}

/// @nodoc


class AddProductEventStarted implements AddProductEvent {
  const AddProductEventStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddProductEventStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddProductEvent.started()';
}


}




/// @nodoc


class AddProductEventAddProduct implements AddProductEvent {
  const AddProductEventAddProduct({required this.productModel});
  

 final  ProductModel productModel;

/// Create a copy of AddProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddProductEventAddProductCopyWith<AddProductEventAddProduct> get copyWith => _$AddProductEventAddProductCopyWithImpl<AddProductEventAddProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddProductEventAddProduct&&(identical(other.productModel, productModel) || other.productModel == productModel));
}


@override
int get hashCode => Object.hash(runtimeType,productModel);

@override
String toString() {
  return 'AddProductEvent.addProduct(productModel: $productModel)';
}


}

/// @nodoc
abstract mixin class $AddProductEventAddProductCopyWith<$Res> implements $AddProductEventCopyWith<$Res> {
  factory $AddProductEventAddProductCopyWith(AddProductEventAddProduct value, $Res Function(AddProductEventAddProduct) _then) = _$AddProductEventAddProductCopyWithImpl;
@useResult
$Res call({
 ProductModel productModel
});


$ProductModelCopyWith<$Res> get productModel;

}
/// @nodoc
class _$AddProductEventAddProductCopyWithImpl<$Res>
    implements $AddProductEventAddProductCopyWith<$Res> {
  _$AddProductEventAddProductCopyWithImpl(this._self, this._then);

  final AddProductEventAddProduct _self;
  final $Res Function(AddProductEventAddProduct) _then;

/// Create a copy of AddProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productModel = null,}) {
  return _then(AddProductEventAddProduct(
productModel: null == productModel ? _self.productModel : productModel // ignore: cast_nullable_to_non_nullable
as ProductModel,
  ));
}

/// Create a copy of AddProductEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res> get productModel {
  
  return $ProductModelCopyWith<$Res>(_self.productModel, (value) {
    return _then(_self.copyWith(productModel: value));
  });
}
}

/// @nodoc
mixin _$AddProductState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddProductState()';
}


}

/// @nodoc
class $AddProductStateCopyWith<$Res>  {
$AddProductStateCopyWith(AddProductState _, $Res Function(AddProductState) __);
}


/// Adds pattern-matching-related methods to [AddProductState].
extension AddProductStatePatterns on AddProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddProductStateInitial value)?  initial,TResult Function( AddProductStateLoading value)?  loading,TResult Function( AddProductStateSuccess value)?  success,TResult Function( AddProductStateError value)?  error,TResult Function( AddProductStateItemsAlreadyExists value)?  itemsAlreadyExists,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddProductStateInitial() when initial != null:
return initial(_that);case AddProductStateLoading() when loading != null:
return loading(_that);case AddProductStateSuccess() when success != null:
return success(_that);case AddProductStateError() when error != null:
return error(_that);case AddProductStateItemsAlreadyExists() when itemsAlreadyExists != null:
return itemsAlreadyExists(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddProductStateInitial value)  initial,required TResult Function( AddProductStateLoading value)  loading,required TResult Function( AddProductStateSuccess value)  success,required TResult Function( AddProductStateError value)  error,required TResult Function( AddProductStateItemsAlreadyExists value)  itemsAlreadyExists,}){
final _that = this;
switch (_that) {
case AddProductStateInitial():
return initial(_that);case AddProductStateLoading():
return loading(_that);case AddProductStateSuccess():
return success(_that);case AddProductStateError():
return error(_that);case AddProductStateItemsAlreadyExists():
return itemsAlreadyExists(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddProductStateInitial value)?  initial,TResult? Function( AddProductStateLoading value)?  loading,TResult? Function( AddProductStateSuccess value)?  success,TResult? Function( AddProductStateError value)?  error,TResult? Function( AddProductStateItemsAlreadyExists value)?  itemsAlreadyExists,}){
final _that = this;
switch (_that) {
case AddProductStateInitial() when initial != null:
return initial(_that);case AddProductStateLoading() when loading != null:
return loading(_that);case AddProductStateSuccess() when success != null:
return success(_that);case AddProductStateError() when error != null:
return error(_that);case AddProductStateItemsAlreadyExists() when itemsAlreadyExists != null:
return itemsAlreadyExists(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String message)?  error,TResult Function( String message)?  itemsAlreadyExists,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddProductStateInitial() when initial != null:
return initial();case AddProductStateLoading() when loading != null:
return loading();case AddProductStateSuccess() when success != null:
return success();case AddProductStateError() when error != null:
return error(_that.message);case AddProductStateItemsAlreadyExists() when itemsAlreadyExists != null:
return itemsAlreadyExists(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String message)  error,required TResult Function( String message)  itemsAlreadyExists,}) {final _that = this;
switch (_that) {
case AddProductStateInitial():
return initial();case AddProductStateLoading():
return loading();case AddProductStateSuccess():
return success();case AddProductStateError():
return error(_that.message);case AddProductStateItemsAlreadyExists():
return itemsAlreadyExists(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String message)?  error,TResult? Function( String message)?  itemsAlreadyExists,}) {final _that = this;
switch (_that) {
case AddProductStateInitial() when initial != null:
return initial();case AddProductStateLoading() when loading != null:
return loading();case AddProductStateSuccess() when success != null:
return success();case AddProductStateError() when error != null:
return error(_that.message);case AddProductStateItemsAlreadyExists() when itemsAlreadyExists != null:
return itemsAlreadyExists(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AddProductStateInitial implements AddProductState {
  const AddProductStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddProductStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddProductState.initial()';
}


}




/// @nodoc


class AddProductStateLoading implements AddProductState {
  const AddProductStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddProductStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddProductState.loading()';
}


}




/// @nodoc


class AddProductStateSuccess implements AddProductState {
  const AddProductStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddProductStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddProductState.success()';
}


}




/// @nodoc


class AddProductStateError implements AddProductState {
  const AddProductStateError(this.message);
  

 final  String message;

/// Create a copy of AddProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddProductStateErrorCopyWith<AddProductStateError> get copyWith => _$AddProductStateErrorCopyWithImpl<AddProductStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddProductStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AddProductState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AddProductStateErrorCopyWith<$Res> implements $AddProductStateCopyWith<$Res> {
  factory $AddProductStateErrorCopyWith(AddProductStateError value, $Res Function(AddProductStateError) _then) = _$AddProductStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AddProductStateErrorCopyWithImpl<$Res>
    implements $AddProductStateErrorCopyWith<$Res> {
  _$AddProductStateErrorCopyWithImpl(this._self, this._then);

  final AddProductStateError _self;
  final $Res Function(AddProductStateError) _then;

/// Create a copy of AddProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AddProductStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddProductStateItemsAlreadyExists implements AddProductState {
  const AddProductStateItemsAlreadyExists(this.message);
  

 final  String message;

/// Create a copy of AddProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddProductStateItemsAlreadyExistsCopyWith<AddProductStateItemsAlreadyExists> get copyWith => _$AddProductStateItemsAlreadyExistsCopyWithImpl<AddProductStateItemsAlreadyExists>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddProductStateItemsAlreadyExists&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AddProductState.itemsAlreadyExists(message: $message)';
}


}

/// @nodoc
abstract mixin class $AddProductStateItemsAlreadyExistsCopyWith<$Res> implements $AddProductStateCopyWith<$Res> {
  factory $AddProductStateItemsAlreadyExistsCopyWith(AddProductStateItemsAlreadyExists value, $Res Function(AddProductStateItemsAlreadyExists) _then) = _$AddProductStateItemsAlreadyExistsCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AddProductStateItemsAlreadyExistsCopyWithImpl<$Res>
    implements $AddProductStateItemsAlreadyExistsCopyWith<$Res> {
  _$AddProductStateItemsAlreadyExistsCopyWithImpl(this._self, this._then);

  final AddProductStateItemsAlreadyExists _self;
  final $Res Function(AddProductStateItemsAlreadyExists) _then;

/// Create a copy of AddProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AddProductStateItemsAlreadyExists(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
