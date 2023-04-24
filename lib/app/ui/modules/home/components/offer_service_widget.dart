import 'package:camp_finder/app/core/constants/colors.dart';
import 'package:camp_finder/app/core/img_cache/img_cache_custom.dart';
import 'package:camp_finder/app/ui/modules/home/model/model_services.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class OfferServiceWidget extends StatelessWidget {
  const OfferServiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
      itemCount: getOfferList().take(4).length,
      itemBuilder: (BuildContext context, int index) {
        ModelServices data = getOfferList()[index];

        return Container(
          width: 280,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.only(top: 24, bottom: 24, left: 8, right: 8),
          decoration: boxDecorationRoundedWithShadow(8,
              backgroundColor: context.cardColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              commonCacheImageWidget(data.img.validate(), 80, fit: BoxFit.cover)
                  .center(),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(data.title.validate(), style: primaryTextStyle()),
                  Text(data.subTitle.validate(),
                      style:
                          primaryTextStyle(color: appColorPrimary, size: 18)),
                  8.height,
                  AppButton(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
                    onTap: () {},
                    text: 'View Offer',
                    textColor: white,
                    color: appColorPrimary,
                  )
                ],
              )
            ],
          ),
        ).onTap(() {
          // LSServiceDetailScreen().launch(context);
        });
      },
    );
  }
}
