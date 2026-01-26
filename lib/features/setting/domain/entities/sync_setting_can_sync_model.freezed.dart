// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_setting_can_sync_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
SyncSettingCanSyncModel _$SyncSettingCanSyncModelFromJson(
  Map<String, dynamic> json
) {
    return $SyncSettingCanSyncModel.fromJson(
      json
    );
}

/// @nodoc
mixin _$SyncSettingCanSyncModel {

 bool get auto; bool get tables; bool get charts; bool get items; bool get salesmanNames; bool get salesmanLocations; bool get salesmanClients; bool get rule;
/// Create a copy of SyncSettingCanSyncModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncSettingCanSyncModelCopyWith<SyncSettingCanSyncModel> get copyWith => _$SyncSettingCanSyncModelCopyWithImpl<SyncSettingCanSyncModel>(this as SyncSettingCanSyncModel, _$identity);

  /// Serializes this SyncSettingCanSyncModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncSettingCanSyncModel&&(identical(other.auto, auto) || other.auto == auto)&&(identical(other.tables, tables) || other.tables == tables)&&(identical(other.charts, charts) || other.charts == charts)&&(identical(other.items, items) || other.items == items)&&(identical(other.salesmanNames, salesmanNames) || other.salesmanNames == salesmanNames)&&(identical(other.salesmanLocations, salesmanLocations) || other.salesmanLocations == salesmanLocations)&&(identical(other.salesmanClients, salesmanClients) || other.salesmanClients == salesmanClients)&&(identical(other.rule, rule) || other.rule == rule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,auto,tables,charts,items,salesmanNames,salesmanLocations,salesmanClients,rule);

@override
String toString() {
  return 'SyncSettingCanSyncModel(auto: $auto, tables: $tables, charts: $charts, items: $items, salesmanNames: $salesmanNames, salesmanLocations: $salesmanLocations, salesmanClients: $salesmanClients, rule: $rule)';
}


}

/// @nodoc
abstract mixin class $SyncSettingCanSyncModelCopyWith<$Res>  {
  factory $SyncSettingCanSyncModelCopyWith(SyncSettingCanSyncModel value, $Res Function(SyncSettingCanSyncModel) _then) = _$SyncSettingCanSyncModelCopyWithImpl;
@useResult
$Res call({
 bool auto, bool tables, bool charts, bool items, bool salesmanNames, bool salesmanLocations, bool salesmanClients, bool rule
});




}
/// @nodoc
class _$SyncSettingCanSyncModelCopyWithImpl<$Res>
    implements $SyncSettingCanSyncModelCopyWith<$Res> {
  _$SyncSettingCanSyncModelCopyWithImpl(this._self, this._then);

  final SyncSettingCanSyncModel _self;
  final $Res Function(SyncSettingCanSyncModel) _then;

/// Create a copy of SyncSettingCanSyncModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? auto = null,Object? tables = null,Object? charts = null,Object? items = null,Object? salesmanNames = null,Object? salesmanLocations = null,Object? salesmanClients = null,Object? rule = null,}) {
  return _then(_self.copyWith(
auto: null == auto ? _self.auto : auto // ignore: cast_nullable_to_non_nullable
as bool,tables: null == tables ? _self.tables : tables // ignore: cast_nullable_to_non_nullable
as bool,charts: null == charts ? _self.charts : charts // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as bool,salesmanNames: null == salesmanNames ? _self.salesmanNames : salesmanNames // ignore: cast_nullable_to_non_nullable
as bool,salesmanLocations: null == salesmanLocations ? _self.salesmanLocations : salesmanLocations // ignore: cast_nullable_to_non_nullable
as bool,salesmanClients: null == salesmanClients ? _self.salesmanClients : salesmanClients // ignore: cast_nullable_to_non_nullable
as bool,rule: null == rule ? _self.rule : rule // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncSettingCanSyncModel].
extension SyncSettingCanSyncModelPatterns on SyncSettingCanSyncModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( $SyncSettingCanSyncModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case $SyncSettingCanSyncModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( $SyncSettingCanSyncModel value)  $default,){
final _that = this;
switch (_that) {
case $SyncSettingCanSyncModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( $SyncSettingCanSyncModel value)?  $default,){
final _that = this;
switch (_that) {
case $SyncSettingCanSyncModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool auto,  bool tables,  bool charts,  bool items,  bool salesmanNames,  bool salesmanLocations,  bool salesmanClients,  bool rule)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case $SyncSettingCanSyncModel() when $default != null:
return $default(_that.auto,_that.tables,_that.charts,_that.items,_that.salesmanNames,_that.salesmanLocations,_that.salesmanClients,_that.rule);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool auto,  bool tables,  bool charts,  bool items,  bool salesmanNames,  bool salesmanLocations,  bool salesmanClients,  bool rule)  $default,) {final _that = this;
switch (_that) {
case $SyncSettingCanSyncModel():
return $default(_that.auto,_that.tables,_that.charts,_that.items,_that.salesmanNames,_that.salesmanLocations,_that.salesmanClients,_that.rule);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool auto,  bool tables,  bool charts,  bool items,  bool salesmanNames,  bool salesmanLocations,  bool salesmanClients,  bool rule)?  $default,) {final _that = this;
switch (_that) {
case $SyncSettingCanSyncModel() when $default != null:
return $default(_that.auto,_that.tables,_that.charts,_that.items,_that.salesmanNames,_that.salesmanLocations,_that.salesmanClients,_that.rule);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class $SyncSettingCanSyncModel implements SyncSettingCanSyncModel {
  const $SyncSettingCanSyncModel({this.auto = false, this.tables = false, this.charts = false, this.items = false, this.salesmanNames = false, this.salesmanLocations = false, this.salesmanClients = false, this.rule = false});
  factory $SyncSettingCanSyncModel.fromJson(Map<String, dynamic> json) => _$$SyncSettingCanSyncModelFromJson(json);

@override@JsonKey() final  bool auto;
@override@JsonKey() final  bool tables;
@override@JsonKey() final  bool charts;
@override@JsonKey() final  bool items;
@override@JsonKey() final  bool salesmanNames;
@override@JsonKey() final  bool salesmanLocations;
@override@JsonKey() final  bool salesmanClients;
@override@JsonKey() final  bool rule;

/// Create a copy of SyncSettingCanSyncModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$SyncSettingCanSyncModelCopyWith<$SyncSettingCanSyncModel> get copyWith => _$$SyncSettingCanSyncModelCopyWithImpl<$SyncSettingCanSyncModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$$SyncSettingCanSyncModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $SyncSettingCanSyncModel&&(identical(other.auto, auto) || other.auto == auto)&&(identical(other.tables, tables) || other.tables == tables)&&(identical(other.charts, charts) || other.charts == charts)&&(identical(other.items, items) || other.items == items)&&(identical(other.salesmanNames, salesmanNames) || other.salesmanNames == salesmanNames)&&(identical(other.salesmanLocations, salesmanLocations) || other.salesmanLocations == salesmanLocations)&&(identical(other.salesmanClients, salesmanClients) || other.salesmanClients == salesmanClients)&&(identical(other.rule, rule) || other.rule == rule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,auto,tables,charts,items,salesmanNames,salesmanLocations,salesmanClients,rule);

@override
String toString() {
  return 'SyncSettingCanSyncModel(auto: $auto, tables: $tables, charts: $charts, items: $items, salesmanNames: $salesmanNames, salesmanLocations: $salesmanLocations, salesmanClients: $salesmanClients, rule: $rule)';
}


}

/// @nodoc
abstract mixin class $$SyncSettingCanSyncModelCopyWith<$Res> implements $SyncSettingCanSyncModelCopyWith<$Res> {
  factory $$SyncSettingCanSyncModelCopyWith($SyncSettingCanSyncModel value, $Res Function($SyncSettingCanSyncModel) _then) = _$$SyncSettingCanSyncModelCopyWithImpl;
@override @useResult
$Res call({
 bool auto, bool tables, bool charts, bool items, bool salesmanNames, bool salesmanLocations, bool salesmanClients, bool rule
});




}
/// @nodoc
class _$$SyncSettingCanSyncModelCopyWithImpl<$Res>
    implements $$SyncSettingCanSyncModelCopyWith<$Res> {
  _$$SyncSettingCanSyncModelCopyWithImpl(this._self, this._then);

  final $SyncSettingCanSyncModel _self;
  final $Res Function($SyncSettingCanSyncModel) _then;

/// Create a copy of SyncSettingCanSyncModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? auto = null,Object? tables = null,Object? charts = null,Object? items = null,Object? salesmanNames = null,Object? salesmanLocations = null,Object? salesmanClients = null,Object? rule = null,}) {
  return _then($SyncSettingCanSyncModel(
auto: null == auto ? _self.auto : auto // ignore: cast_nullable_to_non_nullable
as bool,tables: null == tables ? _self.tables : tables // ignore: cast_nullable_to_non_nullable
as bool,charts: null == charts ? _self.charts : charts // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as bool,salesmanNames: null == salesmanNames ? _self.salesmanNames : salesmanNames // ignore: cast_nullable_to_non_nullable
as bool,salesmanLocations: null == salesmanLocations ? _self.salesmanLocations : salesmanLocations // ignore: cast_nullable_to_non_nullable
as bool,salesmanClients: null == salesmanClients ? _self.salesmanClients : salesmanClients // ignore: cast_nullable_to_non_nullable
as bool,rule: null == rule ? _self.rule : rule // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
