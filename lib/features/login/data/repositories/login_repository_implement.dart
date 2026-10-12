import 'package:peng_cafe/core/resource/data_state.dart';

import '../data_sources/remote/service.dart';
import '../model/login_model.dart';
import '../../domain/repositories/login_repository.dart';

class LogInRepositoryImplements implements LogInRepository {
  final LoginServices _loginService;

  LogInRepositoryImplements(this._loginService);

  @override
  Future<DataState<void>?> logIn({required LoginModel? loginModel}) async {
    final email = loginModel?.email?.trim() ?? '';
    final password = loginModel?.password ?? '';

    if (email.isEmpty || password.isEmpty) {
      return DataFailed(error: 'Email and password are required.');
    }

    return _loginService.logIn(email: email, password: password);
  }
}
