// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:camp_finder/app/core/constants/page_constants.dart';
import 'package:camp_finder/app/core/custom/snackbar_custom.dart';
import 'package:camp_finder/app/domain/usecases/login/login_email_use_case.dart';

import 'package:camp_finder/app/ui/global_widgets/bottom_navigation/controllers/root_controller.dart';
import 'package:camp_finder/app/ui/modules/input/controller/custom_input_controller.dart';

class LoginController extends GetxController {
  LoginEmailUseCase loginEmailUseCase;
  CustomInputController customInputController =
      Get.find<CustomInputController>();

  LoginController(
    this.loginEmailUseCase,
  );

  Future<void> loginEmail({
    required String loginCustomer,
    required String password,
  }) async {
    final _result = await loginEmailUseCase.call(
        loginCustomer: loginCustomer.trim(), password: password);
    _result.fold((_failureResult) {
      if (_failureResult.message != null) {
        SnackbarCustom.showSnackbar(
            message: _failureResult.message!, isError: true);
      }
    }, (r) async {
      SnackbarCustom.showSnackbar(
          message: 'Login efetuado com sucesso!', isError: false);
      final RootController _rootController = Get.find<RootController>();
      _rootController.isShowIconLogin();
      _rootController.changePage(PageConstants.BOTTOM_BAR_INDEX_HOME);
    });
  }
}
