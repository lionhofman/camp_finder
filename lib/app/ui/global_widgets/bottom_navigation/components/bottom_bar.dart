import 'package:camp_finder/app/core/constants/page_constants.dart';
import 'package:camp_finder/app/ui/global_widgets/bottom_navigation/controllers/root_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends GetView<RootController> {
  const BottomBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _buildBottom(context);
  }

  Widget _buildBottom(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.blue,
      child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Obx(
                () {
                  List<Widget> buttons = [
                    IconButton(
                      icon: const Icon(
                        Icons.home,
                      ),
                      onPressed: () {
                        controller
                            .changePage(PageConstants.BOTTOM_BAR_INDEX_HOME);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.location_on_outlined),
                      onPressed: () {
                        controller
                            .changePage(PageConstants.BOTTOM_BAR_INDEX_FINDER);
                      },
                    ),
                    ValueListenableBuilder(
                      valueListenable: controller.isLoadingLogout,
                      builder: (BuildContext context, bool isLoading, _) {
                        return isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Obx(() => IconButton(
                                  icon: Icon(controller.isLoggedIn.value
                                      ? Icons.logout
                                      : Icons.person),
                                  onPressed: () {
                                    if (controller.isLoggedIn.value) {
                                      controller.logout();
                                    } else {
                                      controller.changePage(
                                          PageConstants.BOTTOM_BAR_INDEX_LOGIN);
                                    }
                                  },
                                ));
                      },
                    ),
                  ];
                  //Essas condições foram feitas para aparecer o botão de cadastro
                  if (controller.authStore.isLoggedIn.value &&
                      controller.authStore.firstName ==
                          RootController.LION_NAME) {
                    buttons.insert(
                        1,
                        IconButton(
                          icon: const Icon(Icons.list),
                          onPressed: () {
                            controller.changePage(PageConstants
                                .BOTTOM_BAR_INDEX_REGISTER_CAMPING);
                          },
                        ));
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: buttons,
                  );
                },
              ))),
    );
  }
}
