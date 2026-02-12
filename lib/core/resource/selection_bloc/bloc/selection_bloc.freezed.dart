// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selection_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SelectionEvent()';
}


}

/// @nodoc
class $SelectionEventCopyWith<$Res>  {
$SelectionEventCopyWith(SelectionEvent _, $Res Function(SelectionEvent) __);
}


/// Adds pattern-matching-related methods to [SelectionEvent].
extension SelectionEventPatterns on SelectionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EnterSelectionMode value)?  enterSelectionMode,TResult Function( ExitSelectionMode value)?  exitSelectionMode,TResult Function( ToggleSelectAll value)?  toggleSelectAll,TResult Function( ToggleProduct value)?  toggleProduct,TResult Function( DeleteSelected value)?  deleteSelected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EnterSelectionMode() when enterSelectionMode != null:
return enterSelectionMode(_that);case ExitSelectionMode() when exitSelectionMode != null:
return exitSelectionMode(_that);case ToggleSelectAll() when toggleSelectAll != null:
return toggleSelectAll(_that);case ToggleProduct() when toggleProduct != null:
return toggleProduct(_that);case DeleteSelected() when deleteSelected != null:
return deleteSelected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EnterSelectionMode value)  enterSelectionMode,required TResult Function( ExitSelectionMode value)  exitSelectionMode,required TResult Function( ToggleSelectAll value)  toggleSelectAll,required TResult Function( ToggleProduct value)  toggleProduct,required TResult Function( DeleteSelected value)  deleteSelected,}){
final _that = this;
switch (_that) {
case EnterSelectionMode():
return enterSelectionMode(_that);case ExitSelectionMode():
return exitSelectionMode(_that);case ToggleSelectAll():
return toggleSelectAll(_that);case ToggleProduct():
return toggleProduct(_that);case DeleteSelected():
return deleteSelected(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EnterSelectionMode value)?  enterSelectionMode,TResult? Function( ExitSelectionMode value)?  exitSelectionMode,TResult? Function( ToggleSelectAll value)?  toggleSelectAll,TResult? Function( ToggleProduct value)?  toggleProduct,TResult? Function( DeleteSelected value)?  deleteSelected,}){
final _that = this;
switch (_that) {
case EnterSelectionMode() when enterSelectionMode != null:
return enterSelectionMode(_that);case ExitSelectionMode() when exitSelectionMode != null:
return exitSelectionMode(_that);case ToggleSelectAll() when toggleSelectAll != null:
return toggleSelectAll(_that);case ToggleProduct() when toggleProduct != null:
return toggleProduct(_that);case DeleteSelected() when deleteSelected != null:
return deleteSelected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  enterSelectionMode,TResult Function()?  exitSelectionMode,TResult Function()?  toggleSelectAll,TResult Function( int productId)?  toggleProduct,TResult Function()?  deleteSelected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EnterSelectionMode() when enterSelectionMode != null:
return enterSelectionMode();case ExitSelectionMode() when exitSelectionMode != null:
return exitSelectionMode();case ToggleSelectAll() when toggleSelectAll != null:
return toggleSelectAll();case ToggleProduct() when toggleProduct != null:
return toggleProduct(_that.productId);case DeleteSelected() when deleteSelected != null:
return deleteSelected();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  enterSelectionMode,required TResult Function()  exitSelectionMode,required TResult Function()  toggleSelectAll,required TResult Function( int productId)  toggleProduct,required TResult Function()  deleteSelected,}) {final _that = this;
switch (_that) {
case EnterSelectionMode():
return enterSelectionMode();case ExitSelectionMode():
return exitSelectionMode();case ToggleSelectAll():
return toggleSelectAll();case ToggleProduct():
return toggleProduct(_that.productId);case DeleteSelected():
return deleteSelected();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  enterSelectionMode,TResult? Function()?  exitSelectionMode,TResult? Function()?  toggleSelectAll,TResult? Function( int productId)?  toggleProduct,TResult? Function()?  deleteSelected,}) {final _that = this;
switch (_that) {
case EnterSelectionMode() when enterSelectionMode != null:
return enterSelectionMode();case ExitSelectionMode() when exitSelectionMode != null:
return exitSelectionMode();case ToggleSelectAll() when toggleSelectAll != null:
return toggleSelectAll();case ToggleProduct() when toggleProduct != null:
return toggleProduct(_that.productId);case DeleteSelected() when deleteSelected != null:
return deleteSelected();case _:
  return null;

}
}

}

/// @nodoc


class EnterSelectionMode implements SelectionEvent {
  const EnterSelectionMode();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnterSelectionMode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SelectionEvent.enterSelectionMode()';
}


}




/// @nodoc


class ExitSelectionMode implements SelectionEvent {
  const ExitSelectionMode();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExitSelectionMode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SelectionEvent.exitSelectionMode()';
}


}




/// @nodoc


class ToggleSelectAll implements SelectionEvent {
  const ToggleSelectAll();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleSelectAll);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SelectionEvent.toggleSelectAll()';
}


}




/// @nodoc


class ToggleProduct implements SelectionEvent {
  const ToggleProduct(this.productId);
  

 final  int productId;

/// Create a copy of SelectionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleProductCopyWith<ToggleProduct> get copyWith => _$ToggleProductCopyWithImpl<ToggleProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleProduct&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'SelectionEvent.toggleProduct(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $ToggleProductCopyWith<$Res> implements $SelectionEventCopyWith<$Res> {
  factory $ToggleProductCopyWith(ToggleProduct value, $Res Function(ToggleProduct) _then) = _$ToggleProductCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$ToggleProductCopyWithImpl<$Res>
    implements $ToggleProductCopyWith<$Res> {
  _$ToggleProductCopyWithImpl(this._self, this._then);

  final ToggleProduct _self;
  final $Res Function(ToggleProduct) _then;

/// Create a copy of SelectionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(ToggleProduct(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DeleteSelected implements SelectionEvent {
  const DeleteSelected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteSelected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SelectionEvent.deleteSelected()';
}


}




/// @nodoc
mixin _$SelectionState {

 bool get isSelectMode; bool get isSelectAll; Set<int> get selectedIds; Set<int> get excludedIds;
/// Create a copy of SelectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectionStateCopyWith<SelectionState> get copyWith => _$SelectionStateCopyWithImpl<SelectionState>(this as SelectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectionState&&(identical(other.isSelectMode, isSelectMode) || other.isSelectMode == isSelectMode)&&(identical(other.isSelectAll, isSelectAll) || other.isSelectAll == isSelectAll)&&const DeepCollectionEquality().equals(other.selectedIds, selectedIds)&&const DeepCollectionEquality().equals(other.excludedIds, excludedIds));
}


@override
int get hashCode => Object.hash(runtimeType,isSelectMode,isSelectAll,const DeepCollectionEquality().hash(selectedIds),const DeepCollectionEquality().hash(excludedIds));

@override
String toString() {
  return 'SelectionState(isSelectMode: $isSelectMode, isSelectAll: $isSelectAll, selectedIds: $selectedIds, excludedIds: $excludedIds)';
}


}

/// @nodoc
abstract mixin class $SelectionStateCopyWith<$Res>  {
  factory $SelectionStateCopyWith(SelectionState value, $Res Function(SelectionState) _then) = _$SelectionStateCopyWithImpl;
@useResult
$Res call({
 bool isSelectMode, bool isSelectAll, Set<int> selectedIds, Set<int> excludedIds
});




}
/// @nodoc
class _$SelectionStateCopyWithImpl<$Res>
    implements $SelectionStateCopyWith<$Res> {
  _$SelectionStateCopyWithImpl(this._self, this._then);

  final SelectionState _self;
  final $Res Function(SelectionState) _then;

/// Create a copy of SelectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSelectMode = null,Object? isSelectAll = null,Object? selectedIds = null,Object? excludedIds = null,}) {
  return _then(_self.copyWith(
isSelectMode: null == isSelectMode ? _self.isSelectMode : isSelectMode // ignore: cast_nullable_to_non_nullable
as bool,isSelectAll: null == isSelectAll ? _self.isSelectAll : isSelectAll // ignore: cast_nullable_to_non_nullable
as bool,selectedIds: null == selectedIds ? _self.selectedIds : selectedIds // ignore: cast_nullable_to_non_nullable
as Set<int>,excludedIds: null == excludedIds ? _self.excludedIds : excludedIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [SelectionState].
extension SelectionStatePatterns on SelectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductsSelectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductsSelectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductsSelectionState value)  $default,){
final _that = this;
switch (_that) {
case _ProductsSelectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductsSelectionState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductsSelectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSelectMode,  bool isSelectAll,  Set<int> selectedIds,  Set<int> excludedIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductsSelectionState() when $default != null:
return $default(_that.isSelectMode,_that.isSelectAll,_that.selectedIds,_that.excludedIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSelectMode,  bool isSelectAll,  Set<int> selectedIds,  Set<int> excludedIds)  $default,) {final _that = this;
switch (_that) {
case _ProductsSelectionState():
return $default(_that.isSelectMode,_that.isSelectAll,_that.selectedIds,_that.excludedIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSelectMode,  bool isSelectAll,  Set<int> selectedIds,  Set<int> excludedIds)?  $default,) {final _that = this;
switch (_that) {
case _ProductsSelectionState() when $default != null:
return $default(_that.isSelectMode,_that.isSelectAll,_that.selectedIds,_that.excludedIds);case _:
  return null;

}
}

}

/// @nodoc


class _ProductsSelectionState implements SelectionState {
  const _ProductsSelectionState({this.isSelectMode = false, this.isSelectAll = false, final  Set<int> selectedIds = const <int>{}, final  Set<int> excludedIds = const <int>{}}): _selectedIds = selectedIds,_excludedIds = excludedIds;
  

@override@JsonKey() final  bool isSelectMode;
@override@JsonKey() final  bool isSelectAll;
 final  Set<int> _selectedIds;
@override@JsonKey() Set<int> get selectedIds {
  if (_selectedIds is EqualUnmodifiableSetView) return _selectedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedIds);
}

 final  Set<int> _excludedIds;
@override@JsonKey() Set<int> get excludedIds {
  if (_excludedIds is EqualUnmodifiableSetView) return _excludedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_excludedIds);
}


/// Create a copy of SelectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductsSelectionStateCopyWith<_ProductsSelectionState> get copyWith => __$ProductsSelectionStateCopyWithImpl<_ProductsSelectionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductsSelectionState&&(identical(other.isSelectMode, isSelectMode) || other.isSelectMode == isSelectMode)&&(identical(other.isSelectAll, isSelectAll) || other.isSelectAll == isSelectAll)&&const DeepCollectionEquality().equals(other._selectedIds, _selectedIds)&&const DeepCollectionEquality().equals(other._excludedIds, _excludedIds));
}


@override
int get hashCode => Object.hash(runtimeType,isSelectMode,isSelectAll,const DeepCollectionEquality().hash(_selectedIds),const DeepCollectionEquality().hash(_excludedIds));

@override
String toString() {
  return 'SelectionState(isSelectMode: $isSelectMode, isSelectAll: $isSelectAll, selectedIds: $selectedIds, excludedIds: $excludedIds)';
}


}

/// @nodoc
abstract mixin class _$ProductsSelectionStateCopyWith<$Res> implements $SelectionStateCopyWith<$Res> {
  factory _$ProductsSelectionStateCopyWith(_ProductsSelectionState value, $Res Function(_ProductsSelectionState) _then) = __$ProductsSelectionStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSelectMode, bool isSelectAll, Set<int> selectedIds, Set<int> excludedIds
});




}
/// @nodoc
class __$ProductsSelectionStateCopyWithImpl<$Res>
    implements _$ProductsSelectionStateCopyWith<$Res> {
  __$ProductsSelectionStateCopyWithImpl(this._self, this._then);

  final _ProductsSelectionState _self;
  final $Res Function(_ProductsSelectionState) _then;

/// Create a copy of SelectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSelectMode = null,Object? isSelectAll = null,Object? selectedIds = null,Object? excludedIds = null,}) {
  return _then(_ProductsSelectionState(
isSelectMode: null == isSelectMode ? _self.isSelectMode : isSelectMode // ignore: cast_nullable_to_non_nullable
as bool,isSelectAll: null == isSelectAll ? _self.isSelectAll : isSelectAll // ignore: cast_nullable_to_non_nullable
as bool,selectedIds: null == selectedIds ? _self._selectedIds : selectedIds // ignore: cast_nullable_to_non_nullable
as Set<int>,excludedIds: null == excludedIds ? _self._excludedIds : excludedIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}


}

// dart format on
