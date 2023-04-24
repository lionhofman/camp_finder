import 'package:camp_finder/app/core/img_cache/img_cache_custom.dart';
import 'package:camp_finder/app/ui/modules/home/model/model_services.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class NearbyServicesWidget extends StatelessWidget {
  const NearbyServicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
      itemCount: getNearByServiceList().length,
      itemBuilder: (BuildContext context, int index) {
        ModelServices data = getNearByServiceList()[index];

        return Container(
          width: context.width() * 0.62,
          margin: EdgeInsets.all(8),
          decoration: boxDecorationRoundedWithShadow(8,
              backgroundColor: context.cardColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonCacheImageWidget(data.img.validate(), 120,
                      width: context.width(), fit: BoxFit.cover)
                  .center()
                  .cornerRadiusWithClipRRectOnly(topLeft: 8, topRight: 8),
              8.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(data.title.validate(), style: primaryTextStyle())
                          .expand(),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellowAccent),
                          Text(data.rating.validate(),
                              style: secondaryTextStyle()),
                        ],
                      )
                    ],
                  ),
                ],
              ).paddingOnly(left: 8, right: 8),
              4.height,
              Text(data.location.validate(), style: secondaryTextStyle())
                  .paddingOnly(left: 8, right: 8),
              8.height,
            ],
          ),
        ).onTap(() {
          // LSServiceDetailScreen().launch(context);
        });
      },
    );
  }
}
