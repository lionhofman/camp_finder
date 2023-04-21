import 'package:camp_finder/app/foundation/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRemoteDataSource {
  Future<void> loginEmail({
    required String login,
    required String pass,
  });
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<void> loginEmail({
    required String login,
    required String pass,
  }) {
    return handleLoginEmailRequest(
      userName: login,
      password: pass,
    );
  }

  Future<void> handleLoginEmailRequest({
    required String userName,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userName,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException.getFailureFromAuth(
        statusCode: e.code,
      );
    }
  }
}
