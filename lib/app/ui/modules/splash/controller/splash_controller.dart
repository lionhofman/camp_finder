import 'package:camp_finder/app/ui/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _initializeApp();
  }

  _initializeApp() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAllNamed(AppRoutes.BOTTOM_NAVIGATION);
      });
    });
  }
}
