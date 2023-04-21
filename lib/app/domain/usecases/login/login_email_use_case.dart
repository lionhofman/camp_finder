import 'package:camp_finder/app/domain/repositories/login_repository.dart';
import 'package:camp_finder/app/foundation/errors/failure.dart';
import 'package:dartz/dartz.dart';

class LoginEmailUseCase {
  final LoginRepository _loginRepository;
  LoginEmailUseCase(
    this._loginRepository,
  );

  Future<Either<Failure, void>> call({
    required String loginCustomer,
    required String password,
  }) async {
    return await _loginRepository.loginEmail(
      loginCustomer: loginCustomer,
      password: password,
    );
  }
}
