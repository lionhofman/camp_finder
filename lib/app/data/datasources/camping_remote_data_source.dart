import 'package:camp_finder/app/data/database/db.dart';
import 'package:camp_finder/app/data/models/additional_info_response.dart';
import 'package:camp_finder/app/data/models/camping_response.dart';
import 'package:camp_finder/app/data/models/gallery_item_response.dart';
import 'package:camp_finder/app/data/models/open_hour_response.dart';
import 'package:camp_finder/app/domain/entities/additional_info.dart';
import 'package:camp_finder/app/domain/entities/camping.dart';
import 'package:camp_finder/app/domain/entities/gallery_item.dart';
import 'package:camp_finder/app/domain/entities/open_hour.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CampingRemoteDataSource {
  Future<List<Camping?>> getCampings();
  Future<List<Camping?>> getLimitToLast({required int qty});
  Future<List<Camping?>> getAutoCompleteList({
    required String keyword,
  });
}

class CampingRemoteDataSourceImpl implements CampingRemoteDataSource {
  CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection(DB.DB_CAMP_NAME);
  @override
  Future<List<Camping?>> getCampings() {
    return handleAllCampingRequest();
  }

  Future<List<Camping?>> handleAllCampingRequest() async {
    List<Camping?> campingsList = [];

    await collection.get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) async {
        campingsList.add(await getCampingResponse(doc));
      });
    });
    return campingsList;
  }

  Future<List<OpenHour>> getOpenHourList(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) async {
    List<OpenHour> openHours = [];
    await doc.reference.collection(DB.DB_OPEN_HOURS_NAME).get().then((value) {
      value.docs.forEach((doc) async {
        openHours.add(OpenHourResponse.fromFirestore(doc.data()));
      });
    });
    return openHours;
  }

  Future<List<GalleryItem>> getGalleryItemList(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) async {
    List<GalleryItem> galleryItemList = [];
    await doc.reference.collection(DB.DB_GALLERY_NAME).get().then((value) {
      value.docs.forEach((doc) async {
        galleryItemList.add(GalleryItemResponse.fromFirestore(doc.data()));
      });
    });
    return galleryItemList;
  }

  Future<List<AdditionalInfo>> getAdditionalInfoList(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) async {
    List<AdditionalInfo> additionalInfoList = [];
    await doc.reference.collection(DB.DB_ADD_INFO_NAME).get().then((value) {
      value.docs.forEach((doc) async {
        additionalInfoList
            .add(AdditionalInfoResponse.fromFirestore(doc.data()));
      });
    });
    return additionalInfoList;
  }

  @override
  Future<List<Camping?>> getLimitToLast({required int qty}) {
    return handleLimitToLastRequest(qty: qty);
  }

  Future<List<Camping?>> handleLimitToLastRequest({required int qty}) async {
    List<Camping?> campingsList = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await collection
        .orderBy('update_date', descending: true)
        .limit(qty)
        .get();

    for (var doc in querySnapshot.docs) {
      campingsList.add(await getCampingResponse(doc));
    }
    return campingsList;
  }

  Future<CampingResponse> getCampingResponse(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) async {
    Map<String, dynamic> campingData = doc.data();
    //OpenHours
    List<OpenHour> openHours = await getOpenHourList(doc);
    //Gallery
    List<GalleryItem> galleryItemList = await getGalleryItemList(doc);
    //AdditionalInfo
    List<AdditionalInfo> additionalInfoList = await getAdditionalInfoList(doc);
    campingData.addAll({
      DB.DB_OPEN_HOURS_NAME: openHours,
      DB.DB_GALLERY_NAME: galleryItemList,
      DB.DB_ADD_INFO_NAME: additionalInfoList,
    });
    return CampingResponse.fromFirestore(campingData);
  }

  @override
  Future<List<Camping?>> getAutoCompleteList({required String keyword}) {
    return handleAutoCompleteList(keyword: keyword);
  }

  Future<List<Camping?>> handleAutoCompleteList(
      {required String keyword}) async {
    List<Camping?> campingsList = [];

    //search name_camping
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await collection
        .orderBy(
            'name_camping') // depois, ordena a consulta pelo campo 'name_camping'
        .startAt([
      keyword,
    ]) // começa a consulta em 'name_camping'
        .endAt([
      keyword + '\uf8ff',
    ]) // termina a consulta em 'name_camping'
        .get();

    for (var doc in querySnapshot.docs) {
      campingsList.add(await getCampingResponse(doc));
    }

    //search title
    QuerySnapshot<Map<String, dynamic>> querySnapshotTitle = await collection
        .orderBy('title') // depois, ordena a consulta pelo campo 'title'
        .startAt([
      keyword,
    ]) // começa a consulta em 'title'
        .endAt([
      keyword + '\uf8ff',
    ]) // termina a consulta em 'title'
        .get();

    for (var docTitle in querySnapshotTitle.docs) {
      campingsList.add(await getCampingResponse(docTitle));
    }
    return campingsList;
  }
}
