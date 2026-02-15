// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tables_types_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TablesTypesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TablesTypesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TablesTypesEvent()';
}


}

/// @nodoc
class $TablesTypesEventCopyWith<$Res>  {
$TablesTypesEventCopyWith(TablesTypesEvent _, $Res Function(TablesTypesEvent) __);
}


/// Adds pattern-matching-related methods to [TablesTypesEvent].
extension TablesTypesEventPatterns on TablesTypesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TablesTypesLoad value)?  load,TResult Function( TablesTypesToggleEdit value)?  toggleEdit,TResult Function( TablesTypesUpdateQuantity value)?  updateQuantity,TResult Function( TablesTypesToggleActivation value)?  toggleActivation,TResult Function( TablesTypesSave value)?  save,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TablesTypesLoad() when load != null:
return load(_that);case TablesTypesToggleEdit() when toggleEdit != null:
return toggleEdit(_that);case TablesTypesUpdateQuantity() when updateQuantity != null:
return updateQuantity(_that);case TablesTypesToggleActivation() when toggleActivation != null:
return toggleActivation(_that);case TablesTypesSave() when save != null:
return save(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TablesTypesLoad value)  load,required TResult Function( TablesTypesToggleEdit value)  toggleEdit,required TResult Function( TablesTypesUpdateQuantity value)  updateQuantity,required TResult Function( TablesTypesToggleActivation value)  toggleActivation,required TResult Function( TablesTypesSave value)  save,}){
final _that = this;
switch (_that) {
case TablesTypesLoad():
return load(_that);case TablesTypesToggleEdit():
return toggleEdit(_that);case TablesTypesUpdateQuantity():
return updateQuantity(_that);case TablesTypesToggleActivation():
return toggleActivation(_that);case TablesTypesSave():
return save(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TablesTypesLoad value)?  load,TResult? Function( TablesTypesToggleEdit value)?  toggleEdit,TResult? Function( TablesTypesUpdateQuantity value)?  updateQuantity,TResult? Function( TablesTypesToggleActivation value)?  toggleActivation,TResult? Function( TablesTypesSave value)?  save,}){
final _that = this;
switch (_that) {
case TablesTypesLoad() when load != null:
return load(_that);case TablesTypesToggleEdit() when toggleEdit != null:
return toggleEdit(_that);case TablesTypesUpdateQuantity() when updateQuantity != null:
return updateQuantity(_that);case TablesTypesToggleActivation() when toggleActivation != null:
return toggleActivation(_that);case TablesTypesSave() when save != null:
return save(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function()?  toggleEdit,TResult Function( TableTypeEnum tableName,  int quantity)?  updateQuantity,TResult Function( TableTypeEnum tableName,  bool isActive)?  toggleActivation,TResult Function()?  save,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TablesTypesLoad() when load != null:
return load();case TablesTypesToggleEdit() when toggleEdit != null:
return toggleEdit();case TablesTypesUpdateQuantity() when updateQuantity != null:
return updateQuantity(_that.tableName,_that.quantity);case TablesTypesToggleActivation() when toggleActivation != null:
return toggleActivation(_that.tableName,_that.isActive);case TablesTypesSave() when save != null:
return save();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function()  toggleEdit,required TResult Function( TableTypeEnum tableName,  int quantity)  updateQuantity,required TResult Function( TableTypeEnum tableName,  bool isActive)  toggleActivation,required TResult Function()  save,}) {final _that = this;
switch (_that) {
case TablesTypesLoad():
return load();case TablesTypesToggleEdit():
return toggleEdit();case TablesTypesUpdateQuantity():
return updateQuantity(_that.tableName,_that.quantity);case TablesTypesToggleActivation():
return toggleActivation(_that.tableName,_that.isActive);case TablesTypesSave():
return save();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function()?  toggleEdit,TResult? Function( TableTypeEnum tableName,  int quantity)?  updateQuantity,TResult? Function( TableTypeEnum tableName,  bool isActive)?  toggleActivation,TResult? Function()?  save,}) {final _that = this;
switch (_that) {
case TablesTypesLoad() when load != null:
return load();case TablesTypesToggleEdit() when toggleEdit != null:
return toggleEdit();case TablesTypesUpdateQuantity() when updateQuantity != null:
return updateQuantity(_that.tableName,_that.quantity);case TablesTypesToggleActivation() when toggleActivation != null:
return toggleActivation(_that.tableName,_that.isActive);case TablesTypesSave() when save != null:
return save();case _:
  return null;

}
}

}

/// @nodoc


class TablesTypesLoad implements TablesTypesEvent {
  const TablesTypesLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TablesTypesLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TablesTypesEvent.load()';
}


}




/// @nodoc


class TablesTypesToggleEdit implements TablesTypesEvent {
  const TablesTypesToggleEdit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TablesTypesToggleEdit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TablesTypesEvent.toggleEdit()';
}


}




/// @nodoc


class TablesTypesUpdateQuantity implements TablesTypesEvent {
  const TablesTypesUpdateQuantity({required this.tableName, required this.quantity});
  

 final  TableTypeEnum tableName;
 final  int quantity;

/// Create a copy of TablesTypesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TablesTypesUpdateQuantityCopyWith<TablesTypesUpdateQuantity> get copyWith => _$TablesTypesUpdateQuantityCopyWithImpl<TablesTypesUpdateQuantity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TablesTypesUpdateQuantity&&(identical(other.tableName, tableName) || other.tableName == tableName)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,tableName,quantity);

@override
String toString() {
  return 'TablesTypesEvent.updateQuantity(tableName: $tableName, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $TablesTypesUpdateQuantityCopyWith<$Res> implements $TablesTypesEventCopyWith<$Res> {
  factory $TablesTypesUpdateQuantityCopyWith(TablesTypesUpdateQuantity value, $Res Function(TablesTypesUpdateQuantity) _then) = _$TablesTypesUpdateQuantityCopyWithImpl;
@useResult
$Res call({
 TableTypeEnum tableName, int quantity
});




}
/// @nodoc
class _$TablesTypesUpdateQuantityCopyWithImpl<$Res>
    implements $TablesTypesUpdateQuantityCopyWith<$Res> {
  _$TablesTypesUpdateQuantityCopyWithImpl(this._self, this._then);

  final TablesTypesUpdateQuantity _self;
  final $Res Function(TablesTypesUpdateQuantity) _then;

/// Create a copy of TablesTypesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tableName = null,Object? quantity = null,}) {
  return _then(TablesTypesUpdateQuantity(
tableName: null == tableName ? _self.tableName : tableName // ignore: cast_nullable_to_non_nullable
as TableTypeEnum,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class TablesTypesToggleActivation implements TablesTypesEvent {
  const TablesTypesToggleActivation({required this.tableName, required this.isActive});
  

 final  TableTypeEnum tableName;
 final  bool isActive;

/// Create a copy of TablesTypesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TablesTypesToggleActivationCopyWith<TablesTypesToggleActivation> get copyWith => _$TablesTypesToggleActivationCopyWithImpl<TablesTypesToggleActivation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TablesTypesToggleActivation&&(identical(other.tableName, tableName) || other.tableName == tableName)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,tableName,isActive);

@override
String toString() {
  return 'TablesTypesEvent.toggleActivation(tableName: $tableName, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $TablesTypesToggleActivationCopyWith<$Res> implements $TablesTypesEventCopyWith<$Res> {
  factory $TablesTypesToggleActivationCopyWith(TablesTypesToggleActivation value, $Res Function(TablesTypesToggleActivation) _then) = _$TablesTypesToggleActivationCopyWithImpl;
@useResult
$Res call({
 TableTypeEnum tableName, bool isActive
});




}
/// @nodoc
class _$TablesTypesToggleActivationCopyWithImpl<$Res>
    implements $TablesTypesToggleActivationCopyWith<$Res> {
  _$TablesTypesToggleActivationCopyWithImpl(this._self, this._then);

  final TablesTypesToggleActivation _self;
  final $Res Function(TablesTypesToggleActivation) _then;

/// Create a copy of TablesTypesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tableName = null,Object? isActive = null,}) {
  return _then(TablesTypesToggleActivation(
tableName: null == tableName ? _self.tableName : tableName // ignore: cast_nullable_to_non_nullable
as TableTypeEnum,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class TablesTypesSave implements TablesTypesEvent {
  const TablesTypesSave();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TablesTypesSave);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TablesTypesEvent.save()';
}


}




/// @nodoc
mixin _$TablesTypesState {

 TablesTypesModel get tablesTypes; bool get isLoading; bool get isEditing;
/// Create a copy of TablesTypesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TablesTypesStateCopyWith<TablesTypesState> get copyWith => _$TablesTypesStateCopyWithImpl<TablesTypesState>(this as TablesTypesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TablesTypesState&&(identical(other.tablesTypes, tablesTypes) || other.tablesTypes == tablesTypes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing));
}


@override
int get hashCode => Object.hash(runtimeType,tablesTypes,isLoading,isEditing);

@override
String toString() {
  return 'TablesTypesState(tablesTypes: $tablesTypes, isLoading: $isLoading, isEditing: $isEditing)';
}


}

/// @nodoc
abstract mixin class $TablesTypesStateCopyWith<$Res>  {
  factory $TablesTypesStateCopyWith(TablesTypesState value, $Res Function(TablesTypesState) _then) = _$TablesTypesStateCopyWithImpl;
@useResult
$Res call({
 TablesTypesModel tablesTypes, bool isLoading, bool isEditing
});


$TablesTypesModelCopyWith<$Res> get tablesTypes;

}
/// @nodoc
class _$TablesTypesStateCopyWithImpl<$Res>
    implements $TablesTypesStateCopyWith<$Res> {
  _$TablesTypesStateCopyWithImpl(this._self, this._then);

  final TablesTypesState _self;
  final $Res Function(TablesTypesState) _then;

/// Create a copy of TablesTypesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tablesTypes = null,Object? isLoading = null,Object? isEditing = null,}) {
  return _then(_self.copyWith(
tablesTypes: null == tablesTypes ? _self.tablesTypes : tablesTypes // ignore: cast_nullable_to_non_nullable
as TablesTypesModel,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of TablesTypesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TablesTypesModelCopyWith<$Res> get tablesTypes {
  
  return $TablesTypesModelCopyWith<$Res>(_self.tablesTypes, (value) {
    return _then(_self.copyWith(tablesTypes: value));
  });
}
}


/// Adds pattern-matching-related methods to [TablesTypesState].
extension TablesTypesStatePatterns on TablesTypesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TablesTypesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TablesTypesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TablesTypesState value)  $default,){
final _that = this;
switch (_that) {
case _TablesTypesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TablesTypesState value)?  $default,){
final _that = this;
switch (_that) {
case _TablesTypesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TablesTypesModel tablesTypes,  bool isLoading,  bool isEditing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TablesTypesState() when $default != null:
return $default(_that.tablesTypes,_that.isLoading,_that.isEditing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TablesTypesModel tablesTypes,  bool isLoading,  bool isEditing)  $default,) {final _that = this;
switch (_that) {
case _TablesTypesState():
return $default(_that.tablesTypes,_that.isLoading,_that.isEditing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TablesTypesModel tablesTypes,  bool isLoading,  bool isEditing)?  $default,) {final _that = this;
switch (_that) {
case _TablesTypesState() when $default != null:
return $default(_that.tablesTypes,_that.isLoading,_that.isEditing);case _:
  return null;

}
}

}

/// @nodoc


class _TablesTypesState implements TablesTypesState {
  const _TablesTypesState({this.tablesTypes = const TablesTypesModel(), this.isLoading = false, this.isEditing = false});
  

@override@JsonKey() final  TablesTypesModel tablesTypes;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isEditing;

/// Create a copy of TablesTypesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TablesTypesStateCopyWith<_TablesTypesState> get copyWith => __$TablesTypesStateCopyWithImpl<_TablesTypesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TablesTypesState&&(identical(other.tablesTypes, tablesTypes) || other.tablesTypes == tablesTypes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing));
}


@override
int get hashCode => Object.hash(runtimeType,tablesTypes,isLoading,isEditing);

@override
String toString() {
  return 'TablesTypesState(tablesTypes: $tablesTypes, isLoading: $isLoading, isEditing: $isEditing)';
}


}

/// @nodoc
abstract mixin class _$TablesTypesStateCopyWith<$Res> implements $TablesTypesStateCopyWith<$Res> {
  factory _$TablesTypesStateCopyWith(_TablesTypesState value, $Res Function(_TablesTypesState) _then) = __$TablesTypesStateCopyWithImpl;
@override @useResult
$Res call({
 TablesTypesModel tablesTypes, bool isLoading, bool isEditing
});


@override $TablesTypesModelCopyWith<$Res> get tablesTypes;

}
/// @nodoc
class __$TablesTypesStateCopyWithImpl<$Res>
    implements _$TablesTypesStateCopyWith<$Res> {
  __$TablesTypesStateCopyWithImpl(this._self, this._then);

  final _TablesTypesState _self;
  final $Res Function(_TablesTypesState) _then;

/// Create a copy of TablesTypesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tablesTypes = null,Object? isLoading = null,Object? isEditing = null,}) {
  return _then(_TablesTypesState(
tablesTypes: null == tablesTypes ? _self.tablesTypes : tablesTypes // ignore: cast_nullable_to_non_nullable
as TablesTypesModel,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TablesTypesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TablesTypesModelCopyWith<$Res> get tablesTypes {
  
  return $TablesTypesModelCopyWith<$Res>(_self.tablesTypes, (value) {
    return _then(_self.copyWith(tablesTypes: value));
  });
}
}

// dart format on
