import 'package:camp_finder/app/core/constants/colors.dart';
import 'package:camp_finder/app/core/constants/page_constants.dart';
import 'package:camp_finder/app/ui/global_widgets/bottom_navigation/components/bottom_bar.dart';
import 'package:camp_finder/app/ui/global_widgets/bottom_navigation/controllers/root_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPage extends GetView<RootController> {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              color: appColorSecondary.withOpacity(0.55),
              child: IndexedStack(
                index: controller.currentIndex,
                children: controller.pages,
              ),
            ),
          ),
          extendBody: true,
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     controller.changePage(PageConstants.BOTTOM_BAR_INDEX_FINDER);
          //   },
          //   child: const Icon(Icons.location_on_outlined),
          // ),
          bottomNavigationBar: const BottomBar(),
        ));
  }
}
