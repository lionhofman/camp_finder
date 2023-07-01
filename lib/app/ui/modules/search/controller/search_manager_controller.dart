import 'package:camp_finder/app/domain/entities/camping.dart';
import 'package:camp_finder/app/domain/usecases/campings/get_autocomplete_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchManagerController extends GetxController {
  final TextEditingController typeAheadController = TextEditingController();
  RxList<Camping> _autocompleteList = RxList<Camping>();
  final GetAutocompleteUseCase _autocompleteUseCase;
  SearchManagerController(
    this._autocompleteUseCase,
  );

  Future<List<Camping?>> getAutocompleteList(String text) async {
    final result = await _autocompleteUseCase.call(keyword: text.toLowerCase());
    result.fold(
      (l) => null,
      (r) {
        _autocompleteList.value = r.whereType<Camping>().toList();
      },
    );

    return _autocompleteList;
  }
}
