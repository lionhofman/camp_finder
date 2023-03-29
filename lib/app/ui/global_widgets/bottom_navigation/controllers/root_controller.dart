import 'package:camp_finder/app/core/constants/page_constants.dart';
import 'package:camp_finder/app/ui/modules/home/home_page.dart';
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
      HomePage(),
    ];
  }

  void changePage(int index) {
    switch (index) {
      case PageConstants.BOTTOM_BAR_INDEX_HOME:
        /* setup Home */
        break;
      case PageConstants.BOTTOM_BAR_INDEX_SEARCH:
        /* setup Search Page */
        break;

      case PageConstants.BOTTOM_BAR_INDEX_LOGIN:
        /* setup Search LoginPage */
        break;
      default:
    }

    _previousIndex.value = currentIndex;
    _currentIndex.value = index;
  }
}
