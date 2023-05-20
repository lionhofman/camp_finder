import 'package:camp_finder/app/core/constants/local_storage_constants.dart';
import 'package:camp_finder/app/data/database/hive/hive_db_service.dart';
import 'package:camp_finder/app/domain/entities/customer.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AuthStore extends GetxController {
  /// Save the user data on the internal database.
  Future<void> setCustomer(Customer? customer) async {
    if (customer == null) {
      return;
    }
    Box<Customer> boxCustomer = await HiveDbService.instance.customerHiveBox;
    await boxCustomer.clear();
    await boxCustomer.add(customer);
  }

  /// Returns the user data if exists, otherwise returns null;
  Future<Customer?> getCustomer() async {
    Box<Customer> box = await HiveDbService.instance.customerHiveBox;

    if (box.isOpen && box.values.isNotEmpty) {
      return box.values.first;
    } else {
      return null;
    }
  }

  /// Clean the user data from the internal database.
  Future<void> clearCustomer() async {
    Box<Customer> box = await HiveDbService.instance.customerHiveBox;
    if (box.isOpen) {
      box.clear();
    }
    clearUserUID();
  }

  void clearUserUID() {
    HiveDbService.instance.uidHiveBox
        .put(LocalStorageConstants.UID_HIVE_BOX, null);
  }

  setUserUID(String value) => HiveDbService.instance.uidHiveBox
      .put(LocalStorageConstants.UID_HIVE_BOX, value);

  String? get userCustomer =>
      HiveDbService.instance.uidHiveBox.get(LocalStorageConstants.UID_HIVE_BOX);

  bool get isLoggedIn => userCustomer != null;
}
