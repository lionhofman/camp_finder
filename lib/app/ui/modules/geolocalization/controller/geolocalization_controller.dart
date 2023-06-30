import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GeolocalizationController extends GetxController {
  static Future<String> getCurrentLocation() async {
    String localization = "";
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark placemark = placemarks[0];
      localization =
          "${placemark.subAdministrativeArea},  ${placemark.administrativeArea}";
    } catch (e) {
      print("Erro na busca pela geolocalização do usuário: $e");
      rethrow;
    }
    return localization;
  }
}
