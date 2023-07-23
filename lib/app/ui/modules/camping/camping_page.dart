import 'package:camp_finder/app/ui/global_widgets/app_bar_header.dart';
import 'package:camp_finder/app/ui/modules/auth/store/auth_store.dart';
import 'package:camp_finder/app/ui/modules/camping/controller/camping_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CampingPage extends StatelessWidget {
  final pageController = PageController();
  CampingPage({super.key});

  filtro() {
    return SimpleDialog(
      title: const Text('Filtrar por Proximidade'),
      children: [
        Obx(
          () => Slider(
            value: CampingController.to.raio.value,
            min: 0,
            max: 150,
            divisions: 1000,
            label: CampingController.to.distancia,
            onChanged: (value) => CampingController.to.raio.value = value,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, top: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => CampingController.to.filtrarCampings(),
                child: const Text('Filtrar'),
              ),
              TextButton(
                  onPressed: () => Get.back(), child: const Text('Cancelar')),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CampingController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: Obx(() => AppBarHeader(
              localization: controller.userLocation,
              authStore: Get.find<AuthStore>(),
              useSliverAppBar: false,
            )),
      ),
      body: SizedBox(
        child: GetBuilder<CampingController>(
          init: controller,
          builder: (value) => GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: true,
            initialCameraPosition: CameraPosition(
              target: controller.position,
              zoom: 13,
            ),
            onMapCreated: controller.onMapCreated,
            myLocationEnabled: true,
            markers: controller.markers,
          ),
        ),
      ),
    );
  }
}
