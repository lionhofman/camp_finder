import 'package:camp_finder/app/domain/repositories/camping_repository.dart';
import 'package:camp_finder/app/domain/usecases/campings/get_autocomplete_use_case.dart';
import 'package:camp_finder/app/ui/modules/search/controller/search_manager_controller.dart';
import 'package:get/get.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetAutocompleteUseCase(Get.find<CampingRepository>()));
    Get.lazyPut<SearchManagerController>(
        () => SearchManagerController(Get.find<GetAutocompleteUseCase>()));
  }
}
