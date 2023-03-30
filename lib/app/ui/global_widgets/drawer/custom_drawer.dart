import 'package:camp_finder/app/core/constants/page_constants.dart';
import 'package:camp_finder/app/ui/global_widgets/drawer/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  const CustomDrawer({Key? key, required this.pageController})
      : super(key: key);
  Widget _buildDrawerBack() => Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 203, 236, 241),
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
      );
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          _buildDrawerBack(),
          ListView(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                padding: const EdgeInsets.fromLTRB(0, 16, 16, 8),
                height: 170,
                child: Stack(
                  children: [
                    const Positioned(
                        top: 8,
                        left: 0,
                        child: Text(
                          "Camp Finder",
                          style: TextStyle(
                              fontSize: 34, fontWeight: FontWeight.bold),
                        )),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Olá,",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            child: Text(
                              "Entre ou cadastre-se >,",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              print("Clicou");
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              DrawerTile(
                icon: Icons.location_on,
                text: "Finder",
                controller: pageController,
                page: PageConstants.MENU_INDEX_FINDER,
              ),
              DrawerTile(
                icon: Icons.search,
                text: "Busca",
                controller: pageController,
                page: PageConstants.MENU_INDEX_SEARCH,
              ),
              DrawerTile(
                icon: Icons.playlist_add_check,
                text: "Itens Básicos",
                controller: pageController,
                page: PageConstants.MENU_INDEX_BASIC_ITEMS,
              ),
              DrawerTile(
                icon: MdiIcons.tent,
                text: "Campings",
                controller: pageController,
                page: PageConstants.MENU_INDEX_CAMPING,
              ),
              DrawerTile(
                icon: MdiIcons.hiking,
                text: "Trekking",
                controller: pageController,
                page: PageConstants.MENU_INDEX_TREKKING,
              ),
              DrawerTile(
                icon: MdiIcons.busDoubleDecker,
                text: "Motorhome",
                controller: pageController,
                page: PageConstants.MENU_INDEX_MOTORHOME,
              ),
              DrawerTile(
                icon: MdiIcons.carLiftedPickup,
                text: "4x4",
                controller: pageController,
                page: PageConstants.MENU_INDEX_4X4,
              ),
            ],
          )
        ],
      ),
    );
  }
}
