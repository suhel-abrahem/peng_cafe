// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_setting_date_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
SyncSettingDateModel _$SyncSettingDateModelFromJson(
  Map<String, dynamic> json
) {
    return $SyncSettingDateModel.fromJson(
      json
    );
}

/// @nodoc
mixin _$SyncSettingDateModel {

 String get auto; String get tables; String get charts; String get items; String get salesmanNames; String get salesmanLocations; String get salesmanClients;
/// Create a copy of SyncSettingDateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncSettingDateModelCopyWith<SyncSettingDateModel> get copyWith => _$SyncSettingDateModelCopyWithImpl<SyncSettingDateModel>(this as SyncSettingDateModel, _$identity);

  /// Serializes this SyncSettingDateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncSettingDateModel&&(identical(other.auto, auto) || other.auto == auto)&&(identical(other.tables, tables) || other.tables == tables)&&(identical(other.charts, charts) || other.charts == charts)&&(identical(other.items, items) || other.items == items)&&(identical(other.salesmanNames, salesmanNames) || other.salesmanNames == salesmanNames)&&(identical(other.salesmanLocations, salesmanLocations) || other.salesmanLocations == salesmanLocations)&&(identical(other.salesmanClients, salesmanClients) || other.salesmanClients == salesmanClients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,auto,tables,charts,items,salesmanNames,salesmanLocations,salesmanClients);

@override
String toString() {
  return 'SyncSettingDateModel(auto: $auto, tables: $tables, charts: $charts, items: $items, salesmanNames: $salesmanNames, salesmanLocations: $salesmanLocations, salesmanClients: $salesmanClients)';
}


}

/// @nodoc
abstract mixin class $SyncSettingDateModelCopyWith<$Res>  {
  factory $SyncSettingDateModelCopyWith(SyncSettingDateModel value, $Res Function(SyncSettingDateModel) _then) = _$SyncSettingDateModelCopyWithImpl;
@useResult
$Res call({
 String auto, String tables, String charts, String items, String salesmanNames, String salesmanLocations, String salesmanClients
});




}
/// @nodoc
class _$SyncSettingDateModelCopyWithImpl<$Res>
    implements $SyncSettingDateModelCopyWith<$Res> {
  _$SyncSettingDateModelCopyWithImpl(this._self, this._then);

  final SyncSettingDateModel _self;
  final $Res Function(SyncSettingDateModel) _then;

/// Create a copy of SyncSettingDateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? auto = null,Object? tables = null,Object? charts = null,Object? items = null,Object? salesmanNames = null,Object? salesmanLocations = null,Object? salesmanClients = null,}) {
  return _then(_self.copyWith(
auto: null == auto ? _self.auto : auto // ignore: cast_nullable_to_non_nullable
as String,tables: null == tables ? _self.tables : tables // ignore: cast_nullable_to_non_nullable
as String,charts: null == charts ? _self.charts : charts // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as String,salesmanNames: null == salesmanNames ? _self.salesmanNames : salesmanNames // ignore: cast_nullable_to_non_nullable
as String,salesmanLocations: null == salesmanLocations ? _self.salesmanLocations : salesmanLocations // ignore: cast_nullable_to_non_nullable
as String,salesmanClients: null == salesmanClients ? _self.salesmanClients : salesmanClients // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncSettingDateModel].
extension SyncSettingDateModelPatterns on SyncSettingDateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( $SyncSettingDateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case $SyncSettingDateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( $SyncSettingDateModel value)  $default,){
final _that = this;
switch (_that) {
case $SyncSettingDateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( $SyncSettingDateModel value)?  $default,){
final _that = this;
switch (_that) {
case $SyncSettingDateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String auto,  String tables,  String charts,  String items,  String salesmanNames,  String salesmanLocations,  String salesmanClients)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case $SyncSettingDateModel() when $default != null:
return $default(_that.auto,_that.tables,_that.charts,_that.items,_that.salesmanNames,_that.salesmanLocations,_that.salesmanClients);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String auto,  String tables,  String charts,  String items,  String salesmanNames,  String salesmanLocations,  String salesmanClients)  $default,) {final _that = this;
switch (_that) {
case $SyncSettingDateModel():
return $default(_that.auto,_that.tables,_that.charts,_that.items,_that.salesmanNames,_that.salesmanLocations,_that.salesmanClients);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String auto,  String tables,  String charts,  String items,  String salesmanNames,  String salesmanLocations,  String salesmanClients)?  $default,) {final _that = this;
switch (_that) {
case $SyncSettingDateModel() when $default != null:
return $default(_that.auto,_that.tables,_that.charts,_that.items,_that.salesmanNames,_that.salesmanLocations,_that.salesmanClients);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class $SyncSettingDateModel implements SyncSettingDateModel {
  const $SyncSettingDateModel({this.auto = '', this.tables = '', this.charts = '', this.items = '', this.salesmanNames = '', this.salesmanLocations = '', this.salesmanClients = ''});
  factory $SyncSettingDateModel.fromJson(Map<String, dynamic> json) => _$$SyncSettingDateModelFromJson(json);

@override@JsonKey() final  String auto;
@override@JsonKey() final  String tables;
@override@JsonKey() final  String charts;
@override@JsonKey() final  String items;
@override@JsonKey() final  String salesmanNames;
@override@JsonKey() final  String salesmanLocations;
@override@JsonKey() final  String salesmanClients;

/// Create a copy of SyncSettingDateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$SyncSettingDateModelCopyWith<$SyncSettingDateModel> get copyWith => _$$SyncSettingDateModelCopyWithImpl<$SyncSettingDateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$$SyncSettingDateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $SyncSettingDateModel&&(identical(other.auto, auto) || other.auto == auto)&&(identical(other.tables, tables) || other.tables == tables)&&(identical(other.charts, charts) || other.charts == charts)&&(identical(other.items, items) || other.items == items)&&(identical(other.salesmanNames, salesmanNames) || other.salesmanNames == salesmanNames)&&(identical(other.salesmanLocations, salesmanLocations) || other.salesmanLocations == salesmanLocations)&&(identical(other.salesmanClients, salesmanClients) || other.salesmanClients == salesmanClients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,auto,tables,charts,items,salesmanNames,salesmanLocations,salesmanClients);

@override
String toString() {
  return 'SyncSettingDateModel(auto: $auto, tables: $tables, charts: $charts, items: $items, salesmanNames: $salesmanNames, salesmanLocations: $salesmanLocations, salesmanClients: $salesmanClients)';
}


}

/// @nodoc
abstract mixin class $$SyncSettingDateModelCopyWith<$Res> implements $SyncSettingDateModelCopyWith<$Res> {
  factory $$SyncSettingDateModelCopyWith($SyncSettingDateModel value, $Res Function($SyncSettingDateModel) _then) = _$$SyncSettingDateModelCopyWithImpl;
@override @useResult
$Res call({
 String auto, String tables, String charts, String items, String salesmanNames, String salesmanLocations, String salesmanClients
});




}
/// @nodoc
class _$$SyncSettingDateModelCopyWithImpl<$Res>
    implements $$SyncSettingDateModelCopyWith<$Res> {
  _$$SyncSettingDateModelCopyWithImpl(this._self, this._then);

  final $SyncSettingDateModel _self;
  final $Res Function($SyncSettingDateModel) _then;

/// Create a copy of SyncSettingDateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? auto = null,Object? tables = null,Object? charts = null,Object? items = null,Object? salesmanNames = null,Object? salesmanLocations = null,Object? salesmanClients = null,}) {
  return _then($SyncSettingDateModel(
auto: null == auto ? _self.auto : auto // ignore: cast_nullable_to_non_nullable
as String,tables: null == tables ? _self.tables : tables // ignore: cast_nullable_to_non_nullable
as String,charts: null == charts ? _self.charts : charts // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as String,salesmanNames: null == salesmanNames ? _self.salesmanNames : salesmanNames // ignore: cast_nullable_to_non_nullable
as String,salesmanLocations: null == salesmanLocations ? _self.salesmanLocations : salesmanLocations // ignore: cast_nullable_to_non_nullable
as String,salesmanClients: null == salesmanClients ? _self.salesmanClients : salesmanClients // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
