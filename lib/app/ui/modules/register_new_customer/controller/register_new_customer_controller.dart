import 'package:camp_finder/app/core/custom/snackbar_custom.dart';
import 'package:camp_finder/app/foundation/errors/failure.dart';
import 'package:camp_finder/app/ui/app_routes.dart';
import 'package:camp_finder/app/ui/modules/input/controller/custom_input_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:camp_finder/app/domain/usecases/register_new_customer/add_new_customer_use_case.dart';

class RegisterNewCustomerController extends GetxController {
  // Usar essa autenticação depois de efetuar o cadastro, passando o usuário corrente
  // variavel usuario = _auth.currentUser;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Failure? failure;
  AddNewCustomerUseCase addNewCustomerUseCase;
  CustomInputController customInputController =
      Get.find<CustomInputController>();

  RegisterNewCustomerController(
    this.addNewCustomerUseCase,
  );

  Future<void> addNewCustomer({
    required String nameCustomer,
    required String loginCustomer,
    required String password,
  }) async {
    final _result = await addNewCustomerUseCase.call(
        nameCustomer: nameCustomer,
        loginCustomer: loginCustomer,
        password: password);
    _result.fold((_failureResult) {
      if (_failureResult.message != null) {
        SnackbarCustom.showSnackbar(
            message: _failureResult.message!, isError: true);
      }
    }, (r) async {
      SnackbarCustom.showSnackbar(
          message: 'Usuário cadastrado com sucesso!', isError: false);
      Get.toNamed(AppRoutes.HOME);
    });
  }
}
