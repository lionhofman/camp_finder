import 'package:camp_finder/app/data/database/db.dart';
import 'package:camp_finder/app/domain/entities/customer.dart';
import 'package:camp_finder/app/foundation/errors/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class LoginRemoteDataSource {
  Future<Customer?> loginEmail({
    required String login,
    required String pass,
  });

  Future<void> forgotPassword({
    required String email,
  });

  socialGoogleEmail();

  Future<void> signOut();
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

      return customer;
    } on FirebaseAuthException catch (e) {
      throw AuthException.getFailureFromAuth(
        statusCode: e.code,
      );
    }
  }

  @override
  Future<void> forgotPassword({required String email}) {
    return sendPasswordResetEmail(
      email: email,
    );
  }

  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthException.getFailureFromAuth(
        statusCode: e.code,
      );
    } catch (e) {
      print('Erro ao enviar email de redefinição de senha: $e');
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      return await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthException.getFailureFromAuth(
        statusCode: e.code,
      );
    }
  }

  @override
  socialGoogleEmail() async {
    try {
      //begin interactive sign in process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      //obtain auth details from request
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      // create a new credential for user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      // finally, lets sign in

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw AuthException.getFailureFromAuth(
        statusCode: e.code,
      );
    }
  }
}
