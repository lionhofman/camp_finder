import 'package:camp_finder/app/core/constants/colors.dart';
import 'package:camp_finder/app/core/constants/images.dart';
import 'package:camp_finder/app/core/img_cache/img_cache_custom.dart';
import 'package:camp_finder/app/domain/entities/camping.dart';
import 'package:flutter/material.dart';

import 'package:nb_utils/nb_utils.dart';

class AboutUs extends StatefulWidget {
  final Camping campDetails;
  const AboutUs({Key? key, required this.campDetails}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(thickness: 3, color: lightGrey.withOpacity(0.4)),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About Us', style: boldTextStyle()),
                  8.height,
                  Text(widget.campDetails.about,
                      style: secondaryTextStyle(), textAlign: TextAlign.start),
                  16.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Addresses', style: boldTextStyle()),
                          8.height,
                          Text(widget.campDetails.address,
                              style: secondaryTextStyle()),
                          8.height,
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.directions,
                                          color: appColorPrimary, size: 16)
                                      .paddingRight(4),
                                ),
                                TextSpan(
                                    text: 'Get Directions - 0.2 KM',
                                    style: primaryTextStyle(
                                        color: appColorPrimary)),
                              ],
                            ),
                          ),
                        ],
                      ).expand(),
                      16.width,
                      Stack(
                        children: [
                          commonCacheImageWidget(LSMap, 100,
                              width: 150, fit: BoxFit.cover),
                          Container(
                            height: 100,
                            width: 150,
                            color: black.withOpacity(0.5),
                          ),
                          Container(
                            height: 100,
                            width: 150,
                            decoration: boxDecorationWithShadow(),
                            child: Text('Show Map', style: boldTextStyle())
                                .center(),
                          ),
                        ],
                      )
                    ],
                  ),
                  12.height,
                  Text('Opening Hours', style: boldTextStyle()),
                  16.height,
                  UL(
                    symbolType: SymbolType.Bullet,
                    children: [
                      Text('Monday : 08:00 AM - 08:00 PM',
                          style: primaryTextStyle()),
                      Text('Tuesday : 08:00 AM - 08:00 PM',
                          style: primaryTextStyle()),
                      Text('Friday : 08:00 AM - 08:00 PM',
                          style: primaryTextStyle()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
