// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:camp_finder/app/core/custom/snackbar_custom.dart';
import 'package:camp_finder/app/ui/modules/camping_register/camping_register_page.dart';
import 'package:camp_finder/app/ui/modules/login/contoller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:camp_finder/app/core/constants/page_constants.dart';
import 'package:camp_finder/app/domain/usecases/login/logout_use_case.dart';
import 'package:camp_finder/app/ui/app_routes.dart';
import 'package:camp_finder/app/ui/modules/auth/store/auth_store.dart';
import 'package:camp_finder/app/ui/modules/camping/camping_page.dart';
import 'package:camp_finder/app/ui/modules/home/home_page.dart';
import 'package:camp_finder/app/ui/modules/login/login_page.dart';

class RootController extends GetxController {
  final isLoadingLogout = ValueNotifier<bool>(false);
  final AuthStore _authStore;
  late List<Widget> _pages;
  final RxInt _previousIndex = 0.obs;
  final RxInt _currentIndex = 0.obs;
  RxBool _isLoggedIn = false.obs;
  LogoutUseCase logoutUseCase;

  RootController(
    this._authStore,
    this.logoutUseCase,
  ) {
    _pages = [
      const HomePage(),
      CampingPage(),
      const LoginPage(),
      const CampingRegisterPage(),
    ];
  }

  List<Widget> get pages => _pages;
  RxBool get isLoggedIn => _isLoggedIn;
  int get previousIndex => _previousIndex.value;
  int get currentIndex => _currentIndex.value;
  AuthStore get authStore => _authStore;

  @override
  void onInit() {
    isShowIconLogin();
    super.onInit();
  }

  void changePage(int index) {
    Get.until((route) => Get.currentRoute == AppRoutes.BOTTOM_NAVIGATION);
    switch (index) {
      case PageConstants.BOTTOM_BAR_INDEX_HOME:
        //TODO setup home
        break;
      case PageConstants.BOTTOM_BAR_INDEX_FINDER:
        //TODO setup finder page
        break;

      case PageConstants.BOTTOM_BAR_INDEX_LOGIN:
        // if (_authStore.isLoggedIn) {
        //   index = PageConstants.BOTTOM_BAR_INDEX_HOME;
        // }
        break;
      default:
    }

    _previousIndex.value = currentIndex;
    _currentIndex.value = index;
  }

  Future<void> logout() async {
    isLoadingLogout.value = true;
    final _result = await logoutUseCase.call();
    _result.fold((_failureResult) {
      if (_failureResult.message != null) {
        SnackbarCustom.showSnackbar(
            message: _failureResult.message!, isError: true);
      }
    }, (r) async {
      SnackbarCustom.showSnackbar(
          message: 'Você foi desconectado com sucesso!', isError: false);
      changePage(PageConstants.BOTTOM_BAR_INDEX_HOME);
      final LoginController _loginController = Get.find<LoginController>();
      _loginController.customInputController.clearAllInputs();
      _isLoggedIn.value = false;
      isLoadingLogout.value = false;
    });
  }

  isShowIconLogin() {
    _isLoggedIn = authStore.isLoggedIn;
  }
}
