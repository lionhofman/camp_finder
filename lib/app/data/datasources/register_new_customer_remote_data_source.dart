import 'package:camp_finder/app/foundation/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterNewCustomerRemoteDataSource {
  Future<void> registerNewCustomer({
    required String nameCustomer,
    required String loginCustomer,
    required String password,
  });
}

class RegisterNewCustomerDataSourceImpl
    implements RegisterNewCustomerRemoteDataSource {
  @override
  Future<void> registerNewCustomer(
      {required String nameCustomer,
      required String loginCustomer,
      required String password}) {
    return handleNewCustomerRequest(
      userName: loginCustomer,
      password: password,
    );
  }
}

Future<void> handleNewCustomerRequest({
  required String userName,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userName,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    throw AuthException.getFailureFromAuth(
      statusCode: e.code,
    );
  }
}
