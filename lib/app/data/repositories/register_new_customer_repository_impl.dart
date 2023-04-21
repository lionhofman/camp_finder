// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:camp_finder/app/domain/repositories/register_new_customer_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:camp_finder/app/data/datasources/register_new_customer_remote_data_source.dart';
import 'package:camp_finder/app/foundation/errors/failure.dart';

class RegisterNewCustomerRepositoryImpl
    implements RegisterNewCustomerRepository {
  final RegisterNewCustomerRemoteDataSource _registerNewCustomerDataSource;
  RegisterNewCustomerRepositoryImpl(
    this._registerNewCustomerDataSource,
  );

  @override
  Future<Either<Failure, void>> registerNewCustomer(
      {required String nameCustomer,
      required String loginCustomer,
      required String password}) async {
    try {
      await _registerNewCustomerDataSource.registerNewCustomer(
          loginCustomer: loginCustomer,
          nameCustomer: nameCustomer,
          password: password);
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
