import 'package:camp_finder/app/domain/entities/camping.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemDetailController extends GetxController {
  Rxn<Camping> _campingDetail = Rxn<Camping>();
  var _distanceBetween = "".obs;
  Rxn<CameraPosition> _kGooglePlex = Rxn<CameraPosition>();
  String? get distanceBetween => _distanceBetween.value;
  Rxn<Camping> get campingDetail => _campingDetail;
  Rxn<CameraPosition> get kGooglePlex => _kGooglePlex;
  validateLaunchURL(String? address) async {
    if (address != null) {
      String encodedAddress = Uri.encodeComponent(address);
      String url =
          'https://www.google.com/maps/search/?api=1&query=$encodedAddress';

      Uri myUri = Uri.parse(url);
      await launchUrl(
        myUri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    _campingDetail.value = Get.arguments;
    calculateDistance();
    getCameraPosition();
  }

  void getCameraPosition() {
    GeoPoint point = _campingDetail.value!.position['geopoint'];
    _kGooglePlex.value = CameraPosition(
      target: LatLng(point.latitude, point.longitude),
      zoom: 14.0,
    );
  }

  Future<void> calculateDistance() async {
    GeoPoint? point = _campingDetail.value!.position['geopoint'];
    final currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (point != null) {
      final distance = Geolocator.distanceBetween(currentPosition.latitude,
          currentPosition.longitude, point.latitude, point.longitude);
      _distanceBetween.value =
          "${(distance / 1000).toStringAsFixed(2).replaceAll('.', ',')} km";
    }
  }
}
