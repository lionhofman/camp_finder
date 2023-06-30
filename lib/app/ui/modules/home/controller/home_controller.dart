// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:camp_finder/app/ui/modules/auth/store/auth_store.dart';
import 'package:get/get.dart';

import 'package:camp_finder/app/ui/modules/geolocalization/controller/geolocalization_controller.dart';

class HomeController extends GetxController {
  final AuthStore authStore;
  RxString _userLocalization = "".obs;

  String get userLocation => _userLocalization.value;
  HomeController(
    this.authStore,
  );
  @override
  void onInit() {
    super.onInit();
    asyncInit();
  }

  Future<void> asyncInit() async {
    _userLocalization.value =
        await GeolocalizationController.getCurrentLocation();
  }
}
