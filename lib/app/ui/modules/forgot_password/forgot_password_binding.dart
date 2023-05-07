import 'package:camp_finder/app/domain/repositories/login_repository.dart';
import 'package:camp_finder/app/domain/usecases/login/forgor_password_use_case.dart';
import 'package:camp_finder/app/ui/modules/forgot_password/controller/forgot_password_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgorPasswordUseCase(Get.find<LoginRepository>()));
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController(
          Get.find<ForgorPasswordUseCase>(),
        ));
    // CustomInputBinding().dependencies();
  }
}
