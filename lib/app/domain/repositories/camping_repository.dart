import 'package:camp_finder/app/domain/entities/camping.dart';
import 'package:dartz/dartz.dart';

abstract class CampingRepository {
  Future<Either<Exception, List<Camping?>>> getCampings();
}
