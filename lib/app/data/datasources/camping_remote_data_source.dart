import 'package:camp_finder/app/data/models/camping_response.dart';
import 'package:camp_finder/app/domain/entities/camping.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CampingRemoteDataSource {
  Future<List<Camping?>> getCampings();
}

class CampingRemoteDataSourceImpl implements CampingRemoteDataSource {
  @override
  Future<List<Camping?>> getCampings() {
    return handleCampingRequest();
  }

  Future<List<Camping?>> handleCampingRequest() async {
    CollectionReference<Map<String, dynamic>> collection =
        FirebaseFirestore.instance.collection("camping");
    List<Camping?> campingsList = [];

    await collection.get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        campingsList.add(CampingResponse.fromFirestore(doc.data()));
      });
    });
    return campingsList;
  }
}
