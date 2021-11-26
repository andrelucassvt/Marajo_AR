import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/domain/repository/categoria_repository.dart';
import 'package:marajoar/app/modules/home/external/datasource/categoria_datasource_impl.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/domain/errors/global_error.dart';

class CategoriaRepositoryImpl implements CategoriaRepository {

  final CategoriaDatasourceImpl categoriaDataSource;
  CategoriaRepositoryImpl(this.categoriaDataSource);

  @override
  Future<List<ArModel>> selectCategoriaList(CategoriasEnum categoriasEnum, BuildContext context) {
    try {
      return categoriaDataSource.selectCategoriaList(categoriasEnum, context);
    } on GlobalError catch (e) {
      throw GlobalError('Erro ao carregar categorias');
    }
  }
}