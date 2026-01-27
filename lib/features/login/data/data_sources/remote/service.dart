import '../../../../../core/resource/data_state.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginServices {
  Future<DataState> logInByFireBase({
    required String email,
    required String password,
  }) async {
    UserCredential? response;
    try {
      response = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return DataSuccess(data: response);
    } on FirebaseAuthException catch (e) {
      return DataFailed(error: e.toString());
    }
  }
}
