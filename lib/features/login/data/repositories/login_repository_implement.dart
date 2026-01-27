import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:peng_cafe/core/resource/connectivity/check_connectivity.dart';

import '../../../../core/resource/data_state.dart';
import '../data_sources/remote/service.dart';

import '../../domain/repositories/login_repository.dart';

import '../model/login_model.dart';

class LogInRepositoryImplements implements LogInRepository {
  final LoginServices _loginService;
  final CheckConnectivity _checkConnectivity;
  LogInRepositoryImplements(this._loginService, this._checkConnectivity);
  @override
  Future<DataState<void>?> logIn({required LoginModel? loginModel}) async {
    ConnectivityResult? connectivityResult = ConnectivityResult.none;
    DataState<void>? response;
    await _checkConnectivity.checkConnectivity().then((value) {
      connectivityResult = value.last;
    });
    if (connectivityResult == ConnectivityResult.none) {
      response = const NOInternetDataState();
      return response;
    }
    try {
      await _loginService
          .logInByFireBase(
            email: loginModel?.email ?? '',
            password: loginModel?.password ?? '',
          )
          .then((onValue) {
            if (onValue is DataSuccess) {
              response = DataSuccess(data: null);
              return response;
            } else {
              response = DataFailed(error: onValue.error ?? '');
              return response;
            }
          });
    } catch (e) {
      response = DataFailed(error: e.toString());
      return response;
    }
    return response;
  }
}
