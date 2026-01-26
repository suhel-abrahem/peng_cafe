import '../../../../core/resource/data_state.dart';

import '../entities/login_entity.dart';

import 'package:firebase_auth/firebase_auth.dart';

abstract class LogInRepository {
  Future<DataState<UserCredential>> logIn({required LoginEntity? loginEntity});
}
