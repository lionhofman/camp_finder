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
              return InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  ItemDetail(
                    campDetails: controller.listCamps[index]!,
                  ).launch(context);
                },
                child: Container(
                  width: Get.width * 0.62,
                  decoration: BoxDecoration(
                    color: context.cardColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        commonCacheImageWidget(
                          controller.listCamps[index]!.image.validate(),
                          120,
                          width: Get.width,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: Get.width * 0.62,
                            padding: EdgeInsets.all(8),
                            color: Colors.white70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        controller.listCamps[index]!.nameCamping
                                            .validate(),
                                        style: primaryTextStyle(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: Colors.yellowAccent),
                                        Text(
                                          "rating".validate(),
                                          style: secondaryTextStyle(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  controller.listCamps[index]!.address
                                      .validate(),
                                  style: secondaryTextStyle(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
