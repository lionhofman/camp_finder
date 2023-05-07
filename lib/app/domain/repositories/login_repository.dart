import 'package:camp_finder/app/domain/entities/customer.dart';
import 'package:camp_finder/app/foundation/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, Customer?>> loginEmail({
    required String loginCustomer,
    required String password,
  });

  Future<Either<Failure, void>> forgotPassword({
    required String email,
  });
}
