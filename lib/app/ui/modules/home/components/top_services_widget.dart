import 'package:camp_finder/app/core/img_cache/img_cache_custom.dart';
import 'package:camp_finder/app/ui/modules/home/model/model_services.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class TopServicesWidget extends StatelessWidget {
  const TopServicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
      itemCount: getTopServiceList().length,
      itemBuilder: (BuildContext context, int index) {
        ModelServices data = getTopServiceList()[index];

        return Column(
          children: [
            Container(
              height: 80,
              width: 80,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(8),
              decoration: boxDecorationRoundedWithShadow(40,
                  backgroundColor: context.cardColor),
              child: commonCacheImageWidget(data.img.validate(), 50,
                  width: 50, fit: BoxFit.cover),
            ),
            8.height,
            Text(data.title.validate(), style: primaryTextStyle()),
          ],
        ).onTap(() {
          // ServiceDetail().launch(context);
        });
      },
    );
  }
}
