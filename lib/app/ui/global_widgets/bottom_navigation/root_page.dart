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
          body: Container(
            color: Colors.green,
            child: SafeArea(
              child: IndexedStack(
                index: controller.currentIndex,
                children: controller.pages,
              ),
            ),
          ),
          bottomNavigationBar: const BottomBar(),
        ));
  }
}
