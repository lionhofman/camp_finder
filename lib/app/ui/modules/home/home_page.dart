import 'package:camp_finder/app/ui/global_widgets/app_bar_header.dart';
import 'package:camp_finder/app/ui/global_widgets/drawer/custom_drawer.dart';
import 'package:camp_finder/app/ui/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  final pageController = PageController();
  HomePage({Key? key}) : super(key: key);

  Widget _buildHome() {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarHeader(),
        drawer: CustomDrawer(
          pageController: pageController,
        ),
        body: const Center(
          child: Text('My Page!'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildHome(),
        Container(
          color: Colors.red,
        ),
      ],
    );
  }
}
