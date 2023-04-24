import 'package:camp_finder/app/core/constants/colors.dart';
import 'package:camp_finder/app/ui/global_widgets/app_bar_header.dart';
import 'package:camp_finder/app/ui/modules/home/components/nearby_services_widget.dart';
import 'package:camp_finder/app/ui/modules/home/components/offer_service_widget.dart';
import 'package:camp_finder/app/ui/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import 'components/top_services_widget.dart';

class HomePage extends GetView<HomeController> {
  final pageController = PageController();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[AppBarHeader(innerBoxIsScrolled: innerBoxIsScrolled)];
      },
      body: Container(
        color: appColorSecondary.withOpacity(0.55),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.height,
              Text('Top Services', style: boldTextStyle(size: 18))
                  .paddingOnly(left: 16, top: 16, right: 16, bottom: 8),
              const TopServicesWidget(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Popular Laundry Nearby', style: boldTextStyle(size: 18))
                      .expand(),
                  TextButton(
                      onPressed: () {
                        // LSNearByScreen().launch(context);
                      },
                      child: Text('View All', style: secondaryTextStyle()))
                ],
              ).paddingOnly(left: 16, top: 16, right: 16),
              NearbyServicesWidget(),
              Row(
                children: [
                  Text('Special Package & Offers',
                          style: boldTextStyle(size: 18))
                      .expand(),
                  TextButton(
                      onPressed: () {
                        // LSOfferAllScreen().launch(context);
                      },
                      child: Text('View All', style: secondaryTextStyle()))
                ],
              ).paddingOnly(left: 16, right: 16),
              const OfferServiceWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
