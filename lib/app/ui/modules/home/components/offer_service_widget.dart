import 'package:camp_finder/app/core/constants/colors.dart';
import 'package:camp_finder/app/core/img_cache/img_cache_custom.dart';
import 'package:camp_finder/app/ui/modules/home/model/model_services.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class OfferServiceWidget extends StatelessWidget {
  const OfferServiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: getOfferList().take(4).length,
          itemBuilder: (BuildContext context, int index) {
            ModelServices data = getOfferList()[index];

            return InkWell(
              onTap: () {
                // LSServiceDetailScreen().launch(context);
              },
              child: Container(
                width: 280,
                margin: EdgeInsets.all(8),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        child: commonCacheImageWidget(data.img.validate(), 80,
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(data.title.validate(),
                              style: primaryTextStyle()),
                          Text(data.subTitle.validate(),
                              style: primaryTextStyle(
                                  color: appColorPrimary, size: 18)),
                          SizedBox(height: 8),
                          AppButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            onTap: () {},
                            text: 'View Offer',
                            textColor: white,
                            color: appColorPrimary,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
