// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrdersEvent {

 DurationEnum get duration;
/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersEventCopyWith<OrdersEvent> get copyWith => _$OrdersEventCopyWithImpl<OrdersEvent>(this as OrdersEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersEvent&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,duration);

@override
String toString() {
  return 'OrdersEvent(duration: $duration)';
}


}

/// @nodoc
abstract mixin class $OrdersEventCopyWith<$Res>  {
  factory $OrdersEventCopyWith(OrdersEvent value, $Res Function(OrdersEvent) _then) = _$OrdersEventCopyWithImpl;
@useResult
$Res call({
 DurationEnum duration
});




}
/// @nodoc
class _$OrdersEventCopyWithImpl<$Res>
    implements $OrdersEventCopyWith<$Res> {
  _$OrdersEventCopyWithImpl(this._self, this._then);

  final OrdersEvent _self;
  final $Res Function(OrdersEvent) _then;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? duration = null,}) {
  return _then(_self.copyWith(
duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as DurationEnum,
  ));
}

}


/// Adds pattern-matching-related methods to [OrdersEvent].
extension OrdersEventPatterns on OrdersEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,TResult Function( _Refresh value)?  refresh,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Refresh() when refresh != null:
return refresh(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,required TResult Function( _Refresh value)  refresh,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);case _Refresh():
return refresh(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,TResult? Function( _Refresh value)?  refresh,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Refresh() when refresh != null:
return refresh(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DurationEnum duration)?  load,TResult Function( DurationEnum duration)?  refresh,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that.duration);case _Refresh() when refresh != null:
return refresh(_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DurationEnum duration)  load,required TResult Function( DurationEnum duration)  refresh,}) {final _that = this;
switch (_that) {
case _Load():
return load(_that.duration);case _Refresh():
return refresh(_that.duration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DurationEnum duration)?  load,TResult? Function( DurationEnum duration)?  refresh,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that.duration);case _Refresh() when refresh != null:
return refresh(_that.duration);case _:
  return null;

}
}

}

/// @nodoc


class _Load implements OrdersEvent {
  const _Load({required this.duration});
  

@override final  DurationEnum duration;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadCopyWith<_Load> get copyWith => __$LoadCopyWithImpl<_Load>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,duration);

@override
String toString() {
  return 'OrdersEvent.load(duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$LoadCopyWith<$Res> implements $OrdersEventCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) _then) = __$LoadCopyWithImpl;
@override @useResult
$Res call({
 DurationEnum duration
});




}
/// @nodoc
class __$LoadCopyWithImpl<$Res>
    implements _$LoadCopyWith<$Res> {
  __$LoadCopyWithImpl(this._self, this._then);

  final _Load _self;
  final $Res Function(_Load) _then;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? duration = null,}) {
  return _then(_Load(
duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as DurationEnum,
  ));
}


}

/// @nodoc


class _Refresh implements OrdersEvent {
  const _Refresh({required this.duration});
  

@override final  DurationEnum duration;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshCopyWith<_Refresh> get copyWith => __$RefreshCopyWithImpl<_Refresh>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refresh&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,duration);

@override
String toString() {
  return 'OrdersEvent.refresh(duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$RefreshCopyWith<$Res> implements $OrdersEventCopyWith<$Res> {
  factory _$RefreshCopyWith(_Refresh value, $Res Function(_Refresh) _then) = __$RefreshCopyWithImpl;
@override @useResult
$Res call({
 DurationEnum duration
});




}
/// @nodoc
class __$RefreshCopyWithImpl<$Res>
    implements _$RefreshCopyWith<$Res> {
  __$RefreshCopyWithImpl(this._self, this._then);

  final _Refresh _self;
  final $Res Function(_Refresh) _then;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? duration = null,}) {
  return _then(_Refresh(
duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as DurationEnum,
  ));
}


}

/// @nodoc
mixin _$OrdersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersState()';
}


}

/// @nodoc
class $OrdersStateCopyWith<$Res>  {
$OrdersStateCopyWith(OrdersState _, $Res Function(OrdersState) __);
}


/// Adds pattern-matching-related methods to [OrdersState].
extension OrdersStatePatterns on OrdersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OrdersStateLoading value)?  loading,TResult Function( OrdersStateLoaded value)?  loaded,TResult Function( OrdersStateLoadedWithNoData value)?  loadedWithNoData,TResult Function( OrdersStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OrdersStateLoading() when loading != null:
return loading(_that);case OrdersStateLoaded() when loaded != null:
return loaded(_that);case OrdersStateLoadedWithNoData() when loadedWithNoData != null:
return loadedWithNoData(_that);case OrdersStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OrdersStateLoading value)  loading,required TResult Function( OrdersStateLoaded value)  loaded,required TResult Function( OrdersStateLoadedWithNoData value)  loadedWithNoData,required TResult Function( OrdersStateError value)  error,}){
final _that = this;
switch (_that) {
case OrdersStateLoading():
return loading(_that);case OrdersStateLoaded():
return loaded(_that);case OrdersStateLoadedWithNoData():
return loadedWithNoData(_that);case OrdersStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OrdersStateLoading value)?  loading,TResult? Function( OrdersStateLoaded value)?  loaded,TResult? Function( OrdersStateLoadedWithNoData value)?  loadedWithNoData,TResult? Function( OrdersStateError value)?  error,}){
final _that = this;
switch (_that) {
case OrdersStateLoading() when loading != null:
return loading(_that);case OrdersStateLoaded() when loaded != null:
return loaded(_that);case OrdersStateLoadedWithNoData() when loadedWithNoData != null:
return loadedWithNoData(_that);case OrdersStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<OrdersSection> sections)?  loaded,TResult Function()?  loadedWithNoData,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OrdersStateLoading() when loading != null:
return loading();case OrdersStateLoaded() when loaded != null:
return loaded(_that.sections);case OrdersStateLoadedWithNoData() when loadedWithNoData != null:
return loadedWithNoData();case OrdersStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<OrdersSection> sections)  loaded,required TResult Function()  loadedWithNoData,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case OrdersStateLoading():
return loading();case OrdersStateLoaded():
return loaded(_that.sections);case OrdersStateLoadedWithNoData():
return loadedWithNoData();case OrdersStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<OrdersSection> sections)?  loaded,TResult? Function()?  loadedWithNoData,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case OrdersStateLoading() when loading != null:
return loading();case OrdersStateLoaded() when loaded != null:
return loaded(_that.sections);case OrdersStateLoadedWithNoData() when loadedWithNoData != null:
return loadedWithNoData();case OrdersStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class OrdersStateLoading implements OrdersState {
  const OrdersStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersState.loading()';
}


}




/// @nodoc


class OrdersStateLoaded implements OrdersState {
  const OrdersStateLoaded({required final  List<OrdersSection> sections}): _sections = sections;
  

 final  List<OrdersSection> _sections;
 List<OrdersSection> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersStateLoadedCopyWith<OrdersStateLoaded> get copyWith => _$OrdersStateLoadedCopyWithImpl<OrdersStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersStateLoaded&&const DeepCollectionEquality().equals(other._sections, _sections));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sections));

@override
String toString() {
  return 'OrdersState.loaded(sections: $sections)';
}


}

/// @nodoc
abstract mixin class $OrdersStateLoadedCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory $OrdersStateLoadedCopyWith(OrdersStateLoaded value, $Res Function(OrdersStateLoaded) _then) = _$OrdersStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<OrdersSection> sections
});




}
/// @nodoc
class _$OrdersStateLoadedCopyWithImpl<$Res>
    implements $OrdersStateLoadedCopyWith<$Res> {
  _$OrdersStateLoadedCopyWithImpl(this._self, this._then);

  final OrdersStateLoaded _self;
  final $Res Function(OrdersStateLoaded) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sections = null,}) {
  return _then(OrdersStateLoaded(
sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<OrdersSection>,
  ));
}


}

/// @nodoc


class OrdersStateLoadedWithNoData implements OrdersState {
  const OrdersStateLoadedWithNoData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersStateLoadedWithNoData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersState.loadedWithNoData()';
}


}




/// @nodoc


class OrdersStateError implements OrdersState {
  const OrdersStateError(this.message);
  

 final  String message;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersStateErrorCopyWith<OrdersStateError> get copyWith => _$OrdersStateErrorCopyWithImpl<OrdersStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'OrdersState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $OrdersStateErrorCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory $OrdersStateErrorCopyWith(OrdersStateError value, $Res Function(OrdersStateError) _then) = _$OrdersStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$OrdersStateErrorCopyWithImpl<$Res>
    implements $OrdersStateErrorCopyWith<$Res> {
  _$OrdersStateErrorCopyWithImpl(this._self, this._then);

  final OrdersStateError _self;
  final $Res Function(OrdersStateError) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(OrdersStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
