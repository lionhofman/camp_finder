import 'package:camp_finder/app/domain/entities/camping.dart';
import 'package:camp_finder/app/domain/repositories/camping_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllCampingsUseCase {
  final CampingRepository _campingsRepository;
  GetAllCampingsUseCase(this._campingsRepository);

  Future<Either<Exception, List<Camping?>>> call() async {
    return await _campingsRepository.getCampings();
  }
}
