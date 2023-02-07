import 'package:dartz/dartz.dart';
import 'package:marajoar/app/features/home/domain/repository/ihome_repository.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

class GetAllObjectsUsecase {
  GetAllObjectsUsecase({
    required this.repository,
  });
  final IHomeRepository repository;

  Future<Either<Exception, List<ArModel>>> call() async {
    return await repository.getAll();
  }
}
