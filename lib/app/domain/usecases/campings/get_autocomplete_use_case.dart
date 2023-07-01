import 'package:camp_finder/app/domain/entities/camping.dart';
import 'package:camp_finder/app/domain/repositories/camping_repository.dart';
import 'package:dartz/dartz.dart';

class GetAutocompleteUseCase {
  final CampingRepository _campingsRepository;
  GetAutocompleteUseCase(this._campingsRepository);

  Future<Either<Exception, List<Camping?>>> call(
      {required String keyword}) async {
    return await _campingsRepository.getAutoCompleteList(keyword: keyword);
  }
}
