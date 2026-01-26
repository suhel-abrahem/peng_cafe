// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent()';
}


}

/// @nodoc
class $LoginEventCopyWith<$Res>  {
$LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}


/// Adds pattern-matching-related methods to [LoginEvent].
extension LoginEventPatterns on LoginEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginEventStarted value)?  started,TResult Function( LoginEventLogin value)?  login,TResult Function( LoginEventLogOut value)?  logout,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginEventStarted() when started != null:
return started(_that);case LoginEventLogin() when login != null:
return login(_that);case LoginEventLogOut() when logout != null:
return logout(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginEventStarted value)  started,required TResult Function( LoginEventLogin value)  login,required TResult Function( LoginEventLogOut value)  logout,}){
final _that = this;
switch (_that) {
case LoginEventStarted():
return started(_that);case LoginEventLogin():
return login(_that);case LoginEventLogOut():
return logout(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginEventStarted value)?  started,TResult? Function( LoginEventLogin value)?  login,TResult? Function( LoginEventLogOut value)?  logout,}){
final _that = this;
switch (_that) {
case LoginEventStarted() when started != null:
return started(_that);case LoginEventLogin() when login != null:
return login(_that);case LoginEventLogOut() when logout != null:
return logout(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( LoginEntity loginEntity)?  login,TResult Function()?  logout,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginEventStarted() when started != null:
return started();case LoginEventLogin() when login != null:
return login(_that.loginEntity);case LoginEventLogOut() when logout != null:
return logout();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( LoginEntity loginEntity)  login,required TResult Function()  logout,}) {final _that = this;
switch (_that) {
case LoginEventStarted():
return started();case LoginEventLogin():
return login(_that.loginEntity);case LoginEventLogOut():
return logout();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( LoginEntity loginEntity)?  login,TResult? Function()?  logout,}) {final _that = this;
switch (_that) {
case LoginEventStarted() when started != null:
return started();case LoginEventLogin() when login != null:
return login(_that.loginEntity);case LoginEventLogOut() when logout != null:
return logout();case _:
  return null;

}
}

}

/// @nodoc


class LoginEventStarted implements LoginEvent {
  const LoginEventStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEventStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.started()';
}


}




/// @nodoc


class LoginEventLogin implements LoginEvent {
  const LoginEventLogin({required this.loginEntity});
  

 final  LoginEntity loginEntity;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginEventLoginCopyWith<LoginEventLogin> get copyWith => _$LoginEventLoginCopyWithImpl<LoginEventLogin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEventLogin&&(identical(other.loginEntity, loginEntity) || other.loginEntity == loginEntity));
}


@override
int get hashCode => Object.hash(runtimeType,loginEntity);

@override
String toString() {
  return 'LoginEvent.login(loginEntity: $loginEntity)';
}


}

/// @nodoc
abstract mixin class $LoginEventLoginCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory $LoginEventLoginCopyWith(LoginEventLogin value, $Res Function(LoginEventLogin) _then) = _$LoginEventLoginCopyWithImpl;
@useResult
$Res call({
 LoginEntity loginEntity
});


$LoginEntityCopyWith<$Res> get loginEntity;

}
/// @nodoc
class _$LoginEventLoginCopyWithImpl<$Res>
    implements $LoginEventLoginCopyWith<$Res> {
  _$LoginEventLoginCopyWithImpl(this._self, this._then);

  final LoginEventLogin _self;
  final $Res Function(LoginEventLogin) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? loginEntity = null,}) {
  return _then(LoginEventLogin(
loginEntity: null == loginEntity ? _self.loginEntity : loginEntity // ignore: cast_nullable_to_non_nullable
as LoginEntity,
  ));
}

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginEntityCopyWith<$Res> get loginEntity {
  
  return $LoginEntityCopyWith<$Res>(_self.loginEntity, (value) {
    return _then(_self.copyWith(loginEntity: value));
  });
}
}

/// @nodoc


class LoginEventLogOut implements LoginEvent {
  const LoginEventLogOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEventLogOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.logout()';
}


}




/// @nodoc
mixin _$LoginState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState()';
}


}

/// @nodoc
class $LoginStateCopyWith<$Res>  {
$LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginInitial value)?  initial,TResult Function( LoginLoginIn value)?  logingIn,TResult Function( Logined value)?  logined,TResult Function( LoginedOut value)?  loginedOut,TResult Function( LoginError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial(_that);case LoginLoginIn() when logingIn != null:
return logingIn(_that);case Logined() when logined != null:
return logined(_that);case LoginedOut() when loginedOut != null:
return loginedOut(_that);case LoginError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginInitial value)  initial,required TResult Function( LoginLoginIn value)  logingIn,required TResult Function( Logined value)  logined,required TResult Function( LoginedOut value)  loginedOut,required TResult Function( LoginError value)  error,}){
final _that = this;
switch (_that) {
case LoginInitial():
return initial(_that);case LoginLoginIn():
return logingIn(_that);case Logined():
return logined(_that);case LoginedOut():
return loginedOut(_that);case LoginError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginInitial value)?  initial,TResult? Function( LoginLoginIn value)?  logingIn,TResult? Function( Logined value)?  logined,TResult? Function( LoginedOut value)?  loginedOut,TResult? Function( LoginError value)?  error,}){
final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial(_that);case LoginLoginIn() when logingIn != null:
return logingIn(_that);case Logined() when logined != null:
return logined(_that);case LoginedOut() when loginedOut != null:
return loginedOut(_that);case LoginError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  logingIn,TResult Function( UserCredential? userCredential)?  logined,TResult Function()?  loginedOut,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial();case LoginLoginIn() when logingIn != null:
return logingIn();case Logined() when logined != null:
return logined(_that.userCredential);case LoginedOut() when loginedOut != null:
return loginedOut();case LoginError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  logingIn,required TResult Function( UserCredential? userCredential)  logined,required TResult Function()  loginedOut,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case LoginInitial():
return initial();case LoginLoginIn():
return logingIn();case Logined():
return logined(_that.userCredential);case LoginedOut():
return loginedOut();case LoginError():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  logingIn,TResult? Function( UserCredential? userCredential)?  logined,TResult? Function()?  loginedOut,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial();case LoginLoginIn() when logingIn != null:
return logingIn();case Logined() when logined != null:
return logined(_that.userCredential);case LoginedOut() when loginedOut != null:
return loginedOut();case LoginError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class LoginInitial implements LoginState {
  const LoginInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.initial()';
}


}




/// @nodoc


class LoginLoginIn implements LoginState {
  const LoginLoginIn();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginLoginIn);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.logingIn()';
}


}




/// @nodoc


class Logined implements LoginState {
  const Logined({required this.userCredential});
  

 final  UserCredential? userCredential;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginedCopyWith<Logined> get copyWith => _$LoginedCopyWithImpl<Logined>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Logined&&(identical(other.userCredential, userCredential) || other.userCredential == userCredential));
}


@override
int get hashCode => Object.hash(runtimeType,userCredential);

@override
String toString() {
  return 'LoginState.logined(userCredential: $userCredential)';
}


}

/// @nodoc
abstract mixin class $LoginedCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginedCopyWith(Logined value, $Res Function(Logined) _then) = _$LoginedCopyWithImpl;
@useResult
$Res call({
 UserCredential? userCredential
});




}
/// @nodoc
class _$LoginedCopyWithImpl<$Res>
    implements $LoginedCopyWith<$Res> {
  _$LoginedCopyWithImpl(this._self, this._then);

  final Logined _self;
  final $Res Function(Logined) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userCredential = freezed,}) {
  return _then(Logined(
userCredential: freezed == userCredential ? _self.userCredential : userCredential // ignore: cast_nullable_to_non_nullable
as UserCredential?,
  ));
}


}

/// @nodoc


class LoginedOut implements LoginState {
  const LoginedOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginedOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.loginedOut()';
}


}




/// @nodoc


class LoginError implements LoginState {
  const LoginError({required this.error});
  

 final  String error;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginErrorCopyWith<LoginError> get copyWith => _$LoginErrorCopyWithImpl<LoginError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'LoginState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $LoginErrorCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginErrorCopyWith(LoginError value, $Res Function(LoginError) _then) = _$LoginErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$LoginErrorCopyWithImpl<$Res>
    implements $LoginErrorCopyWith<$Res> {
  _$LoginErrorCopyWithImpl(this._self, this._then);

  final LoginError _self;
  final $Res Function(LoginError) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(LoginError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
