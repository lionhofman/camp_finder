import 'package:camp_finder/app/data/database/db.dart';
import 'package:camp_finder/app/data/models/camping_response.dart';
import 'package:camp_finder/app/domain/entities/camping.dart';
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
      querySnapshot.docs.forEach((doc) {
        campingsList.add(CampingResponse.fromFirestore(doc.data()));
      });
    });
    return campingsList;
  }

  @override
  Future<List<Camping?>> getLimitToLast({required int qty}) {
    return handleLimitToLastRequest(qty: qty);
  }

  Future<List<Camping?>> handleLimitToLastRequest({required int qty}) async {
    List<Camping?> campingsList = [];
    await collection
        .orderBy('update_date', descending: true)
        .limit(qty)
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        campingsList.add(CampingResponse.fromFirestore(doc.data()));
      });
    });

    return campingsList;
  }

  @override
  Future<List<Camping?>> getAutoCompleteList({required String keyword}) {
    return handleAutoCompleteList(keyword: keyword);
  }

  Future<List<Camping?>> handleAutoCompleteList(
      {required String keyword}) async {
    List<Camping?> campingsList = [];

    await collection
        .orderBy(
            'name_camping') // depois, ordena a consulta pelo campo 'name_camping'
        .startAt([
          keyword,
        ]) // começa a consulta em 'name_camping'
        .endAt([
          keyword + '\uf8ff',
        ]) // termina a consulta em 'name_camping'
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            campingsList.add(CampingResponse.fromFirestore(doc.data()));
          });
        });

    await collection
        .orderBy('title') // depois, ordena a consulta pelo campo 'title'
        .startAt([
          keyword,
        ]) // começa a consulta em 'title'
        .endAt([
          keyword + '\uf8ff',
        ]) // termina a consulta em 'title'
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            campingsList.add(CampingResponse.fromFirestore(doc.data()));
          });
        });
    return campingsList;
  }
}
