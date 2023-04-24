import 'package:camp_finder/app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class AppBarHeader extends StatelessWidget {
  final bool innerBoxIsScrolled;
  const AppBarHeader({Key? key, required this.innerBoxIsScrolled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 230,
      floating: true,
      forceElevated: innerBoxIsScrolled,
      pinned: true,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      backgroundColor: appColorPrimary,
      actionsIconTheme: IconThemeData(opacity: 0.0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Hello, Jhon', style: boldTextStyle(color: white, size: 20))
              .paddingOnly(left: 16, right: 16, bottom: 8),
          IconButton(
              onPressed: () {
                // LSNotificationScreen().launch(context);
              },
              icon: Icon(Icons.notifications, color: white))
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Your Location',
                    style: primaryTextStyle(color: white, size: 12))
                .paddingOnly(left: 16, right: 16, top: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.location_on, color: white, size: 16)
                            .paddingRight(4),
                      ),
                      TextSpan(
                          text: 'San Francisco',
                          style: primaryTextStyle(color: white)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.airplanemode_on_outlined,
                                color: white, size: 16)
                            .paddingRight(4),
                      ),
                      TextSpan(
                          text: 'Change',
                          style: primaryTextStyle(color: white)),
                    ],
                  ),
                ),
              ],
            ).paddingAll(16),
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: context.scaffoldBackgroundColor),
              child: AppTextField(
                textFieldType: TextFieldType.NAME,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  fillColor: white,
                  hintText: 'Search Laundry shop by name...',
                  border: InputBorder.none,
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
}
