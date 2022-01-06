import 'package:dartz/dartz.dart';
import 'package:marajoar/app/modules/home/domain/dto/categoria_dto.dart';
import 'package:marajoar/app/modules/home/domain/error/categoria_error.dart';
import 'package:marajoar/app/modules/home/domain/repository/categoria_repository.dart';
import 'package:marajoar/app/modules/home/infra/datasource/categoria_datasource.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

class CategoriaRepositoryImpl implements CategoriaRepository {

  final CategoriaDatasource categoriaDataSource;
  CategoriaRepositoryImpl(this.categoriaDataSource);

  @override
  Future<Either<CategoriaError,List<ArModel>>> selectCategoriaList(CategoriaDto categoriaDto) async {
    try {
      var categoria = await categoriaDataSource.selectCategoriaList(categoriaDto);
      return Right(categoria);
    } on CategoriaError catch (e) {
      throw Left(CategoriaError('Erro ao carregar categorias'));
    }
  }
}