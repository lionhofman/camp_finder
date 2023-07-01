import 'package:camp_finder/app/ui/global_widgets/app_bar_header.dart';
import 'package:camp_finder/app/ui/modules/showcases/highlights/showcase_highlights_widget.dart';
import 'package:camp_finder/app/ui/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/top_services_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                // Implementar a lógica de atualização de conteúdo aqui
              },
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    Obx(() => AppBarHeader(
                          innerBoxIsScrolled: innerBoxIsScrolled,
                          localization: controller.userLocation,
                          authStore: controller.authStore,
                        ))
                  ];
                },
                body: CustomScrollView(
                  slivers: <Widget>[
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Dicas',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(child: const TopServicesWidget()),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Em destaque',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            TextButton(
                              onPressed: () {
                                // LSNearByScreen().launch(context);
                              },
                              child: Text('View All',
                                  style: TextStyle(color: Colors.blue)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(child: ShowcaseHighlightsWidget()),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Campings imperdíveis',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            TextButton(
                              onPressed: () {
                                // LSOfferAllScreen().launch(context);
                              },
                              child: Text('View All',
                                  style: TextStyle(color: Colors.blue)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(child: const ShowcaseHighlightsWidget()),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
