// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_tables_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeTablesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeTablesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeTablesEvent()';
}


}

/// @nodoc
class $HomeTablesEventCopyWith<$Res>  {
$HomeTablesEventCopyWith(HomeTablesEvent _, $Res Function(HomeTablesEvent) __);
}


/// Adds pattern-matching-related methods to [HomeTablesEvent].
extension HomeTablesEventPatterns on HomeTablesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SelectTableType value)?  selectTableType,TResult Function( ClearSelection value)?  clearSelection,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SelectTableType() when selectTableType != null:
return selectTableType(_that);case ClearSelection() when clearSelection != null:
return clearSelection(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SelectTableType value)  selectTableType,required TResult Function( ClearSelection value)  clearSelection,}){
final _that = this;
switch (_that) {
case SelectTableType():
return selectTableType(_that);case ClearSelection():
return clearSelection(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SelectTableType value)?  selectTableType,TResult? Function( ClearSelection value)?  clearSelection,}){
final _that = this;
switch (_that) {
case SelectTableType() when selectTableType != null:
return selectTableType(_that);case ClearSelection() when clearSelection != null:
return clearSelection(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TableTypeEnum tableType)?  selectTableType,TResult Function()?  clearSelection,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SelectTableType() when selectTableType != null:
return selectTableType(_that.tableType);case ClearSelection() when clearSelection != null:
return clearSelection();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TableTypeEnum tableType)  selectTableType,required TResult Function()  clearSelection,}) {final _that = this;
switch (_that) {
case SelectTableType():
return selectTableType(_that.tableType);case ClearSelection():
return clearSelection();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TableTypeEnum tableType)?  selectTableType,TResult? Function()?  clearSelection,}) {final _that = this;
switch (_that) {
case SelectTableType() when selectTableType != null:
return selectTableType(_that.tableType);case ClearSelection() when clearSelection != null:
return clearSelection();case _:
  return null;

}
}

}

/// @nodoc


class SelectTableType implements HomeTablesEvent {
  const SelectTableType(this.tableType);
  

 final  TableTypeEnum tableType;

/// Create a copy of HomeTablesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectTableTypeCopyWith<SelectTableType> get copyWith => _$SelectTableTypeCopyWithImpl<SelectTableType>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectTableType&&(identical(other.tableType, tableType) || other.tableType == tableType));
}


@override
int get hashCode => Object.hash(runtimeType,tableType);

@override
String toString() {
  return 'HomeTablesEvent.selectTableType(tableType: $tableType)';
}


}

/// @nodoc
abstract mixin class $SelectTableTypeCopyWith<$Res> implements $HomeTablesEventCopyWith<$Res> {
  factory $SelectTableTypeCopyWith(SelectTableType value, $Res Function(SelectTableType) _then) = _$SelectTableTypeCopyWithImpl;
@useResult
$Res call({
 TableTypeEnum tableType
});




}
/// @nodoc
class _$SelectTableTypeCopyWithImpl<$Res>
    implements $SelectTableTypeCopyWith<$Res> {
  _$SelectTableTypeCopyWithImpl(this._self, this._then);

  final SelectTableType _self;
  final $Res Function(SelectTableType) _then;

/// Create a copy of HomeTablesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tableType = null,}) {
  return _then(SelectTableType(
null == tableType ? _self.tableType : tableType // ignore: cast_nullable_to_non_nullable
as TableTypeEnum,
  ));
}


}

/// @nodoc


class ClearSelection implements HomeTablesEvent {
  const ClearSelection();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearSelection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeTablesEvent.clearSelection()';
}


}




/// @nodoc
mixin _$HomeTablesState {

 TableTypeEnum? get selectedTable;
/// Create a copy of HomeTablesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeTablesStateCopyWith<HomeTablesState> get copyWith => _$HomeTablesStateCopyWithImpl<HomeTablesState>(this as HomeTablesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeTablesState&&(identical(other.selectedTable, selectedTable) || other.selectedTable == selectedTable));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTable);

@override
String toString() {
  return 'HomeTablesState(selectedTable: $selectedTable)';
}


}

/// @nodoc
abstract mixin class $HomeTablesStateCopyWith<$Res>  {
  factory $HomeTablesStateCopyWith(HomeTablesState value, $Res Function(HomeTablesState) _then) = _$HomeTablesStateCopyWithImpl;
@useResult
$Res call({
 TableTypeEnum? selectedTable
});




}
/// @nodoc
class _$HomeTablesStateCopyWithImpl<$Res>
    implements $HomeTablesStateCopyWith<$Res> {
  _$HomeTablesStateCopyWithImpl(this._self, this._then);

  final HomeTablesState _self;
  final $Res Function(HomeTablesState) _then;

/// Create a copy of HomeTablesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTable = freezed,}) {
  return _then(_self.copyWith(
selectedTable: freezed == selectedTable ? _self.selectedTable : selectedTable // ignore: cast_nullable_to_non_nullable
as TableTypeEnum?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeTablesState].
extension HomeTablesStatePatterns on HomeTablesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeTablesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeTablesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeTablesState value)  $default,){
final _that = this;
switch (_that) {
case _HomeTablesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeTablesState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeTablesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TableTypeEnum? selectedTable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeTablesState() when $default != null:
return $default(_that.selectedTable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TableTypeEnum? selectedTable)  $default,) {final _that = this;
switch (_that) {
case _HomeTablesState():
return $default(_that.selectedTable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TableTypeEnum? selectedTable)?  $default,) {final _that = this;
switch (_that) {
case _HomeTablesState() when $default != null:
return $default(_that.selectedTable);case _:
  return null;

}
}

}

/// @nodoc


class _HomeTablesState implements HomeTablesState {
  const _HomeTablesState({this.selectedTable});
  

@override final  TableTypeEnum? selectedTable;

/// Create a copy of HomeTablesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeTablesStateCopyWith<_HomeTablesState> get copyWith => __$HomeTablesStateCopyWithImpl<_HomeTablesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeTablesState&&(identical(other.selectedTable, selectedTable) || other.selectedTable == selectedTable));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTable);

@override
String toString() {
  return 'HomeTablesState(selectedTable: $selectedTable)';
}


}

/// @nodoc
abstract mixin class _$HomeTablesStateCopyWith<$Res> implements $HomeTablesStateCopyWith<$Res> {
  factory _$HomeTablesStateCopyWith(_HomeTablesState value, $Res Function(_HomeTablesState) _then) = __$HomeTablesStateCopyWithImpl;
@override @useResult
$Res call({
 TableTypeEnum? selectedTable
});




}
/// @nodoc
class __$HomeTablesStateCopyWithImpl<$Res>
    implements _$HomeTablesStateCopyWith<$Res> {
  __$HomeTablesStateCopyWithImpl(this._self, this._then);

  final _HomeTablesState _self;
  final $Res Function(_HomeTablesState) _then;

/// Create a copy of HomeTablesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTable = freezed,}) {
  return _then(_HomeTablesState(
selectedTable: freezed == selectedTable ? _self.selectedTable : selectedTable // ignore: cast_nullable_to_non_nullable
as TableTypeEnum?,
  ));
}


}

// dart format on
