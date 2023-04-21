import 'package:camp_finder/app/ui/modules/input/controller/custom_input_controller.dart';
import 'package:get/get.dart';

class CustomInputBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomInputController>(() => CustomInputController());
  }
}
