// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:ffi';

import 'package:camp_finder/app/domain/entities/customer.dart';
import 'package:camp_finder/app/ui/modules/auth/store/auth_store.dart';
import 'package:dartz/dartz.dart';

import 'package:camp_finder/app/data/datasources/login_remote_data_source.dart';
import 'package:camp_finder/app/domain/repositories/login_repository.dart';
import 'package:camp_finder/app/foundation/errors/failure.dart';

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
}
