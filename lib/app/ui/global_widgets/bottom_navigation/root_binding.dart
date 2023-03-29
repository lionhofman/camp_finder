import 'package:camp_finder/app/ui/global_widgets/bottom_navigation/controllers/root_controller.dart';
import 'package:camp_finder/app/ui/modules/home/home_binding.dart';
import 'package:get/get.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    HomeBinding().dependencies();
    Get.put<RootController>(RootController());
  }
}
