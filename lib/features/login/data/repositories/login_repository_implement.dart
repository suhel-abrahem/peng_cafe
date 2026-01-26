import '../../../../core/resource/data_state.dart';
import '../data_sources/remote/service.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogInRepositoryImplements implements LogInRepository {
  final LoginServices _loginServise;
  LogInRepositoryImplements(this._loginServise);
  @override
  Future<DataState<UserCredential>> logIn({
    required LoginEntity? loginEntity,
  }) async {
    final logInResponse = await _loginServise.logInByFireBase(
      email: loginEntity?.email ?? '',
      password: loginEntity?.password ?? '',
    );
    print(logInResponse.error);
    if (logInResponse.error == "succeed") {
      return DataSuccess(data: logInResponse.data);
    } else {
      return DataFailed(error: logInResponse.error.toString());
    }
  }
}
