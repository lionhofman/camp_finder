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
      color: Theme.of(context).colorScheme.primary,
      child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.home,
                  ),
                  onPressed: () {
                    controller.changePage(PageConstants.BOTTOM_BAR_INDEX_HOME);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.list),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 60,
                ),
                IconButton(
                  icon: const Icon(Icons.search_outlined),
                  onPressed: () {},
                ),
                ValueListenableBuilder(
                  valueListenable: controller.isLoadingLogout,
                  builder: (BuildContext context, bool isLoading, _) {
                    return isLoading
                        ? const CircularProgressIndicator(
                            color: Colors
                                .white, // Define a cor do CircularProgressIndicator para branco.
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
              ],
            ),
          )),
    );
  }
}
