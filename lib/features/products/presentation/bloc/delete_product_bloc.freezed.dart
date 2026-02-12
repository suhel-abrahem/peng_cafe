// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeleteProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteProductEvent()';
}


}

/// @nodoc
class $DeleteProductEventCopyWith<$Res>  {
$DeleteProductEventCopyWith(DeleteProductEvent _, $Res Function(DeleteProductEvent) __);
}


/// Adds pattern-matching-related methods to [DeleteProductEvent].
extension DeleteProductEventPatterns on DeleteProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeleteProductEventStarted value)?  started,TResult Function( DeleteProductEventCanDelete value)?  canDelete,TResult Function( DeleteProductEventDeleteAll value)?  deleteAll,TResult Function( DeleteProductEventDeleteSelected value)?  deleteSelected,TResult Function( DeleteProductEventDeleteAllExceptExcluded value)?  deleteAllExceptExcluded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeleteProductEventStarted() when started != null:
return started(_that);case DeleteProductEventCanDelete() when canDelete != null:
return canDelete(_that);case DeleteProductEventDeleteAll() when deleteAll != null:
return deleteAll(_that);case DeleteProductEventDeleteSelected() when deleteSelected != null:
return deleteSelected(_that);case DeleteProductEventDeleteAllExceptExcluded() when deleteAllExceptExcluded != null:
return deleteAllExceptExcluded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeleteProductEventStarted value)  started,required TResult Function( DeleteProductEventCanDelete value)  canDelete,required TResult Function( DeleteProductEventDeleteAll value)  deleteAll,required TResult Function( DeleteProductEventDeleteSelected value)  deleteSelected,required TResult Function( DeleteProductEventDeleteAllExceptExcluded value)  deleteAllExceptExcluded,}){
final _that = this;
switch (_that) {
case DeleteProductEventStarted():
return started(_that);case DeleteProductEventCanDelete():
return canDelete(_that);case DeleteProductEventDeleteAll():
return deleteAll(_that);case DeleteProductEventDeleteSelected():
return deleteSelected(_that);case DeleteProductEventDeleteAllExceptExcluded():
return deleteAllExceptExcluded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeleteProductEventStarted value)?  started,TResult? Function( DeleteProductEventCanDelete value)?  canDelete,TResult? Function( DeleteProductEventDeleteAll value)?  deleteAll,TResult? Function( DeleteProductEventDeleteSelected value)?  deleteSelected,TResult? Function( DeleteProductEventDeleteAllExceptExcluded value)?  deleteAllExceptExcluded,}){
final _that = this;
switch (_that) {
case DeleteProductEventStarted() when started != null:
return started(_that);case DeleteProductEventCanDelete() when canDelete != null:
return canDelete(_that);case DeleteProductEventDeleteAll() when deleteAll != null:
return deleteAll(_that);case DeleteProductEventDeleteSelected() when deleteSelected != null:
return deleteSelected(_that);case DeleteProductEventDeleteAllExceptExcluded() when deleteAllExceptExcluded != null:
return deleteAllExceptExcluded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  canDelete,TResult Function()?  deleteAll,TResult Function( List<int> ids)?  deleteSelected,TResult Function( List<int> excludedIds)?  deleteAllExceptExcluded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeleteProductEventStarted() when started != null:
return started();case DeleteProductEventCanDelete() when canDelete != null:
return canDelete();case DeleteProductEventDeleteAll() when deleteAll != null:
return deleteAll();case DeleteProductEventDeleteSelected() when deleteSelected != null:
return deleteSelected(_that.ids);case DeleteProductEventDeleteAllExceptExcluded() when deleteAllExceptExcluded != null:
return deleteAllExceptExcluded(_that.excludedIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  canDelete,required TResult Function()  deleteAll,required TResult Function( List<int> ids)  deleteSelected,required TResult Function( List<int> excludedIds)  deleteAllExceptExcluded,}) {final _that = this;
switch (_that) {
case DeleteProductEventStarted():
return started();case DeleteProductEventCanDelete():
return canDelete();case DeleteProductEventDeleteAll():
return deleteAll();case DeleteProductEventDeleteSelected():
return deleteSelected(_that.ids);case DeleteProductEventDeleteAllExceptExcluded():
return deleteAllExceptExcluded(_that.excludedIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  canDelete,TResult? Function()?  deleteAll,TResult? Function( List<int> ids)?  deleteSelected,TResult? Function( List<int> excludedIds)?  deleteAllExceptExcluded,}) {final _that = this;
switch (_that) {
case DeleteProductEventStarted() when started != null:
return started();case DeleteProductEventCanDelete() when canDelete != null:
return canDelete();case DeleteProductEventDeleteAll() when deleteAll != null:
return deleteAll();case DeleteProductEventDeleteSelected() when deleteSelected != null:
return deleteSelected(_that.ids);case DeleteProductEventDeleteAllExceptExcluded() when deleteAllExceptExcluded != null:
return deleteAllExceptExcluded(_that.excludedIds);case _:
  return null;

}
}

}

/// @nodoc


class DeleteProductEventStarted implements DeleteProductEvent {
  const DeleteProductEventStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteProductEventStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteProductEvent.started()';
}


}




/// @nodoc


class DeleteProductEventCanDelete implements DeleteProductEvent {
  const DeleteProductEventCanDelete();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteProductEventCanDelete);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteProductEvent.canDelete()';
}


}




/// @nodoc


class DeleteProductEventDeleteAll implements DeleteProductEvent {
  const DeleteProductEventDeleteAll();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteProductEventDeleteAll);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteProductEvent.deleteAll()';
}


}




/// @nodoc


class DeleteProductEventDeleteSelected implements DeleteProductEvent {
  const DeleteProductEventDeleteSelected(final  List<int> ids): _ids = ids;
  

 final  List<int> _ids;
 List<int> get ids {
  if (_ids is EqualUnmodifiableListView) return _ids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ids);
}


/// Create a copy of DeleteProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteProductEventDeleteSelectedCopyWith<DeleteProductEventDeleteSelected> get copyWith => _$DeleteProductEventDeleteSelectedCopyWithImpl<DeleteProductEventDeleteSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteProductEventDeleteSelected&&const DeepCollectionEquality().equals(other._ids, _ids));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ids));

@override
String toString() {
  return 'DeleteProductEvent.deleteSelected(ids: $ids)';
}


}

/// @nodoc
abstract mixin class $DeleteProductEventDeleteSelectedCopyWith<$Res> implements $DeleteProductEventCopyWith<$Res> {
  factory $DeleteProductEventDeleteSelectedCopyWith(DeleteProductEventDeleteSelected value, $Res Function(DeleteProductEventDeleteSelected) _then) = _$DeleteProductEventDeleteSelectedCopyWithImpl;
@useResult
$Res call({
 List<int> ids
});




}
/// @nodoc
class _$DeleteProductEventDeleteSelectedCopyWithImpl<$Res>
    implements $DeleteProductEventDeleteSelectedCopyWith<$Res> {
  _$DeleteProductEventDeleteSelectedCopyWithImpl(this._self, this._then);

  final DeleteProductEventDeleteSelected _self;
  final $Res Function(DeleteProductEventDeleteSelected) _then;

/// Create a copy of DeleteProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ids = null,}) {
  return _then(DeleteProductEventDeleteSelected(
null == ids ? _self._ids : ids // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc


class DeleteProductEventDeleteAllExceptExcluded implements DeleteProductEvent {
  const DeleteProductEventDeleteAllExceptExcluded(final  List<int> excludedIds): _excludedIds = excludedIds;
  

 final  List<int> _excludedIds;
 List<int> get excludedIds {
  if (_excludedIds is EqualUnmodifiableListView) return _excludedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_excludedIds);
}


/// Create a copy of DeleteProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteProductEventDeleteAllExceptExcludedCopyWith<DeleteProductEventDeleteAllExceptExcluded> get copyWith => _$DeleteProductEventDeleteAllExceptExcludedCopyWithImpl<DeleteProductEventDeleteAllExceptExcluded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteProductEventDeleteAllExceptExcluded&&const DeepCollectionEquality().equals(other._excludedIds, _excludedIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_excludedIds));

@override
String toString() {
  return 'DeleteProductEvent.deleteAllExceptExcluded(excludedIds: $excludedIds)';
}


}

/// @nodoc
abstract mixin class $DeleteProductEventDeleteAllExceptExcludedCopyWith<$Res> implements $DeleteProductEventCopyWith<$Res> {
  factory $DeleteProductEventDeleteAllExceptExcludedCopyWith(DeleteProductEventDeleteAllExceptExcluded value, $Res Function(DeleteProductEventDeleteAllExceptExcluded) _then) = _$DeleteProductEventDeleteAllExceptExcludedCopyWithImpl;
@useResult
$Res call({
 List<int> excludedIds
});




}
/// @nodoc
class _$DeleteProductEventDeleteAllExceptExcludedCopyWithImpl<$Res>
    implements $DeleteProductEventDeleteAllExceptExcludedCopyWith<$Res> {
  _$DeleteProductEventDeleteAllExceptExcludedCopyWithImpl(this._self, this._then);

  final DeleteProductEventDeleteAllExceptExcluded _self;
  final $Res Function(DeleteProductEventDeleteAllExceptExcluded) _then;

/// Create a copy of DeleteProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? excludedIds = null,}) {
  return _then(DeleteProductEventDeleteAllExceptExcluded(
null == excludedIds ? _self._excludedIds : excludedIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc
mixin _$DeleteProductState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteProductState()';
}


}

/// @nodoc
class $DeleteProductStateCopyWith<$Res>  {
$DeleteProductStateCopyWith(DeleteProductState _, $Res Function(DeleteProductState) __);
}


/// Adds pattern-matching-related methods to [DeleteProductState].
extension DeleteProductStatePatterns on DeleteProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeleteProductStateInitial value)?  initial,TResult Function( DeleteProductStateLoading value)?  loading,TResult Function( DeleteProductStateSuccess value)?  success,TResult Function( DeleteProductStateError value)?  error,TResult Function( DeleteProductStateCanDelete value)?  canDelete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeleteProductStateInitial() when initial != null:
return initial(_that);case DeleteProductStateLoading() when loading != null:
return loading(_that);case DeleteProductStateSuccess() when success != null:
return success(_that);case DeleteProductStateError() when error != null:
return error(_that);case DeleteProductStateCanDelete() when canDelete != null:
return canDelete(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeleteProductStateInitial value)  initial,required TResult Function( DeleteProductStateLoading value)  loading,required TResult Function( DeleteProductStateSuccess value)  success,required TResult Function( DeleteProductStateError value)  error,required TResult Function( DeleteProductStateCanDelete value)  canDelete,}){
final _that = this;
switch (_that) {
case DeleteProductStateInitial():
return initial(_that);case DeleteProductStateLoading():
return loading(_that);case DeleteProductStateSuccess():
return success(_that);case DeleteProductStateError():
return error(_that);case DeleteProductStateCanDelete():
return canDelete(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeleteProductStateInitial value)?  initial,TResult? Function( DeleteProductStateLoading value)?  loading,TResult? Function( DeleteProductStateSuccess value)?  success,TResult? Function( DeleteProductStateError value)?  error,TResult? Function( DeleteProductStateCanDelete value)?  canDelete,}){
final _that = this;
switch (_that) {
case DeleteProductStateInitial() when initial != null:
return initial(_that);case DeleteProductStateLoading() when loading != null:
return loading(_that);case DeleteProductStateSuccess() when success != null:
return success(_that);case DeleteProductStateError() when error != null:
return error(_that);case DeleteProductStateCanDelete() when canDelete != null:
return canDelete(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String message)?  error,TResult Function()?  canDelete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeleteProductStateInitial() when initial != null:
return initial();case DeleteProductStateLoading() when loading != null:
return loading();case DeleteProductStateSuccess() when success != null:
return success();case DeleteProductStateError() when error != null:
return error(_that.message);case DeleteProductStateCanDelete() when canDelete != null:
return canDelete();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String message)  error,required TResult Function()  canDelete,}) {final _that = this;
switch (_that) {
case DeleteProductStateInitial():
return initial();case DeleteProductStateLoading():
return loading();case DeleteProductStateSuccess():
return success();case DeleteProductStateError():
return error(_that.message);case DeleteProductStateCanDelete():
return canDelete();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String message)?  error,TResult? Function()?  canDelete,}) {final _that = this;
switch (_that) {
case DeleteProductStateInitial() when initial != null:
return initial();case DeleteProductStateLoading() when loading != null:
return loading();case DeleteProductStateSuccess() when success != null:
return success();case DeleteProductStateError() when error != null:
return error(_that.message);case DeleteProductStateCanDelete() when canDelete != null:
return canDelete();case _:
  return null;

}
}

}

/// @nodoc


class DeleteProductStateInitial implements DeleteProductState {
  const DeleteProductStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteProductStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteProductState.initial()';
}


}




/// @nodoc


class DeleteProductStateLoading implements DeleteProductState {
  const DeleteProductStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteProductStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteProductState.loading()';
}


}




/// @nodoc


class DeleteProductStateSuccess implements DeleteProductState {
  const DeleteProductStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteProductStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteProductState.success()';
}


}




/// @nodoc


class DeleteProductStateError implements DeleteProductState {
  const DeleteProductStateError(this.message);
  

 final  String message;

/// Create a copy of DeleteProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteProductStateErrorCopyWith<DeleteProductStateError> get copyWith => _$DeleteProductStateErrorCopyWithImpl<DeleteProductStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteProductStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DeleteProductState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $DeleteProductStateErrorCopyWith<$Res> implements $DeleteProductStateCopyWith<$Res> {
  factory $DeleteProductStateErrorCopyWith(DeleteProductStateError value, $Res Function(DeleteProductStateError) _then) = _$DeleteProductStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DeleteProductStateErrorCopyWithImpl<$Res>
    implements $DeleteProductStateErrorCopyWith<$Res> {
  _$DeleteProductStateErrorCopyWithImpl(this._self, this._then);

  final DeleteProductStateError _self;
  final $Res Function(DeleteProductStateError) _then;

/// Create a copy of DeleteProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DeleteProductStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeleteProductStateCanDelete implements DeleteProductState {
  const DeleteProductStateCanDelete();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteProductStateCanDelete);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteProductState.canDelete()';
}


}




// dart format on
