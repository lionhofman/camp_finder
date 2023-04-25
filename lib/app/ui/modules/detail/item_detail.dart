import 'package:camp_finder/app/core/constants/colors.dart';
import 'package:camp_finder/app/core/img_cache/img_cache_custom.dart';
import 'package:camp_finder/app/domain/entities/camping.dart';
import 'package:camp_finder/app/ui/modules/detail/tabs/about_us.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ItemDetail extends StatelessWidget {
  final Camping campDetails;
  const ItemDetail({Key? key, required this.campDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: innerBoxIsScrolled ? black : white),
                  onPressed: () {
                    finish(context);
                  },
                ),
                pinned: true,
                elevation: 0.5,
                expandedHeight: 370,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding:
                      const EdgeInsets.only(bottom: 85, left: 45, right: 50),
                  collapseMode: CollapseMode.parallax,
                  title: Text(
                    campDetails.title,
                    style: boldTextStyle(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ).visible(innerBoxIsScrolled),
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          commonCacheImageWidget(campDetails.image, 300,
                              width: context.width(), fit: BoxFit.cover),
                          Container(
                            height: 300,
                            width: context.width(),
                            color: black.withOpacity(0.4),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 16,
                            right: 16,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(campDetails.title,
                                        style: boldTextStyle(
                                            size: 20, color: white)),
                                    4.height,
                                    Text(campDetails.nameCamping,
                                        style:
                                            secondaryTextStyle(color: white)),
                                    4.height,
                                    Text(campDetails.address,
                                        style:
                                            secondaryTextStyle(color: white)),
                                    4.height,
                                    Row(
                                      children: [
                                        RatingBarWidget(
                                          rating: 2.5,
                                          size: 20,
                                          disable: true,
                                          onRatingChanged: (aRating) {
                                            // rating = aRating;
                                          },
                                        ),
                                        4.width,
                                        Text('(90 Reviews)',
                                            style: secondaryTextStyle(
                                                color: white)),
                                      ],
                                    )
                                  ],
                                ).expand(),
                                Column(
                                  children: [
                                    Text('0.2 Km Away',
                                        style: secondaryTextStyle(
                                            color: appColorPrimary)),
                                    8.height,
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 8, right: 8, top: 6, bottom: 6),
                                      decoration:
                                          boxDecorationWithRoundedCorners(
                                              backgroundColor: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                      child: Text('Open'.toUpperCase(),
                                          style:
                                              primaryTextStyle(color: white)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      16.height,
                    ],
                  ),
                ),
                bottom: TabBar(
                  labelStyle: boldTextStyle(color: black),
                  labelColor: appColorPrimary,
                  isScrollable: false,
                  tabs: [
                    Tab(
                      height: 65,
                      child: Column(
                        children: [
                          const Icon(Icons.my_location,
                              size: 30, color: appColorPrimary),
                          10.height,
                          Text('Sobre'.toUpperCase(),
                              style: primaryTextStyle(size: 13)),
                        ],
                      ),
                    ),
                    Tab(
                      height: 65,
                      child: Column(
                        children: [
                          const Icon(Icons.room_service,
                              size: 30, color: appColorPrimary),
                          10.height,
                          Text('Serviços'.toUpperCase(),
                              style: primaryTextStyle(size: 13)),
                        ],
                      ),
                    ),
                    Tab(
                      height: 65,
                      child: Column(
                        children: [
                          const Icon(Icons.monetization_on,
                              size: 30, color: appColorPrimary),
                          10.height,
                          Text('taxas'.toUpperCase(),
                              style: primaryTextStyle(size: 13)),
                        ],
                      ),
                    ),
                    Tab(
                      height: 65,
                      child: Column(
                        children: [
                          const Icon(Icons.info,
                              size: 30, color: appColorPrimary),
                          10.height,
                          Text('Mais info'.toUpperCase(),
                              style: primaryTextStyle(size: 13)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              AboutUs(campDetails: campDetails),
              AboutUs(campDetails: campDetails),
              AboutUs(campDetails: campDetails),
              AboutUs(campDetails: campDetails),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: boxDecorationWithShadow(backgroundColor: context.cardColor),
        padding: const EdgeInsets.all(8),
        child: AppButton(
          text: 'Schedule a pickup'.toUpperCase(),
          textColor: white,
          color: appColorPrimary,
          onTap: () {
            // LSScheduleScreen().launch(context);
          },
        ),
      ),
    );
  }
}
