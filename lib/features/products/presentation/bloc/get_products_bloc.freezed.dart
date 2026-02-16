// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_products_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetProductsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetProductsEvent()';
}


}

/// @nodoc
class $GetProductsEventCopyWith<$Res>  {
$GetProductsEventCopyWith(GetProductsEvent _, $Res Function(GetProductsEvent) __);
}


/// Adds pattern-matching-related methods to [GetProductsEvent].
extension GetProductsEventPatterns on GetProductsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetProductsEventStarted value)?  started,TResult Function( GetProductsEventGetProducts value)?  getProducts,TResult Function( GetProductsEventGetProduct value)?  getProduct,TResult Function( GetProductsEventSearchProducts value)?  searchProducts,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetProductsEventStarted() when started != null:
return started(_that);case GetProductsEventGetProducts() when getProducts != null:
return getProducts(_that);case GetProductsEventGetProduct() when getProduct != null:
return getProduct(_that);case GetProductsEventSearchProducts() when searchProducts != null:
return searchProducts(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetProductsEventStarted value)  started,required TResult Function( GetProductsEventGetProducts value)  getProducts,required TResult Function( GetProductsEventGetProduct value)  getProduct,required TResult Function( GetProductsEventSearchProducts value)  searchProducts,}){
final _that = this;
switch (_that) {
case GetProductsEventStarted():
return started(_that);case GetProductsEventGetProducts():
return getProducts(_that);case GetProductsEventGetProduct():
return getProduct(_that);case GetProductsEventSearchProducts():
return searchProducts(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetProductsEventStarted value)?  started,TResult? Function( GetProductsEventGetProducts value)?  getProducts,TResult? Function( GetProductsEventGetProduct value)?  getProduct,TResult? Function( GetProductsEventSearchProducts value)?  searchProducts,}){
final _that = this;
switch (_that) {
case GetProductsEventStarted() when started != null:
return started(_that);case GetProductsEventGetProducts() when getProducts != null:
return getProducts(_that);case GetProductsEventGetProduct() when getProduct != null:
return getProduct(_that);case GetProductsEventSearchProducts() when searchProducts != null:
return searchProducts(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( ProductModel? productsModel)?  getProducts,TResult Function( ProductModel? productModel)?  getProduct,TResult Function( String query,  String locale)?  searchProducts,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetProductsEventStarted() when started != null:
return started();case GetProductsEventGetProducts() when getProducts != null:
return getProducts(_that.productsModel);case GetProductsEventGetProduct() when getProduct != null:
return getProduct(_that.productModel);case GetProductsEventSearchProducts() when searchProducts != null:
return searchProducts(_that.query,_that.locale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( ProductModel? productsModel)  getProducts,required TResult Function( ProductModel? productModel)  getProduct,required TResult Function( String query,  String locale)  searchProducts,}) {final _that = this;
switch (_that) {
case GetProductsEventStarted():
return started();case GetProductsEventGetProducts():
return getProducts(_that.productsModel);case GetProductsEventGetProduct():
return getProduct(_that.productModel);case GetProductsEventSearchProducts():
return searchProducts(_that.query,_that.locale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( ProductModel? productsModel)?  getProducts,TResult? Function( ProductModel? productModel)?  getProduct,TResult? Function( String query,  String locale)?  searchProducts,}) {final _that = this;
switch (_that) {
case GetProductsEventStarted() when started != null:
return started();case GetProductsEventGetProducts() when getProducts != null:
return getProducts(_that.productsModel);case GetProductsEventGetProduct() when getProduct != null:
return getProduct(_that.productModel);case GetProductsEventSearchProducts() when searchProducts != null:
return searchProducts(_that.query,_that.locale);case _:
  return null;

}
}

}

/// @nodoc


class GetProductsEventStarted implements GetProductsEvent {
  const GetProductsEventStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductsEventStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetProductsEvent.started()';
}


}




/// @nodoc


class GetProductsEventGetProducts implements GetProductsEvent {
  const GetProductsEventGetProducts({this.productsModel});
  

 final  ProductModel? productsModel;

/// Create a copy of GetProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProductsEventGetProductsCopyWith<GetProductsEventGetProducts> get copyWith => _$GetProductsEventGetProductsCopyWithImpl<GetProductsEventGetProducts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductsEventGetProducts&&(identical(other.productsModel, productsModel) || other.productsModel == productsModel));
}


@override
int get hashCode => Object.hash(runtimeType,productsModel);

@override
String toString() {
  return 'GetProductsEvent.getProducts(productsModel: $productsModel)';
}


}

/// @nodoc
abstract mixin class $GetProductsEventGetProductsCopyWith<$Res> implements $GetProductsEventCopyWith<$Res> {
  factory $GetProductsEventGetProductsCopyWith(GetProductsEventGetProducts value, $Res Function(GetProductsEventGetProducts) _then) = _$GetProductsEventGetProductsCopyWithImpl;
@useResult
$Res call({
 ProductModel? productsModel
});


$ProductModelCopyWith<$Res>? get productsModel;

}
/// @nodoc
class _$GetProductsEventGetProductsCopyWithImpl<$Res>
    implements $GetProductsEventGetProductsCopyWith<$Res> {
  _$GetProductsEventGetProductsCopyWithImpl(this._self, this._then);

  final GetProductsEventGetProducts _self;
  final $Res Function(GetProductsEventGetProducts) _then;

/// Create a copy of GetProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productsModel = freezed,}) {
  return _then(GetProductsEventGetProducts(
productsModel: freezed == productsModel ? _self.productsModel : productsModel // ignore: cast_nullable_to_non_nullable
as ProductModel?,
  ));
}

/// Create a copy of GetProductsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res>? get productsModel {
    if (_self.productsModel == null) {
    return null;
  }

  return $ProductModelCopyWith<$Res>(_self.productsModel!, (value) {
    return _then(_self.copyWith(productsModel: value));
  });
}
}

/// @nodoc


class GetProductsEventGetProduct implements GetProductsEvent {
  const GetProductsEventGetProduct({this.productModel});
  

 final  ProductModel? productModel;

/// Create a copy of GetProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProductsEventGetProductCopyWith<GetProductsEventGetProduct> get copyWith => _$GetProductsEventGetProductCopyWithImpl<GetProductsEventGetProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductsEventGetProduct&&(identical(other.productModel, productModel) || other.productModel == productModel));
}


@override
int get hashCode => Object.hash(runtimeType,productModel);

@override
String toString() {
  return 'GetProductsEvent.getProduct(productModel: $productModel)';
}


}

/// @nodoc
abstract mixin class $GetProductsEventGetProductCopyWith<$Res> implements $GetProductsEventCopyWith<$Res> {
  factory $GetProductsEventGetProductCopyWith(GetProductsEventGetProduct value, $Res Function(GetProductsEventGetProduct) _then) = _$GetProductsEventGetProductCopyWithImpl;
@useResult
$Res call({
 ProductModel? productModel
});


$ProductModelCopyWith<$Res>? get productModel;

}
/// @nodoc
class _$GetProductsEventGetProductCopyWithImpl<$Res>
    implements $GetProductsEventGetProductCopyWith<$Res> {
  _$GetProductsEventGetProductCopyWithImpl(this._self, this._then);

  final GetProductsEventGetProduct _self;
  final $Res Function(GetProductsEventGetProduct) _then;

/// Create a copy of GetProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productModel = freezed,}) {
  return _then(GetProductsEventGetProduct(
productModel: freezed == productModel ? _self.productModel : productModel // ignore: cast_nullable_to_non_nullable
as ProductModel?,
  ));
}

/// Create a copy of GetProductsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res>? get productModel {
    if (_self.productModel == null) {
    return null;
  }

  return $ProductModelCopyWith<$Res>(_self.productModel!, (value) {
    return _then(_self.copyWith(productModel: value));
  });
}
}

/// @nodoc


class GetProductsEventSearchProducts implements GetProductsEvent {
  const GetProductsEventSearchProducts({required this.query, required this.locale});
  

 final  String query;
 final  String locale;

/// Create a copy of GetProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProductsEventSearchProductsCopyWith<GetProductsEventSearchProducts> get copyWith => _$GetProductsEventSearchProductsCopyWithImpl<GetProductsEventSearchProducts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductsEventSearchProducts&&(identical(other.query, query) || other.query == query)&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,query,locale);

@override
String toString() {
  return 'GetProductsEvent.searchProducts(query: $query, locale: $locale)';
}


}

/// @nodoc
abstract mixin class $GetProductsEventSearchProductsCopyWith<$Res> implements $GetProductsEventCopyWith<$Res> {
  factory $GetProductsEventSearchProductsCopyWith(GetProductsEventSearchProducts value, $Res Function(GetProductsEventSearchProducts) _then) = _$GetProductsEventSearchProductsCopyWithImpl;
@useResult
$Res call({
 String query, String locale
});




}
/// @nodoc
class _$GetProductsEventSearchProductsCopyWithImpl<$Res>
    implements $GetProductsEventSearchProductsCopyWith<$Res> {
  _$GetProductsEventSearchProductsCopyWithImpl(this._self, this._then);

  final GetProductsEventSearchProducts _self;
  final $Res Function(GetProductsEventSearchProducts) _then;

/// Create a copy of GetProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,Object? locale = null,}) {
  return _then(GetProductsEventSearchProducts(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$GetProductsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetProductsState()';
}


}

/// @nodoc
class $GetProductsStateCopyWith<$Res>  {
$GetProductsStateCopyWith(GetProductsState _, $Res Function(GetProductsState) __);
}


/// Adds pattern-matching-related methods to [GetProductsState].
extension GetProductsStatePatterns on GetProductsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetProductsStateInitial value)?  initial,TResult Function( GetProductsStateLoading value)?  loading,TResult Function( GetProductsStateLoaded value)?  loaded,TResult Function( GetProductsStateNoData value)?  noData,TResult Function( GetProductsStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetProductsStateInitial() when initial != null:
return initial(_that);case GetProductsStateLoading() when loading != null:
return loading(_that);case GetProductsStateLoaded() when loaded != null:
return loaded(_that);case GetProductsStateNoData() when noData != null:
return noData(_that);case GetProductsStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetProductsStateInitial value)  initial,required TResult Function( GetProductsStateLoading value)  loading,required TResult Function( GetProductsStateLoaded value)  loaded,required TResult Function( GetProductsStateNoData value)  noData,required TResult Function( GetProductsStateError value)  error,}){
final _that = this;
switch (_that) {
case GetProductsStateInitial():
return initial(_that);case GetProductsStateLoading():
return loading(_that);case GetProductsStateLoaded():
return loaded(_that);case GetProductsStateNoData():
return noData(_that);case GetProductsStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetProductsStateInitial value)?  initial,TResult? Function( GetProductsStateLoading value)?  loading,TResult? Function( GetProductsStateLoaded value)?  loaded,TResult? Function( GetProductsStateNoData value)?  noData,TResult? Function( GetProductsStateError value)?  error,}){
final _that = this;
switch (_that) {
case GetProductsStateInitial() when initial != null:
return initial(_that);case GetProductsStateLoading() when loading != null:
return loading(_that);case GetProductsStateLoaded() when loaded != null:
return loaded(_that);case GetProductsStateNoData() when noData != null:
return noData(_that);case GetProductsStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProductEntity> products)?  loaded,TResult Function()?  noData,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetProductsStateInitial() when initial != null:
return initial();case GetProductsStateLoading() when loading != null:
return loading();case GetProductsStateLoaded() when loaded != null:
return loaded(_that.products);case GetProductsStateNoData() when noData != null:
return noData();case GetProductsStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProductEntity> products)  loaded,required TResult Function()  noData,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case GetProductsStateInitial():
return initial();case GetProductsStateLoading():
return loading();case GetProductsStateLoaded():
return loaded(_that.products);case GetProductsStateNoData():
return noData();case GetProductsStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProductEntity> products)?  loaded,TResult? Function()?  noData,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case GetProductsStateInitial() when initial != null:
return initial();case GetProductsStateLoading() when loading != null:
return loading();case GetProductsStateLoaded() when loaded != null:
return loaded(_that.products);case GetProductsStateNoData() when noData != null:
return noData();case GetProductsStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class GetProductsStateInitial implements GetProductsState {
  const GetProductsStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductsStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetProductsState.initial()';
}


}




/// @nodoc


class GetProductsStateLoading implements GetProductsState {
  const GetProductsStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductsStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetProductsState.loading()';
}


}




/// @nodoc


class GetProductsStateLoaded implements GetProductsState {
  const GetProductsStateLoaded(final  List<ProductEntity> products): _products = products;
  

 final  List<ProductEntity> _products;
 List<ProductEntity> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of GetProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProductsStateLoadedCopyWith<GetProductsStateLoaded> get copyWith => _$GetProductsStateLoadedCopyWithImpl<GetProductsStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductsStateLoaded&&const DeepCollectionEquality().equals(other._products, _products));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'GetProductsState.loaded(products: $products)';
}


}

/// @nodoc
abstract mixin class $GetProductsStateLoadedCopyWith<$Res> implements $GetProductsStateCopyWith<$Res> {
  factory $GetProductsStateLoadedCopyWith(GetProductsStateLoaded value, $Res Function(GetProductsStateLoaded) _then) = _$GetProductsStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<ProductEntity> products
});




}
/// @nodoc
class _$GetProductsStateLoadedCopyWithImpl<$Res>
    implements $GetProductsStateLoadedCopyWith<$Res> {
  _$GetProductsStateLoadedCopyWithImpl(this._self, this._then);

  final GetProductsStateLoaded _self;
  final $Res Function(GetProductsStateLoaded) _then;

/// Create a copy of GetProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,}) {
  return _then(GetProductsStateLoaded(
null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>,
  ));
}


}

/// @nodoc


class GetProductsStateNoData implements GetProductsState {
  const GetProductsStateNoData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductsStateNoData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetProductsState.noData()';
}


}




/// @nodoc


class GetProductsStateError implements GetProductsState {
  const GetProductsStateError(this.message);
  

 final  String message;

/// Create a copy of GetProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProductsStateErrorCopyWith<GetProductsStateError> get copyWith => _$GetProductsStateErrorCopyWithImpl<GetProductsStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductsStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'GetProductsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $GetProductsStateErrorCopyWith<$Res> implements $GetProductsStateCopyWith<$Res> {
  factory $GetProductsStateErrorCopyWith(GetProductsStateError value, $Res Function(GetProductsStateError) _then) = _$GetProductsStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$GetProductsStateErrorCopyWithImpl<$Res>
    implements $GetProductsStateErrorCopyWith<$Res> {
  _$GetProductsStateErrorCopyWithImpl(this._self, this._then);

  final GetProductsStateError _self;
  final $Res Function(GetProductsStateError) _then;

/// Create a copy of GetProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(GetProductsStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
