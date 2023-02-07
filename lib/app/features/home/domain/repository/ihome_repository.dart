import 'package:dartz/dartz.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

abstract class IHomeRepository {
  Future<Either<Exception, List<ArModel>>> getAll();
}
