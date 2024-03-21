import 'package:camp_finder/app/ui/modules/auth/store/auth_store.dart';
import 'package:camp_finder/app/ui/modules/geolocalization/controller/geolocalization_controller.dart';
import 'package:get/get.dart';

class FavoriteOfflineController extends GetxController {
  final AuthStore authStore;
  RxString _userLocalization = "".obs;

  String get userLocation => _userLocalization.value;
  FavoriteOfflineController(
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
