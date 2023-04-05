import 'package:camp_finder/app/core/fonts/fonts.dart';
import 'package:camp_finder/app/ui/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppBarHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  const AppBarHeader({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      toolbarHeight: kToolbarHeight,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          showDescription("App Camping"),
        ],
      ),
      centerTitle: true,
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.person_3_outlined),
              onPressed: () {
                /** TODO go to Login Page */
              },
            ),
          ],
        )
      ],
    );
  }

  static Widget loginIcon() {
    return const Icon(
      Icons.login,
    );
  }

  static Widget showDescription(String? title) {
    return Text(
      title ?? '',
      style: const TextStyle(
          color: Colors.white,
          fontWeight: Fonts.OPEN_SANS_REGULAR_WEIGHT,
          fontFamily: Fonts.OPEN_SANS_FONT_FAMILY,
          fontSize: 14),
    );
  }

  Widget searchBar() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.SEARCH_PAGE);
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                const SizedBox(width: 8),
                const Text(
                  "Busque no Camp Finder",
                  style: TextStyle(
                      color: Color(0xFFB6B6B6),
                      fontWeight: Fonts.OPEN_SANS_REGULAR_WEIGHT,
                      fontFamily: Fonts.OPEN_SANS_FONT_FAMILY,
                      fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget showLogoSVG() {
    return SvgPicture.asset(
      'assets/svg/camp_finder.svg',
      //color: Color(0xFF1EC45C),
      width: Get.width * 0.20,
    );
  }

  static Widget showLogoPNG() {
    return Container(
      width: 70,
      height: 65,
      child: Card(
          elevation: 0,
          child: ClipRRect(
            child: Image.asset('assets/png/camp_finder.png', fit: BoxFit.fill),
          )),
    );
  }
}
