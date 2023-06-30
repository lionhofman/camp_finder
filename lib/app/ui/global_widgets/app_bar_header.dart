// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:camp_finder/app/core/constants/colors.dart';

class AppBarHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool? innerBoxIsScrolled;
  final String? localization;
  const AppBarHeader({
    Key? key,
    this.innerBoxIsScrolled,
    this.localization,
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
          Text('Olá, Jhon', style: boldTextStyle(color: white, size: 18))
              .paddingOnly(
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
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: context.scaffoldBackgroundColor),
              child: AppTextField(
                textFieldType: TextFieldType.NAME,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  fillColor: white,
                  hintText: 'Search Laundry shop by name...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search, color: grey),
                  contentPadding: EdgeInsets.only(
                      left: 24.0, bottom: 8.0, top: 8.0, right: 24.0),
                ),
              ),
              alignment: Alignment.center,
            ),
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
