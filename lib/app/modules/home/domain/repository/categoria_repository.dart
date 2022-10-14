import 'package:dartz/dartz.dart';
import 'package:marajoar/app/modules/home/domain/dto/categoria_dto.dart';
import 'package:marajoar/app/modules/home/domain/error/categoria_error.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

abstract class CategoriaRepository {
  Future<Either<CategoriaError,List<ArModel>>> selectCategoriaList(CategoriaDto categoriaDto);
}