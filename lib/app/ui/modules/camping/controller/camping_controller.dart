// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math' as Math;
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:camp_finder/app/domain/entities/camping.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:camp_finder/app/domain/usecases/campings/get_all_campings_use_case.dart';
import 'package:camp_finder/app/ui/modules/camping/camping_details.dart';
import 'package:camp_finder/app/ui/modules/geolocalization/controller/geolocalization_controller.dart';

class CampingController extends GetxController {
  GetAllCampingsUseCase getAllCampingsUseCase;

  List<Camping?> _listCamps = <Camping>[].obs;

  List<Camping?> get listCamps => _listCamps;
  final latitude = 0.0.obs;
  final longitude = 0.0.obs;
  final raio = 0.0.obs;
  RxString _userLocalization = "".obs;

  String get userLocation => _userLocalization.value;

  StreamSubscription<Position>? positionStream;
  final LatLng _position = const LatLng(-26.877199, -49.099221);
  GoogleMapController? _mapsController;
  CampingController(
    this.getAllCampingsUseCase,
  );
  final markers = Set<Marker>();

  static CampingController get to => Get.find<CampingController>();
  get mapsController => _mapsController;
  get position => _position;
  String get distancia => raio.value < 1
      ? '${(raio.value * 1000).toStringAsFixed(0)} m'
      : '${(raio.value).toStringAsFixed(1)} km';

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  // filtrarCampings() {
  //   final geo = GeoFlutterFire();
  //   final db = DB.get();

  //   GeoFirePoint center = geo.point(
  //     latitude: latitude.value,
  //     longitude: longitude.value,
  //   );

  //   Query<Map<String, dynamic>> ref = db.collection(DB.DB_CAMP_NAME);

  //   String field = 'position';

  //   Stream<List<DocumentSnapshot>> stream = geo
  //       .collection(collectionRef: ref)
  //       .within(center: center, radius: raio.value, field: field);

  //   stream.listen((List<DocumentSnapshot<Object?>> campings) {
  //     markers.clear();
  //     campings.forEach((camping) {
  //       Camping? newCamping = camping.data();
  //       addMarker(newCamping);
  //     });
  //     double zoomLevel = _calcularZoom();
  //     _mapsController!.animateCamera(CameraUpdate.zoomTo(zoomLevel));
  //     update();
  //     Get.back();
  //   });
  // }

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    //DB.setupDemoData();
    getPosicao();
    loadCampings();

    // var style = await rootBundle.loadString('assets/map/dark.json');
    // _mapsController!.setMapStyle(style);
  }

  Future<void> getAllCamps() async {
    Either<Exception, List<Camping?>> camps =
        await getAllCampingsUseCase.call();

    camps.fold((l) {
      print("Failure in the query to home showCase");
    }, (data) {
      _listCamps.clear();
      _listCamps = data.obs;
      _listCamps.forEach((camping) => addMarker(camping));
    });
  }

  loadCampings() async {
    //FirebaseFirestore db = DB.get();
    //final campings = await db.collection(DB.DB_CAMP_NAME).get();
    getAllCamps();
  }

  addMarker(Camping? camping) async {
    GeoPoint point = camping!.position['geopoint'];
    final Uint8List icon =
        await getBytesFromAsset('assets/png/icon_map_location.png', 110);
    markers.add(
      Marker(
        markerId: MarkerId(camping.title),
        position: LatLng(point.latitude, point.longitude),
        infoWindow: InfoWindow(title: camping.nameCamping),
        icon: BitmapDescriptor.fromBytes(icon),
        onTap: () => showDetails(camping),
      ),
    );
    update();
  }

  showDetails(camping) {
    Get.bottomSheet(
      CampingDetails(
        camping: camping,
      ),
      barrierColor: Colors.transparent,
    );
  }

  watchPosicao() async {
    positionStream = Geolocator.getPositionStream().listen((Position position) {
      latitude.value = position.latitude;
      longitude.value = position.longitude;
    });
  }

  @override
  void onClose() {
    positionStream!.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    asyncInit();
  }

  Future<void> asyncInit() async {
    _userLocalization.value =
        await GeolocalizationController.getCurrentLocation();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;
    bool ativado = await Geolocator.isLocationServiceEnabled();

    if (!ativado) {
      return Future.error('Por favor, habilite a localização no smartphone.');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();

      if (permissao == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização.');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Autorize o acesso à localização nas configurações.');
    }

    return await Geolocator.getCurrentPosition();
  }

  getPosicao() async {
    try {
      final posicao = await _posicaoAtual();
      latitude.value = posicao.latitude;
      longitude.value = posicao.longitude;

      _mapsController!.animateCamera(
          CameraUpdate.newLatLng(LatLng(latitude.value, longitude.value)));
    } catch (e) {
      Get.snackbar(
        'Erro',
        e.toString(),
        backgroundColor: Colors.grey[900],
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  double _calcularZoom() {
    double distanceInMeters = raio.value * 100;
    double zoomLevel = 11 - (log(distanceInMeters / 1000) / log(2));
    double maxZoomLevel = 19;
    return zoomLevel > maxZoomLevel ? maxZoomLevel : zoomLevel;
  }
}
