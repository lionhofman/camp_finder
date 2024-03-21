import 'package:camp_finder/app/ui/modules/auth/store/auth_store.dart';
import 'package:camp_finder/app/ui/modules/favorite/controller/favorite_offline_controller.dart';
import 'package:get/get.dart';

class FavoriteOfflineBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteOfflineController>(() => FavoriteOfflineController(
          Get.find<AuthStore>(),
        ));
  }
}
