// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductModel {

 int? get id; String? get locale; String? get nameAr; String? get nameEn; String? get nameKu; String? get descriptionAr; String? get descriptionEn; String? get descriptionKu; double get price;@FileJsonConverter() File? get imagePath; double? get quantity; double? get discount; ProductTypeEnum? get productType; double? get costPrice;
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductModelCopyWith<ProductModel> get copyWith => _$ProductModelCopyWithImpl<ProductModel>(this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.nameAr, nameAr) || other.nameAr == nameAr)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.nameKu, nameKu) || other.nameKu == nameKu)&&(identical(other.descriptionAr, descriptionAr) || other.descriptionAr == descriptionAr)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.descriptionKu, descriptionKu) || other.descriptionKu == descriptionKu)&&(identical(other.price, price) || other.price == price)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.productType, productType) || other.productType == productType)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,locale,nameAr,nameEn,nameKu,descriptionAr,descriptionEn,descriptionKu,price,imagePath,quantity,discount,productType,costPrice);

@override
String toString() {
  return 'ProductModel(id: $id, locale: $locale, nameAr: $nameAr, nameEn: $nameEn, nameKu: $nameKu, descriptionAr: $descriptionAr, descriptionEn: $descriptionEn, descriptionKu: $descriptionKu, price: $price, imagePath: $imagePath, quantity: $quantity, discount: $discount, productType: $productType, costPrice: $costPrice)';
}


}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res>  {
  factory $ProductModelCopyWith(ProductModel value, $Res Function(ProductModel) _then) = _$ProductModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? locale, String? nameAr, String? nameEn, String? nameKu, String? descriptionAr, String? descriptionEn, String? descriptionKu, double price,@FileJsonConverter() File? imagePath, double? quantity, double? discount, ProductTypeEnum? productType, double? costPrice
});




}
/// @nodoc
class _$ProductModelCopyWithImpl<$Res>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? locale = freezed,Object? nameAr = freezed,Object? nameEn = freezed,Object? nameKu = freezed,Object? descriptionAr = freezed,Object? descriptionEn = freezed,Object? descriptionKu = freezed,Object? price = null,Object? imagePath = freezed,Object? quantity = freezed,Object? discount = freezed,Object? productType = freezed,Object? costPrice = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,nameAr: freezed == nameAr ? _self.nameAr : nameAr // ignore: cast_nullable_to_non_nullable
as String?,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,nameKu: freezed == nameKu ? _self.nameKu : nameKu // ignore: cast_nullable_to_non_nullable
as String?,descriptionAr: freezed == descriptionAr ? _self.descriptionAr : descriptionAr // ignore: cast_nullable_to_non_nullable
as String?,descriptionEn: freezed == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String?,descriptionKu: freezed == descriptionKu ? _self.descriptionKu : descriptionKu // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as File?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double?,productType: freezed == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as ProductTypeEnum?,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? locale,  String? nameAr,  String? nameEn,  String? nameKu,  String? descriptionAr,  String? descriptionEn,  String? descriptionKu,  double price, @FileJsonConverter()  File? imagePath,  double? quantity,  double? discount,  ProductTypeEnum? productType,  double? costPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.locale,_that.nameAr,_that.nameEn,_that.nameKu,_that.descriptionAr,_that.descriptionEn,_that.descriptionKu,_that.price,_that.imagePath,_that.quantity,_that.discount,_that.productType,_that.costPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? locale,  String? nameAr,  String? nameEn,  String? nameKu,  String? descriptionAr,  String? descriptionEn,  String? descriptionKu,  double price, @FileJsonConverter()  File? imagePath,  double? quantity,  double? discount,  ProductTypeEnum? productType,  double? costPrice)  $default,) {final _that = this;
switch (_that) {
case _ProductModel():
return $default(_that.id,_that.locale,_that.nameAr,_that.nameEn,_that.nameKu,_that.descriptionAr,_that.descriptionEn,_that.descriptionKu,_that.price,_that.imagePath,_that.quantity,_that.discount,_that.productType,_that.costPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? locale,  String? nameAr,  String? nameEn,  String? nameKu,  String? descriptionAr,  String? descriptionEn,  String? descriptionKu,  double price, @FileJsonConverter()  File? imagePath,  double? quantity,  double? discount,  ProductTypeEnum? productType,  double? costPrice)?  $default,) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.locale,_that.nameAr,_that.nameEn,_that.nameKu,_that.descriptionAr,_that.descriptionEn,_that.descriptionKu,_that.price,_that.imagePath,_that.quantity,_that.discount,_that.productType,_that.costPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductModel implements ProductModel {
  const _ProductModel({this.id = 0, this.locale = "ar", this.nameAr = "", this.nameEn = "", this.nameKu = null, this.descriptionAr = "", this.descriptionEn = "", this.descriptionKu = "", this.price = 0.0, @FileJsonConverter() this.imagePath, this.quantity = 0.0, this.discount = 0.0, this.productType = ProductTypeEnum.foodAndBeverage, this.costPrice = 0.0});
  factory _ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

@override@JsonKey() final  int? id;
@override@JsonKey() final  String? locale;
@override@JsonKey() final  String? nameAr;
@override@JsonKey() final  String? nameEn;
@override@JsonKey() final  String? nameKu;
@override@JsonKey() final  String? descriptionAr;
@override@JsonKey() final  String? descriptionEn;
@override@JsonKey() final  String? descriptionKu;
@override@JsonKey() final  double price;
@override@FileJsonConverter() final  File? imagePath;
@override@JsonKey() final  double? quantity;
@override@JsonKey() final  double? discount;
@override@JsonKey() final  ProductTypeEnum? productType;
@override@JsonKey() final  double? costPrice;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductModelCopyWith<_ProductModel> get copyWith => __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.nameAr, nameAr) || other.nameAr == nameAr)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.nameKu, nameKu) || other.nameKu == nameKu)&&(identical(other.descriptionAr, descriptionAr) || other.descriptionAr == descriptionAr)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.descriptionKu, descriptionKu) || other.descriptionKu == descriptionKu)&&(identical(other.price, price) || other.price == price)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.productType, productType) || other.productType == productType)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,locale,nameAr,nameEn,nameKu,descriptionAr,descriptionEn,descriptionKu,price,imagePath,quantity,discount,productType,costPrice);

@override
String toString() {
  return 'ProductModel(id: $id, locale: $locale, nameAr: $nameAr, nameEn: $nameEn, nameKu: $nameKu, descriptionAr: $descriptionAr, descriptionEn: $descriptionEn, descriptionKu: $descriptionKu, price: $price, imagePath: $imagePath, quantity: $quantity, discount: $discount, productType: $productType, costPrice: $costPrice)';
}


}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res> implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(_ProductModel value, $Res Function(_ProductModel) _then) = __$ProductModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? locale, String? nameAr, String? nameEn, String? nameKu, String? descriptionAr, String? descriptionEn, String? descriptionKu, double price,@FileJsonConverter() File? imagePath, double? quantity, double? discount, ProductTypeEnum? productType, double? costPrice
});




}
/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? locale = freezed,Object? nameAr = freezed,Object? nameEn = freezed,Object? nameKu = freezed,Object? descriptionAr = freezed,Object? descriptionEn = freezed,Object? descriptionKu = freezed,Object? price = null,Object? imagePath = freezed,Object? quantity = freezed,Object? discount = freezed,Object? productType = freezed,Object? costPrice = freezed,}) {
  return _then(_ProductModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,nameAr: freezed == nameAr ? _self.nameAr : nameAr // ignore: cast_nullable_to_non_nullable
as String?,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,nameKu: freezed == nameKu ? _self.nameKu : nameKu // ignore: cast_nullable_to_non_nullable
as String?,descriptionAr: freezed == descriptionAr ? _self.descriptionAr : descriptionAr // ignore: cast_nullable_to_non_nullable
as String?,descriptionEn: freezed == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String?,descriptionKu: freezed == descriptionKu ? _self.descriptionKu : descriptionKu // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as File?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double?,productType: freezed == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as ProductTypeEnum?,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
