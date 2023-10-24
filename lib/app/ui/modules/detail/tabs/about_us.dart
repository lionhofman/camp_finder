import 'dart:async';

import 'package:camp_finder/app/core/constants/colors.dart';

import 'package:camp_finder/app/domain/entities/camping.dart';
import 'package:camp_finder/app/ui/modules/detail/controller/item_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:nb_utils/nb_utils.dart';

class AboutUs extends GetView<ItemDetailController> {
  final Camping? campDetails;
  final Completer<GoogleMapController> googleMapsController =
      Completer<GoogleMapController>();
  AboutUs({Key? key, this.campDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(thickness: 1, color: Colors.grey),
              const Text('Detalhes do local',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(
                campDetails != null ? campDetails!.about : "",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 20),
              const Text('Endereço',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  controller.validateLaunchURL(campDetails!.address);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.home, color: appColorPrimary),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            campDetails!.address,
                            style: const TextStyle(
                                color: appColorPrimary,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => Row(
                        children: [
                          const Icon(Icons.location_on, color: appColorPrimary),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              controller.distanceBetween != null
                                  ? "Está à aproximadamente ${controller.distanceBetween}"
                                  : "",
                              style: const TextStyle(color: appColorPrimary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text('Veja no mapa',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              SizedBox(
                height: 120.0,
                child: GoogleMap(
                  onTap: (argument) {
                    controller.validateLaunchURL(campDetails!.address);
                  },
                  mapType: MapType.hybrid,
                  initialCameraPosition: controller.kGooglePlex.value!,
                  onMapCreated: (GoogleMapController controller) {
                    googleMapsController.complete(controller);
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text('Horário de funcionamento',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ListView.builder(
                itemCount: campDetails!.openHours != null
                    ? campDetails!.openHours!.length
                    : 0,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("${campDetails!.openHours![index].day}:",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(campDetails!.openHours![index].hours,
                            style:
                                const TextStyle(fontWeight: FontWeight.w100)),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: appColorPrimary,
        child: const Icon(Icons.favorite_border),
      ),
    );
  }
}
