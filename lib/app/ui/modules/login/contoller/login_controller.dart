// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:camp_finder/app/core/constants/page_constants.dart';
import 'package:camp_finder/app/core/custom/snackbar_custom.dart';
import 'package:camp_finder/app/domain/usecases/login/login_email_use_case.dart';
import 'package:camp_finder/app/domain/usecases/login/login_social_google_use_case.dart';
import 'package:camp_finder/app/ui/global_widgets/bottom_navigation/controllers/root_controller.dart';
import 'package:camp_finder/app/ui/modules/input/controller/custom_input_controller.dart';

class LoginController extends GetxController {
  final isLoadingGoogleSignIn = ValueNotifier<bool>(false);
  LoginEmailUseCase loginEmailUseCase;
  LoginSocialGoogleUseCase loginSocialGoogleUseCase;
  CustomInputController customInputController =
      Get.find<CustomInputController>();

  LoginController(
    this.loginEmailUseCase,
    this.loginSocialGoogleUseCase,
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

  Future<void> loginSocialGoogle() async {
    isLoadingGoogleSignIn.value = true;
    final _result = await loginSocialGoogleUseCase.call();
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
      isLoadingGoogleSignIn.value = false;
      _rootController.changePage(PageConstants.BOTTOM_BAR_INDEX_HOME);
    });
  }
}
