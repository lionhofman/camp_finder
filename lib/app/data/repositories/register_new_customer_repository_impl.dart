// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:camp_finder/app/domain/entities/customer.dart';
import 'package:camp_finder/app/domain/repositories/register_new_customer_repository.dart';
import 'package:camp_finder/app/ui/modules/auth/store/auth_store.dart';
import 'package:dartz/dartz.dart';

import 'package:camp_finder/app/data/datasources/register_new_customer_remote_data_source.dart';
import 'package:camp_finder/app/foundation/errors/failure.dart';

class RegisterNewCustomerRepositoryImpl
    implements RegisterNewCustomerRepository {
  final RegisterNewCustomerRemoteDataSource _registerNewCustomerDataSource;
  final AuthStore _authStore;
  RegisterNewCustomerRepositoryImpl(
    this._registerNewCustomerDataSource,
    this._authStore,
  );

  @override
  Future<Either<Failure, void>> registerNewCustomer(
      {required String nameCustomer,
      required String loginCustomer,
      required String password}) async {
    try {
      Customer? customer =
          await _registerNewCustomerDataSource.registerNewCustomer(
              loginCustomer: loginCustomer,
              nameCustomer: nameCustomer,
              password: password);
      _authStore.setCustomer(customer);
      if (customer != null) {
        _authStore.setUserUID(customer.code);
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
