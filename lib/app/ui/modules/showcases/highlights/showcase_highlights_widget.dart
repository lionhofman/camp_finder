import 'package:camp_finder/app/core/img_cache/img_cache_custom.dart';
import 'package:camp_finder/app/ui/modules/detail/item_detail.dart';
import 'package:camp_finder/app/ui/modules/showcases/highlights/controller/showcase_highlights_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class ShowcaseHighlightsWidget extends GetView<ShowcaseHighlightsController> {
  const ShowcaseHighlightsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
        height: 220,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: controller.listCamps.length,
          itemBuilder: (context, index) {
            return Container(
              width: Get.width * 0.62,
              margin: const EdgeInsets.all(8),
              decoration: boxDecorationRoundedWithShadow(8,
                  backgroundColor: context.cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonCacheImageWidget(
                          controller.listCamps[index]!.image.validate(), 120,
                          width: Get.width, fit: BoxFit.cover)
                      .center()
                      .cornerRadiusWithClipRRectOnly(topLeft: 8, topRight: 8),
                  8.height,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                                  controller.listCamps[index]!.nameCamping
                                      .validate(),
                                  style: primaryTextStyle())
                              .expand(),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellowAccent),
                              Text("rating".validate(),
                                  style: secondaryTextStyle()),
                            ],
                          )
                        ],
                      ),
                    ],
                  ).paddingOnly(left: 8, right: 8),
                  4.height,
                  Text(controller.listCamps[index]!.address.validate(),
                          style: secondaryTextStyle())
                      .paddingOnly(left: 8, right: 8),
                  8.height,
                ],
              ),
            ).onTap(() {
              ItemDetail(
                campDetails: controller.listCamps[index]!,
              ).launch(context);
              // LSServiceDetailScreen().launch(context);
            });
          },
        )));
  }
}
