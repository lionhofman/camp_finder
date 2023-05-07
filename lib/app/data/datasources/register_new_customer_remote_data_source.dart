import 'package:camp_finder/app/data/database/db.dart';
import 'package:camp_finder/app/domain/entities/customer.dart';
import 'package:camp_finder/app/foundation/errors/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterNewCustomerRemoteDataSource {
  Future<Customer?> registerNewCustomer({
    required String nameCustomer,
    required String loginCustomer,
    required String password,
  });
}

class RegisterNewCustomerDataSourceImpl
    implements RegisterNewCustomerRemoteDataSource {
  @override
  Future<Customer?> registerNewCustomer(
      {required String nameCustomer,
      required String loginCustomer,
      required String password}) {
    return handleNewCustomerRequest(
      name: nameCustomer,
      loginCustomer: loginCustomer,
      password: password,
    );
  }
}

Future<Customer?> handleNewCustomerRequest({
  required String name,
  required String loginCustomer,
  required String password,
}) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: loginCustomer,
      password: password,
    );

    // add additional information in Firestore
    CollectionReference users =
        FirebaseFirestore.instance.collection(DB.DB_USER_NAME);
    await users.doc(userCredential.user!.uid).set({
      'name': name,
      'email': loginCustomer,
    });
    return Customer(
      code: userCredential.user!.uid,
      name: name,
      email: loginCustomer,
    );
  } on FirebaseAuthException catch (e) {
    throw AuthException.getFailureFromAuth(
      statusCode: e.code,
    );
  } catch (e) {
    print("Erro ao cadastrar usuário: $e");
    rethrow;
  }
}
