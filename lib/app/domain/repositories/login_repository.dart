import 'package:camp_finder/app/foundation/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, void>> loginEmail({
    required String loginCustomer,
    required String password,
  });
}
