part of "login_bloc.dart";

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started()=LoginEventStarted;
  const factory LoginEvent.login({required LoginEntity loginEntity}) =
      LoginEventLogin;

  const factory LoginEvent.logout() = LoginEventLogOut;
}
