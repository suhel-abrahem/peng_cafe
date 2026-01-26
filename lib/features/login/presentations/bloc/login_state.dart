part of '../bloc/login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;
const factory LoginState.logingIn() = LoginLoginIn;
  const factory LoginState.logined({required UserCredential? userCredential}) =
      Logined;
  const factory LoginState.loginedOut() = LoginedOut;
  const factory LoginState.error({required String error}) = LoginError;
}
