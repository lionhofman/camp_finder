import 'package:camp_finder/app/ui/modules/detail/controller/item_detail_controller.dart';
import 'package:get/get.dart';

class ItemDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemDetailController>(() => ItemDetailController());
  }
}
