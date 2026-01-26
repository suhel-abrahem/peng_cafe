import '../../../../core/injection_container.dart';
import '../../../../core/resource/data_state.dart';
import '../../domain/repositories/login_repository.dart';

import '../../domain/usecase/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/login_entity.dart';
part "login_bloc.freezed.dart";
part "login_event.dart";
part "login_state.dart";

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LogInUseCase _logInUseCase;

  LoginBloc(this._logInUseCase) : super(const LoginInitial()) {
    on<LoginEventLogin>((event, emit) async {
      emit(const LoginState.logingIn());

      final loginState = await _logInUseCase(params: event.loginEntity);
      if (loginState is DataSuccess) {
        emit(LoginState.logined(userCredential: loginState.data));
      } else {
        emit(LoginState.error(error: loginState.error ?? ''));
      }
    });
  }
}
