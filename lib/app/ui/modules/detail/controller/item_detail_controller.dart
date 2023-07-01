import 'package:camp_finder/app/domain/entities/camping.dart';

import 'package:get/get.dart';

class ItemDetailController extends GetxController {
  Rxn<Camping> _campingDetail = Rxn<Camping>();

  Rxn<Camping> get campingDetail => _campingDetail;
  @override
  void onInit() {
    super.onInit();
    _campingDetail.value = Get.arguments;
  }
}
