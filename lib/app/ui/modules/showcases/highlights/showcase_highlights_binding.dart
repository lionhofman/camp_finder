import 'package:camp_finder/app/domain/usecases/campings/get_campings_limit_to_last_use_case.dart';
import 'package:camp_finder/app/ui/modules/showcases/highlights/controller/showcase_highlights_controller.dart';
import 'package:get/get.dart';

class ShowcaseHighlightsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowcaseHighlightsController>(() =>
        ShowcaseHighlightsController(
            Get.find<GetCampingsLimitToLastUseCase>()));
  }
}
