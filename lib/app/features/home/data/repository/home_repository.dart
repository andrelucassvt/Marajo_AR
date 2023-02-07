import 'package:dartz/dartz.dart';
import 'package:marajoar/app/features/home/data/datasource/home_datasource.dart';
import 'package:marajoar/app/features/home/domain/repository/ihome_repository.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

class HomeRepository implements IHomeRepository {
  const HomeRepository({
    required this.datasource,
  });

  final HomeDatasource datasource;

  @override
  Future<Either<Exception, List<ArModel>>> getAll() async {
    try {
      final result = await datasource.getAll();
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
