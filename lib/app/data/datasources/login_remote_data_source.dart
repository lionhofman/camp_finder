import 'package:camp_finder/app/data/database/db.dart';
import 'package:camp_finder/app/data/models/customer_response.dart';
import 'package:camp_finder/app/domain/entities/customer.dart';
import 'package:camp_finder/app/foundation/errors/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRemoteDataSource {
  Future<Customer?> loginEmail({
    required String login,
    required String pass,
  });
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<Customer?> loginEmail({
    required String login,
    required String pass,
  }) {
    return handleLoginEmailRequest(
      userName: login,
      password: pass,
    );
  }

  Future<Customer?> handleLoginEmailRequest({
    required String userName,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userName,
        password: password,
      );
      DocumentReference users = FirebaseFirestore.instance
          .collection(DB.DB_USER_NAME)
          .doc(userCredential.user!.uid);
      Customer? customer;
      await users.get().then((querySnapshot) {
        customer = Customer(
          code: userCredential.user!.uid,
          name: querySnapshot.get("name"),
          email: querySnapshot.get("email"),
        );
      });

      // return CustomerResponse.fromFirestore(customer.user);
      return customer;
    } on FirebaseAuthException catch (e) {
      throw AuthException.getFailureFromAuth(
        statusCode: e.code,
      );
    }
  }
}
