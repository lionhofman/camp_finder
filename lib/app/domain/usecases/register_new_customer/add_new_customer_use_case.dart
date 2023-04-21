import 'package:camp_finder/app/domain/repositories/register_new_customer_repository.dart';
import 'package:camp_finder/app/foundation/errors/failure.dart';
import 'package:dartz/dartz.dart';

class AddNewCustomerUseCase {
  final RegisterNewCustomerRepository _customerRepository;
  AddNewCustomerUseCase(
    this._customerRepository,
  );

  Future<Either<Failure, void>> call({
    required String nameCustomer,
    required String loginCustomer,
    required String password,
  }) async {
    return await _customerRepository.registerNewCustomer(
      nameCustomer: nameCustomer,
      loginCustomer: loginCustomer,
      password: password,
    );
  }
}
