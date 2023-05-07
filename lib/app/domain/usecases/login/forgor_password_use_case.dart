import 'package:camp_finder/app/domain/repositories/login_repository.dart';
import 'package:camp_finder/app/foundation/errors/failure.dart';
import 'package:dartz/dartz.dart';

class ForgorPasswordUseCase {
  final LoginRepository _loginRepository;
  ForgorPasswordUseCase(
    this._loginRepository,
  );

  Future<Either<Failure, void>> call({
    required String email,
  }) async {
    return await _loginRepository.forgotPassword(email: email);
  }
}
