import 'package:get_it/get_it.dart';
import 'package:peng_cafe/features/login/data/repositories/login_repository_implement.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app/app_preferences.dart';
import '../features/login/data/data_sources/remote/service.dart';
import '../features/login/domain/entities/login_entity.dart';
import '../features/login/domain/repositories/login_repository.dart';
import '../features/login/domain/usecase/login.dart';
import '../features/login/presentations/bloc/login_bloc.dart';
import 'resource/common_service/common_service.dart';
import 'resource/connectivity/check_connectivity.dart';

final getItInstance = GetIt.instance;
Future<void> initializeDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getItInstance.registerFactory<AppPreferences>(
    () => AppPreferences(sharedPreferences),
  );
  getItInstance.registerSingleton<LoginServices>(LoginServices());
  getItInstance.registerSingleton<LoginEntity>(const LoginEntity());
  getItInstance.registerSingleton<LogInRepository>(
    LogInRepositoryImplements(getItInstance()),
  );
  getItInstance.registerSingleton<LogInUseCase>(
    LogInUseCase(
      logInRepository: getItInstance<LogInRepository>(),
      params: getItInstance<LoginEntity>(),
    ),
  );
  getItInstance.registerFactory<LoginBloc>(() => LoginBloc(getItInstance()));
  // getItInstance.registerSingleton<CommonService>(CommonService());
  getItInstance.registerSingleton<CheckConnectivity>(CheckConnectivity());
}
