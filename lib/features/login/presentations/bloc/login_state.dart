part of '../bloc/login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading() = LoginLoading;
  const factory LoginState.succeed() = LoginSucceed;
  const factory LoginState.loggedOut() = LoggedOut;
  const factory LoginState.error({required String error}) = LoginError;
}
