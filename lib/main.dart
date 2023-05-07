import 'package:camp_finder/app/app_widget.dart';
import 'package:camp_finder/app/data/database/hive/hive_db_service.dart';
import 'package:camp_finder/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var hiveDBService = HiveDbService.instance;
  await hiveDBService.asyncInit();
  runApp(const AppWidget());
}
