// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:ffi';

import 'package:camp_finder/app/domain/entities/customer.dart';
import 'package:camp_finder/app/ui/modules/auth/store/auth_store.dart';
import 'package:dartz/dartz.dart';

import 'package:camp_finder/app/data/datasources/login_remote_data_source.dart';
import 'package:camp_finder/app/domain/repositories/login_repository.dart';
import 'package:camp_finder/app/foundation/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource _loginRemoteDataSource;
  final AuthStore _authStore;
  LoginRepositoryImpl(
    this._loginRemoteDataSource,
    this._authStore,
  );

  @override
  Future<Either<Failure, Customer?>> loginEmail(
      {required String loginCustomer, required String password}) async {
    try {
      final Customer? customer = await _loginRemoteDataSource.loginEmail(
          login: loginCustomer, pass: password);
      _authStore.setCustomer(customer);
      if (customer != null) {
        _authStore.setUserUID(customer.code);
      }
      return Right(customer);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      } else {
        return Left(UnknownFailure());
      }
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword({required String email}) async {
    try {
      await _loginRemoteDataSource.forgotPassword(email: email);

      return Right(Void);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      } else {
        return Left(UnknownFailure());
      }
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _loginRemoteDataSource.signOut();
      await GoogleSignIn().disconnect();
      if (FirebaseAuth.instance.currentUser != null) {
        if (FirebaseAuth.instance.currentUser != null) {
          throw UnsupportedError(
            'Usuário não foi deslogado do firebase corretamente',
          );
        }
      } else {
        _authStore.clearCustomer();
      }
      return Right(Void);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      } else {
        return Left(UnknownFailure());
      }
    }
  }

  @override
  Future<Either<Failure, void>> socialGoogleEmail() async {
    try {
      await _loginRemoteDataSource.socialGoogleEmail();

      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser != null) {
        final Customer? customer = Customer(
          code: gUser.id,
          name: gUser.displayName!,
          email: gUser.email,
        );
        _authStore.setCustomer(customer);
        if (customer != null) {
          _authStore.setUserUID(customer.code);
        }
      }
      return Right(Void);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      } else {
        return Left(UnknownFailure());
      }
    }
  }
}
