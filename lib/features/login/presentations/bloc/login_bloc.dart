import 'package:peng_cafe/features/login/data/model/login_model.dart';

import '../../../../core/resource/data_state.dart';

import '../../domain/usecase/login.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "login_bloc.freezed.dart";
part "login_event.dart";
part "login_state.dart";

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LogInUseCase _logInUseCase;

  LoginBloc(this._logInUseCase) : super(const LoginInitial()) {
    on<LoginEventStarted>((event, emit) {
      emit(const LoginState.initial());
    });
    on<LoginEventLogin>((event, emit) async {
      emit(const LoginState.loading());

      final loginState = await _logInUseCase(params: event.loginModel);
      if (loginState is DataSuccess) {
        emit(const LoginState.succeed());
      } else {
        emit(LoginState.error(error: loginState?.error ?? ''));
      }
    });
  }
}
