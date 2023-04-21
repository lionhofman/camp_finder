// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:ffi';

import 'package:dartz/dartz.dart';

import 'package:camp_finder/app/data/datasources/login_remote_data_source.dart';
import 'package:camp_finder/app/domain/repositories/login_repository.dart';
import 'package:camp_finder/app/foundation/errors/failure.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource _loginRemoteDataSource;
  LoginRepositoryImpl(
    this._loginRemoteDataSource,
  );

  @override
  Future<Either<Failure, void>> loginEmail(
      {required String loginCustomer, required String password}) async {
    try {
      await _loginRemoteDataSource.loginEmail(
          login: loginCustomer, pass: password);
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
