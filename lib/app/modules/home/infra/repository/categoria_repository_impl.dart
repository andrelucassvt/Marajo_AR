import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/domain/error/categoria_error.dart';
import 'package:marajoar/app/modules/home/domain/repository/categoria_repository.dart';
import 'package:marajoar/app/modules/home/infra/datasource/categoria_datasource.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/domain/errors/global_error.dart';

class CategoriaRepositoryImpl implements CategoriaRepository {

  final CategoriaDatasource categoriaDataSource;
  CategoriaRepositoryImpl(this.categoriaDataSource);

  @override
  Future<Either<CategoriaError,List<ArModel>>> selectCategoriaList(CategoriasEnum categoriasEnum, BuildContext context) async {
    try {
      var categoria = await categoriaDataSource.selectCategoriaList(categoriasEnum, context);
      return Right(categoria);
    } on CategoriaError catch (e) {
      throw Left(CategoriaError('Erro ao carregar categorias'));
    }
  }
}