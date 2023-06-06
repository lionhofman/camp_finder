import 'package:camp_finder/app/core/constants/colors.dart';
import 'package:camp_finder/app/domain/entities/camping.dart';
import 'package:camp_finder/app/ui/modules/detail/tabs/about_us.dart';
import 'package:camp_finder/app/ui/modules/detail/tabs/gallery.dart';
import 'package:camp_finder/app/ui/modules/detail/tabs/info_page.dart';
import 'package:camp_finder/app/ui/modules/detail/tabs/reviews_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

class ItemDetail extends StatelessWidget {
  final Camping campDetails;
  const ItemDetail({Key? key, required this.campDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Builder(
          builder: (BuildContext context) {
            final TabController tabController =
                DefaultTabController.of(context);
            final ScrollController scrollController =
                PrimaryScrollController.of(context);
            return NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: innerBoxIsScrolled ? black : white, size: 30),
                      onPressed: () {
                        finish(context);
                      },
                    ),
                    automaticallyImplyLeading: false,
                    backgroundColor: appColorPrimary,
                    expandedHeight: 370,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: const EdgeInsets.only(
                          bottom: 85, left: 45, right: 50),
                      collapseMode: CollapseMode.pin,
                      background: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.network(campDetails.image, fit: BoxFit.cover),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0x60000000), Color(0x00000000)],
                                stops: [0.0, 0.75],
                                begin: Alignment(0.0, 1.0),
                                end: Alignment(0.0, 0.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 200,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(campDetails.title,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                          Text(campDetails.address,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18)),
                                          Row(
                                            children: [
                                              RatingBarWidget(
                                                rating: 2.5,
                                                size: 20,
                                                disable: true,
                                                onRatingChanged: (aRating) {},
                                              ),
                                              SizedBox(width: 4),
                                              Text('(90 Reviews)',
                                                  style: secondaryTextStyle(
                                                      color: white)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text('0.2 Km Away',
                                              style: secondaryTextStyle(
                                                  color: white)),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 6),
                                            decoration:
                                                boxDecorationWithRoundedCorners(
                                                    backgroundColor:
                                                        Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                            child: Text('Open'.toUpperCase(),
                                                style: primaryTextStyle(
                                                    color: white)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    floating: true,
                    pinned: true,
                    snap: true,
                    bottom: TabBar(
                      unselectedLabelColor: Colors.grey,
                      indicatorWeight: 5,
                      labelStyle: boldTextStyle(color: black),
                      tabs: [
                        Tab(text: "Sobre", icon: Icon(Icons.my_location)),
                        Tab(text: "Galeria", icon: Icon(Icons.photo_library)),
                        Tab(
                            text: "Reviews",
                            icon: FaIcon(FontAwesomeIcons.commentDots)),
                        Tab(text: "Mais info", icon: Icon(Icons.info)),
                      ],
                    ),
                  ),
                ];
              },
              body: TabBarView(
                controller: tabController,
                // physics: scrollController.hasClients &&
                //         scrollController.offset > (370 - kToolbarHeight)
                //     ? AlwaysScrollableScrollPhysics()
                //     : NeverScrollableScrollPhysics(),
                children: [
                  AboutUs(campDetails: campDetails),
                  Gallery(imgUrl: campDetails.image),
                  ReviewPage(),
                  InfoPage(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
