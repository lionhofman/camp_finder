import 'package:camp_finder/app/domain/repositories/login_repository.dart';
import 'package:camp_finder/app/foundation/errors/failure.dart';
import 'package:dartz/dartz.dart';

class LogoutUseCase {
  final LoginRepository _loginRepository;
  LogoutUseCase(
    this._loginRepository,
  );

  Future<Either<Failure, void>> call() async {
    return await _loginRepository.signOut();
  }
}
