// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:camp_finder/app/domain/entities/camping.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import 'package:camp_finder/app/domain/usecases/campings/get_campings_limit_to_last_use_case.dart';

class ShowcaseHighlightsController extends GetxController {
  GetCampingsLimitToLastUseCase getCampingsLimitToLastUseCase;

  List<Camping?> _listCamps = <Camping>[].obs;

  List<Camping?> get listCamps => _listCamps;
  ShowcaseHighlightsController(
    this.getCampingsLimitToLastUseCase,
  );

  @override
  void onInit() {
    getCampsLimitToLast(qty: 5);
    super.onInit();
  }

  Future<void> getCampsLimitToLast({required qty}) async {
    Either<Exception, List<Camping?>> camps =
        await getCampingsLimitToLastUseCase.call(qty: qty);

    camps.fold((l) {
      print("Failure in the query to home showCase");
    }, (data) {
      _listCamps.clear();
      _listCamps = data.obs;
    });
  }
}
