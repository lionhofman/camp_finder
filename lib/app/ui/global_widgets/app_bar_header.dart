// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:camp_finder/app/ui/modules/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:camp_finder/app/core/constants/colors.dart';
import 'package:camp_finder/app/ui/modules/auth/store/auth_store.dart';

class AppBarHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool? innerBoxIsScrolled;
  final String? localization;
  final AuthStore authStore;
  const AppBarHeader({
    Key? key,
    this.innerBoxIsScrolled,
    this.localization,
    required this.authStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 180,
      forceElevated: innerBoxIsScrolled ?? false,
      pinned: true,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      backgroundColor: appColorPrimary,
      toolbarHeight: 70,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() {
            return Text(
              authStore.isLoggedIn.value
                  ? 'Olá, ${authStore.firstName}'
                  : 'Olá, seja bem vindo !',
              style: boldTextStyle(color: white, size: 18),
            );
          }).paddingOnly(
            left: 16,
            right: 16,
          ),
          IconButton(
              onPressed: () {
                // LSNotificationScreen().launch(context);
              },
              icon: const Icon(Icons.favorite, color: white))
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: const Icon(Icons.location_on,
                                color: white, size: 22)
                            .paddingRight(4),
                      ),
                      TextSpan(
                          text: localization ?? "",
                          style: primaryTextStyle(color: white)),
                    ],
                  ),
                ),
                // RichText(
                //   text: TextSpan(
                //     children: [
                //       WidgetSpan(
                //         child: Icon(Icons.airplanemode_on_outlined,
                //                 color: white, size: 16)
                //             .paddingRight(4),
                //       ),
                //       TextSpan(
                //           text: 'Change',
                //           style: primaryTextStyle(color: white)),
                //     ],
                //   ),
                // ),
              ],
            ).paddingOnly(left: 16, bottom: 4),
            const Expanded(child: SearchPage()),
          ],
        ).paddingTop(70),
      ),
    );
  }

  static AppBar simpleHeader({required String title}) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Get.back(),
      ),
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
