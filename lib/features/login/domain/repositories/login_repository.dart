import 'package:peng_cafe/features/login/data/model/login_model.dart';

import '../../../../core/resource/data_state.dart';

abstract class LogInRepository {
  Future<DataState<void>?> logIn({required LoginModel? loginModel});
}
