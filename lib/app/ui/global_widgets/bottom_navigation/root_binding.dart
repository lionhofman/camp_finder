import 'package:camp_finder/app/domain/usecases/login/logout_use_case.dart';
import 'package:camp_finder/app/ui/global_widgets/bottom_navigation/controllers/root_controller.dart';
import 'package:camp_finder/app/ui/modules/auth/auth_store_binding.dart';
import 'package:camp_finder/app/ui/modules/auth/store/auth_store.dart';
import 'package:camp_finder/app/ui/modules/camping/camping_binding.dart';
import 'package:camp_finder/app/ui/modules/home/home_binding.dart';
import 'package:camp_finder/app/ui/modules/login/login_binding.dart';
import 'package:get/get.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    AuthStoreBinding().dependencies();
    HomeBinding().dependencies();
    CampingBinding().dependencies();
    LoginBinding().dependencies();

    Get.put<RootController>(
      RootController(
        Get.find<AuthStore>(),
        Get.find<LogoutUseCase>(),
      ),
    );
  }
}
