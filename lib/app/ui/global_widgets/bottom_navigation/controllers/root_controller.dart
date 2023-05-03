import 'package:camp_finder/app/core/constants/page_constants.dart';
import 'package:camp_finder/app/ui/app_routes.dart';
import 'package:camp_finder/app/ui/modules/camping/camping_page.dart';
import 'package:camp_finder/app/ui/modules/home/home_page.dart';
import 'package:camp_finder/app/ui/modules/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  late List<Widget> _pages;
  final RxInt _previousIndex = 0.obs;
  final RxInt _currentIndex = 0.obs;
  List<Widget> get pages => _pages;
  int get previousIndex => _previousIndex.value;
  int get currentIndex => _currentIndex.value;

  RootController() {
    _pages = [
      const HomePage(),
      CampingPage(),
      LoginPage(),
    ];
  }

  void changePage(int index) {
    Get.until((route) => Get.currentRoute == AppRoutes.BOTTOM_NAVIGATION);
    switch (index) {
      case PageConstants.BOTTOM_BAR_INDEX_HOME:
        //TODO setup home
        break;
      case PageConstants.BOTTOM_BAR_INDEX_FINDER:
        //TODO setup finder page
        break;

      case PageConstants.BOTTOM_BAR_INDEX_LOGIN:
        //TODO setup login page
        break;
      default:
    }

    _previousIndex.value = currentIndex;
    _currentIndex.value = index;
  }
}
