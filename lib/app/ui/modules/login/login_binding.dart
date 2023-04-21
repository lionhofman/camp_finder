import 'package:camp_finder/app/data/datasources/login_remote_data_source.dart';
import 'package:camp_finder/app/data/repositories/login_repository_impl.dart';
import 'package:camp_finder/app/domain/repositories/login_repository.dart';
import 'package:camp_finder/app/domain/usecases/login/login_email_use_case.dart';
import 'package:camp_finder/app/ui/modules/input/custom_input_binding.dart';
import 'package:get/get.dart';

import 'contoller/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl());
    Get.lazyPut<LoginRepository>(
        () => LoginRepositoryImpl(Get.find<LoginRemoteDataSource>()));
    Get.lazyPut(() => LoginEmailUseCase(Get.find<LoginRepository>()));
    Get.lazyPut<LoginController>(
        () => LoginController(Get.find<LoginEmailUseCase>()));
    CustomInputBinding().dependencies();
  }
}
