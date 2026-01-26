import '../../../../core/resource/data_state.dart';

import '../../../../core/usecase/usecase.dart';
import '../entities/login_entity.dart';
import '../repositories/login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LogInUseCase implements UseCase<DataState<UserCredential>, LoginEntity?> {
  final LogInRepository logInRepository;
  final LoginEntity params;
  LogInUseCase({required this.logInRepository,required this.params});
  @override
  Future<DataState<UserCredential>> call({LoginEntity? params}) {
    return logInRepository.logIn(loginEntity: params);
  }
}
