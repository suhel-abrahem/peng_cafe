// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncSettingModel {

 String get auto; String get tables; String get charts; String get items; String get deliveryNames; String get deliveryLocations; String get deliveryClients; String get rule;
/// Create a copy of SyncSettingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncSettingModelCopyWith<SyncSettingModel> get copyWith => _$SyncSettingModelCopyWithImpl<SyncSettingModel>(this as SyncSettingModel, _$identity);

  /// Serializes this SyncSettingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncSettingModel&&(identical(other.auto, auto) || other.auto == auto)&&(identical(other.tables, tables) || other.tables == tables)&&(identical(other.charts, charts) || other.charts == charts)&&(identical(other.items, items) || other.items == items)&&(identical(other.deliveryNames, deliveryNames) || other.deliveryNames == deliveryNames)&&(identical(other.deliveryLocations, deliveryLocations) || other.deliveryLocations == deliveryLocations)&&(identical(other.deliveryClients, deliveryClients) || other.deliveryClients == deliveryClients)&&(identical(other.rule, rule) || other.rule == rule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,auto,tables,charts,items,deliveryNames,deliveryLocations,deliveryClients,rule);

@override
String toString() {
  return 'SyncSettingModel(auto: $auto, tables: $tables, charts: $charts, items: $items, deliveryNames: $deliveryNames, deliveryLocations: $deliveryLocations, deliveryClients: $deliveryClients, rule: $rule)';
}


}

/// @nodoc
abstract mixin class $SyncSettingModelCopyWith<$Res>  {
  factory $SyncSettingModelCopyWith(SyncSettingModel value, $Res Function(SyncSettingModel) _then) = _$SyncSettingModelCopyWithImpl;
@useResult
$Res call({
 String auto, String tables, String charts, String items, String deliveryNames, String deliveryLocations, String deliveryClients, String rule
});




}
/// @nodoc
class _$SyncSettingModelCopyWithImpl<$Res>
    implements $SyncSettingModelCopyWith<$Res> {
  _$SyncSettingModelCopyWithImpl(this._self, this._then);

  final SyncSettingModel _self;
  final $Res Function(SyncSettingModel) _then;

/// Create a copy of SyncSettingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? auto = null,Object? tables = null,Object? charts = null,Object? items = null,Object? deliveryNames = null,Object? deliveryLocations = null,Object? deliveryClients = null,Object? rule = null,}) {
  return _then(_self.copyWith(
auto: null == auto ? _self.auto : auto // ignore: cast_nullable_to_non_nullable
as String,tables: null == tables ? _self.tables : tables // ignore: cast_nullable_to_non_nullable
as String,charts: null == charts ? _self.charts : charts // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as String,deliveryNames: null == deliveryNames ? _self.deliveryNames : deliveryNames // ignore: cast_nullable_to_non_nullable
as String,deliveryLocations: null == deliveryLocations ? _self.deliveryLocations : deliveryLocations // ignore: cast_nullable_to_non_nullable
as String,deliveryClients: null == deliveryClients ? _self.deliveryClients : deliveryClients // ignore: cast_nullable_to_non_nullable
as String,rule: null == rule ? _self.rule : rule // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncSettingModel].
extension SyncSettingModelPatterns on SyncSettingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncSettingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncSettingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncSettingModel value)  $default,){
final _that = this;
switch (_that) {
case _SyncSettingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncSettingModel value)?  $default,){
final _that = this;
switch (_that) {
case _SyncSettingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String auto,  String tables,  String charts,  String items,  String deliveryNames,  String deliveryLocations,  String deliveryClients,  String rule)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncSettingModel() when $default != null:
return $default(_that.auto,_that.tables,_that.charts,_that.items,_that.deliveryNames,_that.deliveryLocations,_that.deliveryClients,_that.rule);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String auto,  String tables,  String charts,  String items,  String deliveryNames,  String deliveryLocations,  String deliveryClients,  String rule)  $default,) {final _that = this;
switch (_that) {
case _SyncSettingModel():
return $default(_that.auto,_that.tables,_that.charts,_that.items,_that.deliveryNames,_that.deliveryLocations,_that.deliveryClients,_that.rule);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String auto,  String tables,  String charts,  String items,  String deliveryNames,  String deliveryLocations,  String deliveryClients,  String rule)?  $default,) {final _that = this;
switch (_that) {
case _SyncSettingModel() when $default != null:
return $default(_that.auto,_that.tables,_that.charts,_that.items,_that.deliveryNames,_that.deliveryLocations,_that.deliveryClients,_that.rule);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SyncSettingModel implements SyncSettingModel {
   _SyncSettingModel({this.auto = 'never', this.tables = 'never', this.charts = 'never', this.items = 'never', this.deliveryNames = 'never', this.deliveryLocations = 'never', this.deliveryClients = 'never', this.rule = 'never'});
  factory _SyncSettingModel.fromJson(Map<String, dynamic> json) => _$SyncSettingModelFromJson(json);

@override@JsonKey() final  String auto;
@override@JsonKey() final  String tables;
@override@JsonKey() final  String charts;
@override@JsonKey() final  String items;
@override@JsonKey() final  String deliveryNames;
@override@JsonKey() final  String deliveryLocations;
@override@JsonKey() final  String deliveryClients;
@override@JsonKey() final  String rule;

/// Create a copy of SyncSettingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncSettingModelCopyWith<_SyncSettingModel> get copyWith => __$SyncSettingModelCopyWithImpl<_SyncSettingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyncSettingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncSettingModel&&(identical(other.auto, auto) || other.auto == auto)&&(identical(other.tables, tables) || other.tables == tables)&&(identical(other.charts, charts) || other.charts == charts)&&(identical(other.items, items) || other.items == items)&&(identical(other.deliveryNames, deliveryNames) || other.deliveryNames == deliveryNames)&&(identical(other.deliveryLocations, deliveryLocations) || other.deliveryLocations == deliveryLocations)&&(identical(other.deliveryClients, deliveryClients) || other.deliveryClients == deliveryClients)&&(identical(other.rule, rule) || other.rule == rule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,auto,tables,charts,items,deliveryNames,deliveryLocations,deliveryClients,rule);

@override
String toString() {
  return 'SyncSettingModel(auto: $auto, tables: $tables, charts: $charts, items: $items, deliveryNames: $deliveryNames, deliveryLocations: $deliveryLocations, deliveryClients: $deliveryClients, rule: $rule)';
}


}

/// @nodoc
abstract mixin class _$SyncSettingModelCopyWith<$Res> implements $SyncSettingModelCopyWith<$Res> {
  factory _$SyncSettingModelCopyWith(_SyncSettingModel value, $Res Function(_SyncSettingModel) _then) = __$SyncSettingModelCopyWithImpl;
@override @useResult
$Res call({
 String auto, String tables, String charts, String items, String deliveryNames, String deliveryLocations, String deliveryClients, String rule
});




}
/// @nodoc
class __$SyncSettingModelCopyWithImpl<$Res>
    implements _$SyncSettingModelCopyWith<$Res> {
  __$SyncSettingModelCopyWithImpl(this._self, this._then);

  final _SyncSettingModel _self;
  final $Res Function(_SyncSettingModel) _then;

/// Create a copy of SyncSettingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? auto = null,Object? tables = null,Object? charts = null,Object? items = null,Object? deliveryNames = null,Object? deliveryLocations = null,Object? deliveryClients = null,Object? rule = null,}) {
  return _then(_SyncSettingModel(
auto: null == auto ? _self.auto : auto // ignore: cast_nullable_to_non_nullable
as String,tables: null == tables ? _self.tables : tables // ignore: cast_nullable_to_non_nullable
as String,charts: null == charts ? _self.charts : charts // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as String,deliveryNames: null == deliveryNames ? _self.deliveryNames : deliveryNames // ignore: cast_nullable_to_non_nullable
as String,deliveryLocations: null == deliveryLocations ? _self.deliveryLocations : deliveryLocations // ignore: cast_nullable_to_non_nullable
as String,deliveryClients: null == deliveryClients ? _self.deliveryClients : deliveryClients // ignore: cast_nullable_to_non_nullable
as String,rule: null == rule ? _self.rule : rule // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
