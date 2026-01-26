// // GENERATED CODE - DO NOT MODIFY BY HAND
// // coverage:ignore-file
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// part of 'sync_setting_bloc_bloc.dart';

// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************

// // dart format off
// T _$identity<T>(T value) => value;
// /// @nodoc
// mixin _$SyncSettingBlocEvent {

//  SyncSettingModel get states;
// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// $SyncSettingBlocEventCopyWith<SyncSettingBlocEvent> get copyWith => _$SyncSettingBlocEventCopyWithImpl<SyncSettingBlocEvent>(this as SyncSettingBlocEvent, _$identity);



// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncSettingBlocEvent&&(identical(other.states, states) || other.states == states));
// }


// @override
// int get hashCode => Object.hash(runtimeType,states);

// @override
// String toString() {
//   return 'SyncSettingBlocEvent(states: $states)';
// }


// }

// /// @nodoc
// abstract mixin class $SyncSettingBlocEventCopyWith<$Res>  {
//   factory $SyncSettingBlocEventCopyWith(SyncSettingBlocEvent value, $Res Function(SyncSettingBlocEvent) _then) = _$SyncSettingBlocEventCopyWithImpl;
// @useResult
// $Res call({
//  SyncSettingModel states
// });


// $SyncSettingModelCopyWith<$Res> get states;

// }
// /// @nodoc
// class _$SyncSettingBlocEventCopyWithImpl<$Res>
//     implements $SyncSettingBlocEventCopyWith<$Res> {
//   _$SyncSettingBlocEventCopyWithImpl(this._self, this._then);

//   final SyncSettingBlocEvent _self;
//   final $Res Function(SyncSettingBlocEvent) _then;

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @pragma('vm:prefer-inline') @override $Res call({Object? states = null,}) {
//   return _then(_self.copyWith(
// states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
// as SyncSettingModel,
//   ));
// }
// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override
// @pragma('vm:prefer-inline')
// $SyncSettingModelCopyWith<$Res> get states {
  
//   return $SyncSettingModelCopyWith<$Res>(_self.states, (value) {
//     return _then(_self.copyWith(states: value));
//   });
// }
// }


// /// Adds pattern-matching-related methods to [SyncSettingBlocEvent].
// extension SyncSettingBlocEventPatterns on SyncSettingBlocEvent {
// /// A variant of `map` that fallback to returning `orElse`.
// ///
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case final Subclass value:
// ///     return ...;
// ///   case _:
// ///     return orElse();
// /// }
// /// ```

// @optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( autoEvent value)?  autoEvent,TResult Function( tableEvent value)?  tableEvent,TResult Function( chartEvent value)?  chartEvent,TResult Function( itemsEvent value)?  itemsEvent,TResult Function( deliveryNamesEvent value)?  deliveryNamesEvent,TResult Function( deliveryLocationsEvent value)?  deliveryLocationsEvent,TResult Function( deliveryClientsEvent value)?  deliveryClientsEvent,TResult Function( ruleEvent value)?  ruleEvent,required TResult orElse(),}){
// final _that = this;
// switch (_that) {
// case autoEvent() when autoEvent != null:
// return autoEvent(_that);case tableEvent() when tableEvent != null:
// return tableEvent(_that);case chartEvent() when chartEvent != null:
// return chartEvent(_that);case itemsEvent() when itemsEvent != null:
// return itemsEvent(_that);case deliveryNamesEvent() when deliveryNamesEvent != null:
// return deliveryNamesEvent(_that);case deliveryLocationsEvent() when deliveryLocationsEvent != null:
// return deliveryLocationsEvent(_that);case deliveryClientsEvent() when deliveryClientsEvent != null:
// return deliveryClientsEvent(_that);case ruleEvent() when ruleEvent != null:
// return ruleEvent(_that);case _:
//   return orElse();

// }
// }
// /// A `switch`-like method, using callbacks.
// ///
// /// Callbacks receives the raw object, upcasted.
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case final Subclass value:
// ///     return ...;
// ///   case final Subclass2 value:
// ///     return ...;
// /// }
// /// ```

// @optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( autoEvent value)  autoEvent,required TResult Function( tableEvent value)  tableEvent,required TResult Function( chartEvent value)  chartEvent,required TResult Function( itemsEvent value)  itemsEvent,required TResult Function( deliveryNamesEvent value)  deliveryNamesEvent,required TResult Function( deliveryLocationsEvent value)  deliveryLocationsEvent,required TResult Function( deliveryClientsEvent value)  deliveryClientsEvent,required TResult Function( ruleEvent value)  ruleEvent,}){
// final _that = this;
// switch (_that) {
// case autoEvent():
// return autoEvent(_that);case tableEvent():
// return tableEvent(_that);case chartEvent():
// return chartEvent(_that);case itemsEvent():
// return itemsEvent(_that);case deliveryNamesEvent():
// return deliveryNamesEvent(_that);case deliveryLocationsEvent():
// return deliveryLocationsEvent(_that);case deliveryClientsEvent():
// return deliveryClientsEvent(_that);case ruleEvent():
// return ruleEvent(_that);case _:
//   throw StateError('Unexpected subclass');

// }
// }
// /// A variant of `map` that fallback to returning `null`.
// ///
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case final Subclass value:
// ///     return ...;
// ///   case _:
// ///     return null;
// /// }
// /// ```

// @optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( autoEvent value)?  autoEvent,TResult? Function( tableEvent value)?  tableEvent,TResult? Function( chartEvent value)?  chartEvent,TResult? Function( itemsEvent value)?  itemsEvent,TResult? Function( deliveryNamesEvent value)?  deliveryNamesEvent,TResult? Function( deliveryLocationsEvent value)?  deliveryLocationsEvent,TResult? Function( deliveryClientsEvent value)?  deliveryClientsEvent,TResult? Function( ruleEvent value)?  ruleEvent,}){
// final _that = this;
// switch (_that) {
// case autoEvent() when autoEvent != null:
// return autoEvent(_that);case tableEvent() when tableEvent != null:
// return tableEvent(_that);case chartEvent() when chartEvent != null:
// return chartEvent(_that);case itemsEvent() when itemsEvent != null:
// return itemsEvent(_that);case deliveryNamesEvent() when deliveryNamesEvent != null:
// return deliveryNamesEvent(_that);case deliveryLocationsEvent() when deliveryLocationsEvent != null:
// return deliveryLocationsEvent(_that);case deliveryClientsEvent() when deliveryClientsEvent != null:
// return deliveryClientsEvent(_that);case ruleEvent() when ruleEvent != null:
// return ruleEvent(_that);case _:
//   return null;

// }
// }
// /// A variant of `when` that fallback to an `orElse` callback.
// ///
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case Subclass(:final field):
// ///     return ...;
// ///   case _:
// ///     return orElse();
// /// }
// /// ```

// @optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SyncSettingModel states)?  autoEvent,TResult Function( SyncSettingModel states)?  tableEvent,TResult Function( SyncSettingModel states)?  chartEvent,TResult Function( SyncSettingModel states)?  itemsEvent,TResult Function( SyncSettingModel states)?  deliveryNamesEvent,TResult Function( SyncSettingModel states)?  deliveryLocationsEvent,TResult Function( SyncSettingModel states)?  deliveryClientsEvent,TResult Function( SyncSettingModel states)?  ruleEvent,required TResult orElse(),}) {final _that = this;
// switch (_that) {
// case autoEvent() when autoEvent != null:
// return autoEvent(_that.states);case tableEvent() when tableEvent != null:
// return tableEvent(_that.states);case chartEvent() when chartEvent != null:
// return chartEvent(_that.states);case itemsEvent() when itemsEvent != null:
// return itemsEvent(_that.states);case deliveryNamesEvent() when deliveryNamesEvent != null:
// return deliveryNamesEvent(_that.states);case deliveryLocationsEvent() when deliveryLocationsEvent != null:
// return deliveryLocationsEvent(_that.states);case deliveryClientsEvent() when deliveryClientsEvent != null:
// return deliveryClientsEvent(_that.states);case ruleEvent() when ruleEvent != null:
// return ruleEvent(_that.states);case _:
//   return orElse();

// }
// }
// /// A `switch`-like method, using callbacks.
// ///
// /// As opposed to `map`, this offers destructuring.
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case Subclass(:final field):
// ///     return ...;
// ///   case Subclass2(:final field2):
// ///     return ...;
// /// }
// /// ```

// @optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SyncSettingModel states)  autoEvent,required TResult Function( SyncSettingModel states)  tableEvent,required TResult Function( SyncSettingModel states)  chartEvent,required TResult Function( SyncSettingModel states)  itemsEvent,required TResult Function( SyncSettingModel states)  deliveryNamesEvent,required TResult Function( SyncSettingModel states)  deliveryLocationsEvent,required TResult Function( SyncSettingModel states)  deliveryClientsEvent,required TResult Function( SyncSettingModel states)  ruleEvent,}) {final _that = this;
// switch (_that) {
// case autoEvent():
// return autoEvent(_that.states);case tableEvent():
// return tableEvent(_that.states);case chartEvent():
// return chartEvent(_that.states);case itemsEvent():
// return itemsEvent(_that.states);case deliveryNamesEvent():
// return deliveryNamesEvent(_that.states);case deliveryLocationsEvent():
// return deliveryLocationsEvent(_that.states);case deliveryClientsEvent():
// return deliveryClientsEvent(_that.states);case ruleEvent():
// return ruleEvent(_that.states);case _:
//   throw StateError('Unexpected subclass');

// }
// }
// /// A variant of `when` that fallback to returning `null`
// ///
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case Subclass(:final field):
// ///     return ...;
// ///   case _:
// ///     return null;
// /// }
// /// ```

// @optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SyncSettingModel states)?  autoEvent,TResult? Function( SyncSettingModel states)?  tableEvent,TResult? Function( SyncSettingModel states)?  chartEvent,TResult? Function( SyncSettingModel states)?  itemsEvent,TResult? Function( SyncSettingModel states)?  deliveryNamesEvent,TResult? Function( SyncSettingModel states)?  deliveryLocationsEvent,TResult? Function( SyncSettingModel states)?  deliveryClientsEvent,TResult? Function( SyncSettingModel states)?  ruleEvent,}) {final _that = this;
// switch (_that) {
// case autoEvent() when autoEvent != null:
// return autoEvent(_that.states);case tableEvent() when tableEvent != null:
// return tableEvent(_that.states);case chartEvent() when chartEvent != null:
// return chartEvent(_that.states);case itemsEvent() when itemsEvent != null:
// return itemsEvent(_that.states);case deliveryNamesEvent() when deliveryNamesEvent != null:
// return deliveryNamesEvent(_that.states);case deliveryLocationsEvent() when deliveryLocationsEvent != null:
// return deliveryLocationsEvent(_that.states);case deliveryClientsEvent() when deliveryClientsEvent != null:
// return deliveryClientsEvent(_that.states);case ruleEvent() when ruleEvent != null:
// return ruleEvent(_that.states);case _:
//   return null;

// }
// }

// }

// /// @nodoc


// class autoEvent implements SyncSettingBlocEvent {
//   const autoEvent({required this.states});
  

// @override final  SyncSettingModel states;

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// $autoEventCopyWith<autoEvent> get copyWith => _$autoEventCopyWithImpl<autoEvent>(this, _$identity);



// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is autoEvent&&(identical(other.states, states) || other.states == states));
// }


// @override
// int get hashCode => Object.hash(runtimeType,states);

// @override
// String toString() {
//   return 'SyncSettingBlocEvent.autoEvent(states: $states)';
// }


// }

// /// @nodoc
// abstract mixin class $autoEventCopyWith<$Res> implements $SyncSettingBlocEventCopyWith<$Res> {
//   factory $autoEventCopyWith(autoEvent value, $Res Function(autoEvent) _then) = _$autoEventCopyWithImpl;
// @override @useResult
// $Res call({
//  SyncSettingModel states
// });


// @override $SyncSettingModelCopyWith<$Res> get states;

// }
// /// @nodoc
// class _$autoEventCopyWithImpl<$Res>
//     implements $autoEventCopyWith<$Res> {
//   _$autoEventCopyWithImpl(this._self, this._then);

//   final autoEvent _self;
//   final $Res Function(autoEvent) _then;

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override @pragma('vm:prefer-inline') $Res call({Object? states = null,}) {
//   return _then(autoEvent(
// states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
// as SyncSettingModel,
//   ));
// }

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override
// @pragma('vm:prefer-inline')
// $SyncSettingModelCopyWith<$Res> get states {
  
//   return $SyncSettingModelCopyWith<$Res>(_self.states, (value) {
//     return _then(_self.copyWith(states: value));
//   });
// }
// }

// /// @nodoc


// class tableEvent implements SyncSettingBlocEvent {
//   const tableEvent({required this.states});
  

// @override final  SyncSettingModel states;

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// $tableEventCopyWith<tableEvent> get copyWith => _$tableEventCopyWithImpl<tableEvent>(this, _$identity);



// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is tableEvent&&(identical(other.states, states) || other.states == states));
// }


// @override
// int get hashCode => Object.hash(runtimeType,states);

// @override
// String toString() {
//   return 'SyncSettingBlocEvent.tableEvent(states: $states)';
// }


// }

// /// @nodoc
// abstract mixin class $tableEventCopyWith<$Res> implements $SyncSettingBlocEventCopyWith<$Res> {
//   factory $tableEventCopyWith(tableEvent value, $Res Function(tableEvent) _then) = _$tableEventCopyWithImpl;
// @override @useResult
// $Res call({
//  SyncSettingModel states
// });


// @override $SyncSettingModelCopyWith<$Res> get states;

// }
// /// @nodoc
// class _$tableEventCopyWithImpl<$Res>
//     implements $tableEventCopyWith<$Res> {
//   _$tableEventCopyWithImpl(this._self, this._then);

//   final tableEvent _self;
//   final $Res Function(tableEvent) _then;

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override @pragma('vm:prefer-inline') $Res call({Object? states = null,}) {
//   return _then(tableEvent(
// states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
// as SyncSettingModel,
//   ));
// }

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override
// @pragma('vm:prefer-inline')
// $SyncSettingModelCopyWith<$Res> get states {
  
//   return $SyncSettingModelCopyWith<$Res>(_self.states, (value) {
//     return _then(_self.copyWith(states: value));
//   });
// }
// }

// /// @nodoc


// class chartEvent implements SyncSettingBlocEvent {
//   const chartEvent({required this.states});
  

// @override final  SyncSettingModel states;

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// $chartEventCopyWith<chartEvent> get copyWith => _$chartEventCopyWithImpl<chartEvent>(this, _$identity);



// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is chartEvent&&(identical(other.states, states) || other.states == states));
// }


// @override
// int get hashCode => Object.hash(runtimeType,states);

// @override
// String toString() {
//   return 'SyncSettingBlocEvent.chartEvent(states: $states)';
// }


// }

// /// @nodoc
// abstract mixin class $chartEventCopyWith<$Res> implements $SyncSettingBlocEventCopyWith<$Res> {
//   factory $chartEventCopyWith(chartEvent value, $Res Function(chartEvent) _then) = _$chartEventCopyWithImpl;
// @override @useResult
// $Res call({
//  SyncSettingModel states
// });


// @override $SyncSettingModelCopyWith<$Res> get states;

// }
// /// @nodoc
// class _$chartEventCopyWithImpl<$Res>
//     implements $chartEventCopyWith<$Res> {
//   _$chartEventCopyWithImpl(this._self, this._then);

//   final chartEvent _self;
//   final $Res Function(chartEvent) _then;

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override @pragma('vm:prefer-inline') $Res call({Object? states = null,}) {
//   return _then(chartEvent(
// states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
// as SyncSettingModel,
//   ));
// }

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override
// @pragma('vm:prefer-inline')
// $SyncSettingModelCopyWith<$Res> get states {
  
//   return $SyncSettingModelCopyWith<$Res>(_self.states, (value) {
//     return _then(_self.copyWith(states: value));
//   });
// }
// }

// /// @nodoc


// class itemsEvent implements SyncSettingBlocEvent {
//   const itemsEvent({required this.states});
  

// @override final  SyncSettingModel states;

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// $itemsEventCopyWith<itemsEvent> get copyWith => _$itemsEventCopyWithImpl<itemsEvent>(this, _$identity);



// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is itemsEvent&&(identical(other.states, states) || other.states == states));
// }


// @override
// int get hashCode => Object.hash(runtimeType,states);

// @override
// String toString() {
//   return 'SyncSettingBlocEvent.itemsEvent(states: $states)';
// }


// }

// /// @nodoc
// abstract mixin class $itemsEventCopyWith<$Res> implements $SyncSettingBlocEventCopyWith<$Res> {
//   factory $itemsEventCopyWith(itemsEvent value, $Res Function(itemsEvent) _then) = _$itemsEventCopyWithImpl;
// @override @useResult
// $Res call({
//  SyncSettingModel states
// });


// @override $SyncSettingModelCopyWith<$Res> get states;

// }
// /// @nodoc
// class _$itemsEventCopyWithImpl<$Res>
//     implements $itemsEventCopyWith<$Res> {
//   _$itemsEventCopyWithImpl(this._self, this._then);

//   final itemsEvent _self;
//   final $Res Function(itemsEvent) _then;

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override @pragma('vm:prefer-inline') $Res call({Object? states = null,}) {
//   return _then(itemsEvent(
// states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
// as SyncSettingModel,
//   ));
// }

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override
// @pragma('vm:prefer-inline')
// $SyncSettingModelCopyWith<$Res> get states {
  
//   return $SyncSettingModelCopyWith<$Res>(_self.states, (value) {
//     return _then(_self.copyWith(states: value));
//   });
// }
// }

// /// @nodoc


// class deliveryNamesEvent implements SyncSettingBlocEvent {
//   const deliveryNamesEvent({required this.states});
  

// @override final  SyncSettingModel states;

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// $deliveryNamesEventCopyWith<deliveryNamesEvent> get copyWith => _$deliveryNamesEventCopyWithImpl<deliveryNamesEvent>(this, _$identity);



// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is deliveryNamesEvent&&(identical(other.states, states) || other.states == states));
// }


// @override
// int get hashCode => Object.hash(runtimeType,states);

// @override
// String toString() {
//   return 'SyncSettingBlocEvent.deliveryNamesEvent(states: $states)';
// }


// }

// /// @nodoc
// abstract mixin class $deliveryNamesEventCopyWith<$Res> implements $SyncSettingBlocEventCopyWith<$Res> {
//   factory $deliveryNamesEventCopyWith(deliveryNamesEvent value, $Res Function(deliveryNamesEvent) _then) = _$deliveryNamesEventCopyWithImpl;
// @override @useResult
// $Res call({
//  SyncSettingModel states
// });


// @override $SyncSettingModelCopyWith<$Res> get states;

// }
// /// @nodoc
// class _$deliveryNamesEventCopyWithImpl<$Res>
//     implements $deliveryNamesEventCopyWith<$Res> {
//   _$deliveryNamesEventCopyWithImpl(this._self, this._then);

//   final deliveryNamesEvent _self;
//   final $Res Function(deliveryNamesEvent) _then;

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override @pragma('vm:prefer-inline') $Res call({Object? states = null,}) {
//   return _then(deliveryNamesEvent(
// states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
// as SyncSettingModel,
//   ));
// }

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override
// @pragma('vm:prefer-inline')
// $SyncSettingModelCopyWith<$Res> get states {
  
//   return $SyncSettingModelCopyWith<$Res>(_self.states, (value) {
//     return _then(_self.copyWith(states: value));
//   });
// }
// }

// /// @nodoc


// class deliveryLocationsEvent implements SyncSettingBlocEvent {
//   const deliveryLocationsEvent({required this.states});
  

// @override final  SyncSettingModel states;

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// $deliveryLocationsEventCopyWith<deliveryLocationsEvent> get copyWith => _$deliveryLocationsEventCopyWithImpl<deliveryLocationsEvent>(this, _$identity);



// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is deliveryLocationsEvent&&(identical(other.states, states) || other.states == states));
// }


// @override
// int get hashCode => Object.hash(runtimeType,states);

// @override
// String toString() {
//   return 'SyncSettingBlocEvent.deliveryLocationsEvent(states: $states)';
// }


// }

// /// @nodoc
// abstract mixin class $deliveryLocationsEventCopyWith<$Res> implements $SyncSettingBlocEventCopyWith<$Res> {
//   factory $deliveryLocationsEventCopyWith(deliveryLocationsEvent value, $Res Function(deliveryLocationsEvent) _then) = _$deliveryLocationsEventCopyWithImpl;
// @override @useResult
// $Res call({
//  SyncSettingModel states
// });


// @override $SyncSettingModelCopyWith<$Res> get states;

// }
// /// @nodoc
// class _$deliveryLocationsEventCopyWithImpl<$Res>
//     implements $deliveryLocationsEventCopyWith<$Res> {
//   _$deliveryLocationsEventCopyWithImpl(this._self, this._then);

//   final deliveryLocationsEvent _self;
//   final $Res Function(deliveryLocationsEvent) _then;

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override @pragma('vm:prefer-inline') $Res call({Object? states = null,}) {
//   return _then(deliveryLocationsEvent(
// states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
// as SyncSettingModel,
//   ));
// }

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override
// @pragma('vm:prefer-inline')
// $SyncSettingModelCopyWith<$Res> get states {
  
//   return $SyncSettingModelCopyWith<$Res>(_self.states, (value) {
//     return _then(_self.copyWith(states: value));
//   });
// }
// }

// /// @nodoc


// class deliveryClientsEvent implements SyncSettingBlocEvent {
//   const deliveryClientsEvent({required this.states});
  

// @override final  SyncSettingModel states;

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// $deliveryClientsEventCopyWith<deliveryClientsEvent> get copyWith => _$deliveryClientsEventCopyWithImpl<deliveryClientsEvent>(this, _$identity);



// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is deliveryClientsEvent&&(identical(other.states, states) || other.states == states));
// }


// @override
// int get hashCode => Object.hash(runtimeType,states);

// @override
// String toString() {
//   return 'SyncSettingBlocEvent.deliveryClientsEvent(states: $states)';
// }


// }

// /// @nodoc
// abstract mixin class $deliveryClientsEventCopyWith<$Res> implements $SyncSettingBlocEventCopyWith<$Res> {
//   factory $deliveryClientsEventCopyWith(deliveryClientsEvent value, $Res Function(deliveryClientsEvent) _then) = _$deliveryClientsEventCopyWithImpl;
// @override @useResult
// $Res call({
//  SyncSettingModel states
// });


// @override $SyncSettingModelCopyWith<$Res> get states;

// }
// /// @nodoc
// class _$deliveryClientsEventCopyWithImpl<$Res>
//     implements $deliveryClientsEventCopyWith<$Res> {
//   _$deliveryClientsEventCopyWithImpl(this._self, this._then);

//   final deliveryClientsEvent _self;
//   final $Res Function(deliveryClientsEvent) _then;

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override @pragma('vm:prefer-inline') $Res call({Object? states = null,}) {
//   return _then(deliveryClientsEvent(
// states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
// as SyncSettingModel,
//   ));
// }

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override
// @pragma('vm:prefer-inline')
// $SyncSettingModelCopyWith<$Res> get states {
  
//   return $SyncSettingModelCopyWith<$Res>(_self.states, (value) {
//     return _then(_self.copyWith(states: value));
//   });
// }
// }

// /// @nodoc


// class ruleEvent implements SyncSettingBlocEvent {
//   const ruleEvent({required this.states});
  

// @override final  SyncSettingModel states;

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// $ruleEventCopyWith<ruleEvent> get copyWith => _$ruleEventCopyWithImpl<ruleEvent>(this, _$identity);



// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is ruleEvent&&(identical(other.states, states) || other.states == states));
// }


// @override
// int get hashCode => Object.hash(runtimeType,states);

// @override
// String toString() {
//   return 'SyncSettingBlocEvent.ruleEvent(states: $states)';
// }


// }

// /// @nodoc
// abstract mixin class $ruleEventCopyWith<$Res> implements $SyncSettingBlocEventCopyWith<$Res> {
//   factory $ruleEventCopyWith(ruleEvent value, $Res Function(ruleEvent) _then) = _$ruleEventCopyWithImpl;
// @override @useResult
// $Res call({
//  SyncSettingModel states
// });


// @override $SyncSettingModelCopyWith<$Res> get states;

// }
// /// @nodoc
// class _$ruleEventCopyWithImpl<$Res>
//     implements $ruleEventCopyWith<$Res> {
//   _$ruleEventCopyWithImpl(this._self, this._then);

//   final ruleEvent _self;
//   final $Res Function(ruleEvent) _then;

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override @pragma('vm:prefer-inline') $Res call({Object? states = null,}) {
//   return _then(ruleEvent(
// states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
// as SyncSettingModel,
//   ));
// }

// /// Create a copy of SyncSettingBlocEvent
// /// with the given fields replaced by the non-null parameter values.
// @override
// @pragma('vm:prefer-inline')
// $SyncSettingModelCopyWith<$Res> get states {
  
//   return $SyncSettingModelCopyWith<$Res>(_self.states, (value) {
//     return _then(_self.copyWith(states: value));
//   });
// }
// }

// /// @nodoc
// mixin _$SyncSettingBlocState {

//  SyncSettingModel get states;
// /// Create a copy of SyncSettingBlocState
// /// with the given fields replaced by the non-null parameter values.
// @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// $SyncSettingBlocStateCopyWith<SyncSettingBlocState> get copyWith => _$SyncSettingBlocStateCopyWithImpl<SyncSettingBlocState>(this as SyncSettingBlocState, _$identity);



// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncSettingBlocState&&(identical(other.states, states) || other.states == states));
// }


// @override
// int get hashCode => Object.hash(runtimeType,states);

// @override
// String toString() {
//   return 'SyncSettingBlocState(states: $states)';
// }


// }

// /// @nodoc
// abstract mixin class $SyncSettingBlocStateCopyWith<$Res>  {
//   factory $SyncSettingBlocStateCopyWith(SyncSettingBlocState value, $Res Function(SyncSettingBlocState) _then) = _$SyncSettingBlocStateCopyWithImpl;
// @useResult
// $Res call({
//  SyncSettingModel states
// });


// $SyncSettingModelCopyWith<$Res> get states;

// }
// /// @nodoc
// class _$SyncSettingBlocStateCopyWithImpl<$Res>
//     implements $SyncSettingBlocStateCopyWith<$Res> {
//   _$SyncSettingBlocStateCopyWithImpl(this._self, this._then);

//   final SyncSettingBlocState _self;
//   final $Res Function(SyncSettingBlocState) _then;

// /// Create a copy of SyncSettingBlocState
// /// with the given fields replaced by the non-null parameter values.
// @pragma('vm:prefer-inline') @override $Res call({Object? states = null,}) {
//   return _then(_self.copyWith(
// states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
// as SyncSettingModel,
//   ));
// }
// /// Create a copy of SyncSettingBlocState
// /// with the given fields replaced by the non-null parameter values.
// @override
// @pragma('vm:prefer-inline')
// $SyncSettingModelCopyWith<$Res> get states {
  
//   return $SyncSettingModelCopyWith<$Res>(_self.states, (value) {
//     return _then(_self.copyWith(states: value));
//   });
// }
// }


// /// Adds pattern-matching-related methods to [SyncSettingBlocState].
// extension SyncSettingBlocStatePatterns on SyncSettingBlocState {
// /// A variant of `map` that fallback to returning `orElse`.
// ///
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case final Subclass value:
// ///     return ...;
// ///   case _:
// ///     return orElse();
// /// }
// /// ```

// @optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( always value)?  always,TResult Function( never value)?  never,TResult Function( custom value)?  custom,required TResult orElse(),}){
// final _that = this;
// switch (_that) {
// case Initial() when initial != null:
// return initial(_that);case always() when always != null:
// return always(_that);case never() when never != null:
// return never(_that);case custom() when custom != null:
// return custom(_that);case _:
//   return orElse();

// }
// }
// /// A `switch`-like method, using callbacks.
// ///
// /// Callbacks receives the raw object, upcasted.
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case final Subclass value:
// ///     return ...;
// ///   case final Subclass2 value:
// ///     return ...;
// /// }
// /// ```

// @optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( always value)  always,required TResult Function( never value)  never,required TResult Function( custom value)  custom,}){
// final _that = this;
// switch (_that) {
// case Initial():
// return initial(_that);case always():
// return always(_that);case never():
// return never(_that);case custom():
// return custom(_that);case _:
//   throw StateError('Unexpected subclass');

// }
// }
// /// A variant of `map` that fallback to returning `null`.
// ///
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case final Subclass value:
// ///     return ...;
// ///   case _:
// ///     return null;
// /// }
// /// ```

// @optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( always value)?  always,TResult? Function( never value)?  never,TResult? Function( custom value)?  custom,}){
// final _that = this;
// switch (_that) {
// case Initial() when initial != null:
// return initial(_that);case always() when always != null:
// return always(_that);case never() when never != null:
// return never(_that);case custom() when custom != null:
// return custom(_that);case _:
//   return null;

// }
// }
// /// A variant of `when` that fallback to an `orElse` callback.
// ///
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case Subclass(:final field):
// ///     return ...;
// ///   case _:
// ///     return orElse();
// /// }
// /// ```

// @optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SyncSettingModel states)?  initial,TResult Function( SyncSettingModel states)?  always,TResult Function( SyncSettingModel states)?  never,TResult Function( SyncSettingModel states)?  custom,required TResult orElse(),}) {final _that = this;
// switch (_that) {
// case Initial() when initial != null:
// return initial(_that.states);case always() when always != null:
// return always(_that.states);case never() when never != null:
// return never(_that.states);case custom() when custom != null:
// return custom(_that.states);case _:
//   return orElse();

// }
// }
// /// A `switch`-like method, using callbacks.
// ///
// /// As opposed to `map`, this offers destructuring.
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case Subclass(:final field):
// ///     return ...;
// ///   case Subclass2(:final field2):
// ///     return ...;
// /// }
// /// ```

// @optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SyncSettingModel states)  initial,required TResult Function( SyncSettingModel states)  always,required TResult Function( SyncSettingModel states)  never,required TResult Function( SyncSettingModel states)  custom,}) {final _that = this;
// switch (_that) {
// case Initial():
// return initial(_that.states);case always():
// return always(_that.states);case never():
// return never(_that.states);case custom():
// return custom(_that.states);case _:
//   throw StateError('Unexpected subclass');

// }
// }
// /// A variant of `when` that fallback to returning `null`
// ///
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case Subclass(:final field):
// ///     return ...;
// ///   case _:
// ///     return null;
// /// }
// /// ```

// @optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SyncSettingModel states)?  initial,TResult? Function( SyncSettingModel states)?  always,TResult? Function( SyncSettingModel states)?  never,TResult? Function( SyncSettingModel states)?  custom,}) {final _that = this;
// switch (_that) {
// case Initial() when initial != null:
// return initial(_that.states);case always() when always != null:
// return always(_that.states);case never() when never != null:
// return never(_that.states);case custom() when custom != null:
// return custom(_that.states);case _:
//   return null;

// }
// }

// }

// /// @nodoc


// class Initial implements SyncSettingBlocState {
//   const Initial(this.states);
  

// @override final  SyncSettingModel states;

// /// Create a copy of SyncSettingBlocState
// /// with the given fields replaced by the non-null parameter values.
// @override @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// $InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);



// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial&&(identical(other.states, states) || other.states == states));
// }


// @override
// int get hashCode => Object.hash(runtimeType,states);

// @override
// String toString() {
//   return 'SyncSettingBlocState.initial(states: $states)';
// }


// }

// /// @nodoc
// abstract mixin class $InitialCopyWith<$Res> implements $SyncSettingBlocStateCopyWith<$Res> {
//   factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
// @override @useResult
// $Res call({
//  SyncSettingModel states
// });


// @override $SyncSettingModelCopyWith<$Res> get states;

// }
// /// @nodoc
// class _$InitialCopyWithImpl<$Res>
//     implements $InitialCopyWith<$Res> {
//   _$InitialCopyWithImpl(this._self, this._then);

//   final Initial _self;
//   final $Res Function(Initial) _then;

// /// Create a copy of SyncSettingBlocState
// /// with the given fields replaced by the non-null parameter values.
// @override @pragma('vm:prefer-inline') $Res call({Object? states = null,}) {
//   return _then(Initial(
// null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
// as SyncSettingModel,
//   ));
// }

// /// Create a copy of SyncSettingBlocState
// /// with the given fields replaced by the non-null parameter values.
// @override
// @pragma('vm:prefer-inline')
// $SyncSettingModelCopyWith<$Res> get states {
  
//   return $SyncSettingModelCopyWith<$Res>(_self.states, (value) {
//     return _then(_self.copyWith(states: value));
//   });
// }
// }

// /// @nodoc


// class always implements SyncSettingBlocState {
//   const always({required this.states});
  

// @override final  SyncSettingModel states;

// /// Create a copy of SyncSettingBlocState
// /// with the given fields replaced by the non-null parameter values.
// @override @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// $alwaysCopyWith<always> get copyWith => _$alwaysCopyWithImpl<always>(this, _$identity);



// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is always&&(identical(other.states, states) || other.states == states));
// }


// @override
// int get hashCode => Object.hash(runtimeType,states);

// @override
// String toString() {
//   return 'SyncSettingBlocState.always(states: $states)';
// }


// }

// /// @nodoc
// abstract mixin class $alwaysCopyWith<$Res> implements $SyncSettingBlocStateCopyWith<$Res> {
//   factory $alwaysCopyWith(always value, $Res Function(always) _then) = _$alwaysCopyWithImpl;
// @override @useResult
// $Res call({
//  SyncSettingModel states
// });


// @override $SyncSettingModelCopyWith<$Res> get states;

// }
// /// @nodoc
// class _$alwaysCopyWithImpl<$Res>
//     implements $alwaysCopyWith<$Res> {
//   _$alwaysCopyWithImpl(this._self, this._then);

//   final always _self;
//   final $Res Function(always) _then;

// /// Create a copy of SyncSettingBlocState
// /// with the given fields replaced by the non-null parameter values.
// @override @pragma('vm:prefer-inline') $Res call({Object? states = null,}) {
//   return _then(always(
// states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
// as SyncSettingModel,
//   ));
// }

// /// Create a copy of SyncSettingBlocState
// /// with the given fields replaced by the non-null parameter values.
// @override
// @pragma('vm:prefer-inline')
// $SyncSettingModelCopyWith<$Res> get states {
  
//   return $SyncSettingModelCopyWith<$Res>(_self.states, (value) {
//     return _then(_self.copyWith(states: value));
//   });
// }
// }

// /// @nodoc


// class never implements SyncSettingBlocState {
//   const never({required this.states});
  

// @override final  SyncSettingModel states;

// /// Create a copy of SyncSettingBlocState
// /// with the given fields replaced by the non-null parameter values.
// @override @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// $neverCopyWith<never> get copyWith => _$neverCopyWithImpl<never>(this, _$identity);



// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is never&&(identical(other.states, states) || other.states == states));
// }


// @override
// int get hashCode => Object.hash(runtimeType,states);

// @override
// String toString() {
//   return 'SyncSettingBlocState.never(states: $states)';
// }


// }

// /// @nodoc
// abstract mixin class $neverCopyWith<$Res> implements $SyncSettingBlocStateCopyWith<$Res> {
//   factory $neverCopyWith(never value, $Res Function(never) _then) = _$neverCopyWithImpl;
// @override @useResult
// $Res call({
//  SyncSettingModel states
// });


// @override $SyncSettingModelCopyWith<$Res> get states;

// }
// /// @nodoc
// class _$neverCopyWithImpl<$Res>
//     implements $neverCopyWith<$Res> {
//   _$neverCopyWithImpl(this._self, this._then);

//   final never _self;
//   final $Res Function(never) _then;

// /// Create a copy of SyncSettingBlocState
// /// with the given fields replaced by the non-null parameter values.
// @override @pragma('vm:prefer-inline') $Res call({Object? states = null,}) {
//   return _then(never(
// states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
// as SyncSettingModel,
//   ));
// }

// /// Create a copy of SyncSettingBlocState
// /// with the given fields replaced by the non-null parameter values.
// @override
// @pragma('vm:prefer-inline')
// $SyncSettingModelCopyWith<$Res> get states {
  
//   return $SyncSettingModelCopyWith<$Res>(_self.states, (value) {
//     return _then(_self.copyWith(states: value));
//   });
// }
// }

// /// @nodoc


// class custom implements SyncSettingBlocState {
//   const custom({required this.states});
  

// @override final  SyncSettingModel states;

// /// Create a copy of SyncSettingBlocState
// /// with the given fields replaced by the non-null parameter values.
// @override @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// $customCopyWith<custom> get copyWith => _$customCopyWithImpl<custom>(this, _$identity);



// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is custom&&(identical(other.states, states) || other.states == states));
// }


// @override
// int get hashCode => Object.hash(runtimeType,states);

// @override
// String toString() {
//   return 'SyncSettingBlocState.custom(states: $states)';
// }


// }

// /// @nodoc
// abstract mixin class $customCopyWith<$Res> implements $SyncSettingBlocStateCopyWith<$Res> {
//   factory $customCopyWith(custom value, $Res Function(custom) _then) = _$customCopyWithImpl;
// @override @useResult
// $Res call({
//  SyncSettingModel states
// });


// @override $SyncSettingModelCopyWith<$Res> get states;

// }
// /// @nodoc
// class _$customCopyWithImpl<$Res>
//     implements $customCopyWith<$Res> {
//   _$customCopyWithImpl(this._self, this._then);

//   final custom _self;
//   final $Res Function(custom) _then;

// /// Create a copy of SyncSettingBlocState
// /// with the given fields replaced by the non-null parameter values.
// @override @pragma('vm:prefer-inline') $Res call({Object? states = null,}) {
//   return _then(custom(
// states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
// as SyncSettingModel,
//   ));
// }

// /// Create a copy of SyncSettingBlocState
// /// with the given fields replaced by the non-null parameter values.
// @override
// @pragma('vm:prefer-inline')
// $SyncSettingModelCopyWith<$Res> get states {
  
//   return $SyncSettingModelCopyWith<$Res>(_self.states, (value) {
//     return _then(_self.copyWith(states: value));
//   });
// }
// }

// // dart format on
