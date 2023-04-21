
import 'package:camp_finder/app/foundation/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterNewCustomerRepository {
  Future<Either<Failure, void>> registerNewCustomer({
    required String nameCustomer,
    required String loginCustomer,
    required String password,
  });
}
