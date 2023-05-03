import 'package:camp_finder/app/ui/modules/camping/controller/camping_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

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
      appBar: AppBar(
        toolbarHeight: 110,
        automaticallyImplyLeading: false,
        title: Container(
          decoration: BoxDecoration(color: Colors.blue),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hello, Jhon',
                          style: boldTextStyle(color: white, size: 20))
                      .paddingOnly(
                    right: 16,
                  ),
                  // IconButton(
                  //     onPressed: () {
                  //       // LSNotificationScreen().launch(context);
                  //     },
                  //     icon: Icon(Icons.notifications, color: white))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text('Sua localização',
                        style: primaryTextStyle(color: white, size: 12)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.location_on,
                                      color: white, size: 16)
                                  .paddingRight(4),
                            ),
                            TextSpan(
                                text: 'San Francisco',
                                style: primaryTextStyle(color: white)),
                          ],
                        ),
                      ),
                      // RichText(
                      //   text: TextSpan(
                      //     children: [
                      //       WidgetSpan(
                      //         child: Icon(Icons.airplanemode_on_outlined,
                      //                 color: white, size: 16)
                      //             .paddingRight(4),
                      //       ),
                      //       TextSpan(
                      //           text: 'Change',
                      //           style: primaryTextStyle(color: white)),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ).paddingTop(16),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: const Text("Filtrar"),
                ),
                IconButton(
                  iconSize: 36,
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    showDialog(
                        context: context, builder: (context) => filtro());
                  },
                ),
              ],
            ),
          ),
        ],
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
