import 'package:camp_finder/app/domain/entities/camping.dart';
import 'package:camp_finder/app/domain/repositories/camping_repository.dart';
import 'package:dartz/dartz.dart';

class GetCampingsLimitToLastUseCase {
  final CampingRepository _campingsRepository;
  GetCampingsLimitToLastUseCase(this._campingsRepository);

  Future<Either<Exception, List<Camping?>>> call({required int qty}) async {
    return await _campingsRepository.getLimitToLast(qty: qty);
  }
}
