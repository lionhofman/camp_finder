import 'package:camp_finder/app/ui/global_widgets/app_bar_header.dart';
import 'package:camp_finder/app/ui/modules/favorite/controller/favorite_offline_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteOfflinePage extends GetView<FavoriteOfflineController> {
  const FavoriteOfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
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
                        localization: controller.userLocation,
                        authStore: controller.authStore,
                        useSliverAppBar: true,
                      ))
                ];
              },
              body: Container()),
        ),
      ),
    );
  }
}
