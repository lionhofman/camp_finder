import 'package:camp_finder/app/data/datasources/register_new_customer_remote_data_source.dart';
import 'package:camp_finder/app/data/repositories/register_new_customer_repository_impl.dart';
import 'package:camp_finder/app/domain/repositories/register_new_customer_repository.dart';
import 'package:camp_finder/app/domain/usecases/register_new_customer/add_new_customer_use_case.dart';
import 'package:camp_finder/app/ui/modules/input/custom_input_binding.dart';
import 'package:camp_finder/app/ui/modules/register_new_customer/controller/register_new_customer_controller.dart';
import 'package:get/get.dart';

class RegisterNewCustomerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterNewCustomerRemoteDataSource>(
        () => RegisterNewCustomerDataSourceImpl());
    Get.lazyPut<RegisterNewCustomerRepository>(() =>
        RegisterNewCustomerRepositoryImpl(
            Get.find<RegisterNewCustomerRemoteDataSource>()));
    Get.lazyPut(
        () => AddNewCustomerUseCase(Get.find<RegisterNewCustomerRepository>()));
    Get.lazyPut<RegisterNewCustomerController>(
        () => RegisterNewCustomerController(Get.find<AddNewCustomerUseCase>()));

    CustomInputBinding().dependencies();
  }
}
