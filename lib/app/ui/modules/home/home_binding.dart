import 'package:camp_finder/app/ui/modules/auth/store/auth_store.dart';
import 'package:camp_finder/app/ui/modules/camping/camping_binding.dart';
import 'package:camp_finder/app/ui/modules/home/controller/home_controller.dart';
import 'package:camp_finder/app/ui/modules/showcases/highlights/showcase_highlights_binding.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    CampingBinding().dependencies();
    ShowcaseHighlightsBinding().dependencies();
    Get.lazyPut<HomeController>(() => HomeController(
          Get.find<AuthStore>(),
        ));
  }
}
