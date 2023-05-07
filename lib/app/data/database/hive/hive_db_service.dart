import 'package:camp_finder/app/core/constants/local_storage_constants.dart';
import 'package:camp_finder/app/domain/entities/customer.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDbService {
  static final HiveDbService _instance = HiveDbService._internal();
  static HiveDbService instance = HiveDbService();

  var customerHiveBox;
  var uidHiveBox;
  factory HiveDbService() {
    return _instance;
  }
  HiveDbService._internal();

  Future<void> asyncInit() async {
    await Hive.initFlutter();

    Hive.registerAdapter(CustomerAdapter());

    customerHiveBox =
        await Hive.openBox<Customer>(LocalStorageConstants.CUSTOMER_HIVE_BOX);
    uidHiveBox = await Hive.openBox(LocalStorageConstants.UID_HIVE_BOX);
  }
}
