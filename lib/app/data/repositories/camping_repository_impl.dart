import 'package:dartz/dartz.dart';
import 'package:camp_finder/app/data/datasources/camping_remote_data_source.dart';
import 'package:camp_finder/app/domain/entities/camping.dart';
import 'package:camp_finder/app/domain/repositories/camping_repository.dart';

class CampingRepositoryImpl implements CampingRepository {
  final CampingRemoteDataSource _campingsRemoteDataSource;
  CampingRepositoryImpl(this._campingsRemoteDataSource);
  @override
  Future<Either<Exception, List<Camping?>>> getCampings() async {
    try {
      var campings = await _campingsRemoteDataSource.getCampings();
      return Right(campings);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
