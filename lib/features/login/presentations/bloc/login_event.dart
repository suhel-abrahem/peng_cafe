part of "login_bloc.dart";

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = LoginEventStarted;
  const factory LoginEvent.login({required LoginModel loginModel}) =
      LoginEventLogin;

  const factory LoginEvent.logout() = LoginEventLogOut;
}
