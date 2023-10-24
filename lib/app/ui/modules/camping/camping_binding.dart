import 'package:camp_finder/app/data/datasources/camping_remote_data_source.dart';
import 'package:camp_finder/app/data/repositories/camping_repository_impl.dart';
import 'package:camp_finder/app/domain/repositories/camping_repository.dart';
import 'package:camp_finder/app/domain/usecases/campings/get_all_campings_use_case.dart';
import 'package:camp_finder/app/domain/usecases/campings/get_campings_limit_to_last_use_case.dart';
import 'package:camp_finder/app/ui/modules/camping/controller/camping_controller.dart';
import 'package:get/get.dart';

class CampingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CampingRemoteDataSource>(() => CampingRemoteDataSourceImpl());
    Get.lazyPut<CampingRepository>(
        () => CampingRepositoryImpl(Get.find<CampingRemoteDataSource>()));
    Get.lazyPut(() => GetAllCampingsUseCase(Get.find<CampingRepository>()));
    Get.lazyPut(
        () => GetCampingsLimitToLastUseCase(Get.find<CampingRepository>()));
    Get.lazyPut<CampingController>(
        () => CampingController(Get.find<GetAllCampingsUseCase>()));
  }
}
