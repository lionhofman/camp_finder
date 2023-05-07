import 'package:camp_finder/app/ui/modules/auth/store/auth_store.dart';
import 'package:get/get.dart';

class AuthStoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthStore>(AuthStore(), permanent: true);
  }
}
