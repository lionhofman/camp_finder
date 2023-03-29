import 'package:camp_finder/app/ui/global_widgets/bottom_navigation/controllers/root_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends GetView<RootController> {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Card(
        elevation: 8.0,
        margin: EdgeInsets.zero,
        child: SafeArea(
          bottom: true,
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 50,
            ),
            height: kBottomNavigationBarHeight,
            child: Wrap(children: [
              BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                currentIndex: controller.currentIndex,
                onTap: controller.changePage,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search_outlined),
                    activeIcon: Icon(Icons.search),
                    label: "Search",
                  ),
                ],
              ),
            ]),
          ),
        )));
  }
}
