// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:camp_finder/app/core/constants/page_constants.dart';
import 'package:camp_finder/app/core/custom/snackbar_custom.dart';
import 'package:camp_finder/app/ui/global_widgets/bottom_navigation/controllers/root_controller.dart';
import 'package:get/get.dart';

import 'package:camp_finder/app/domain/usecases/login/forgor_password_use_case.dart';
import 'package:camp_finder/app/ui/modules/input/controller/custom_input_controller.dart';

class ForgotPasswordController extends GetxController {
  ForgorPasswordUseCase forgorPasswordUseCase;
  CustomInputController customInputController =
      Get.find<CustomInputController>();

  ForgotPasswordController(
    this.forgorPasswordUseCase,
  );

  Future<void> resetPassword({
    required String email,
  }) async {
    final _result = await forgorPasswordUseCase.call(email: email);
    _result.fold((_failureResult) {
      if (_failureResult.message != null) {
        SnackbarCustom.showSnackbar(
            message: _failureResult.message!, isError: true);
      }
    }, (r) async {
      SnackbarCustom.showSnackbar(
          message: 'E-mail de redefinição de senha enviado com sucesso!',
          isError: false);
      final RootController _rootController = Get.find<RootController>();
      _rootController.changePage(PageConstants.BOTTOM_BAR_INDEX_LOGIN);
    });
  }
}
