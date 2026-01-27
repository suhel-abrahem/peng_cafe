import '../../../../core/resource/data_state.dart';

import '../../../../core/usecase/usecase.dart';

import '../../data/model/login_model.dart';
import '../repositories/login_repository.dart';

class LogInUseCase implements UseCase<DataState<void>?, LoginModel?> {
  final LogInRepository logInRepository;

  LogInUseCase({required this.logInRepository});
  @override
  Future<DataState<void>?> call({LoginModel? params}) {
    return logInRepository.logIn(loginModel: params);
  }
}
