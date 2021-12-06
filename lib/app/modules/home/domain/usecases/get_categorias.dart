import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marajoar/app/modules/home/domain/dto/categoria_dto.dart';
import 'package:marajoar/app/modules/home/domain/error/categoria_error.dart';
import 'package:marajoar/app/modules/home/domain/repository/categoria_repository.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';

abstract class GetCategorias {
  Future<Either<CategoriaError,List<ArModel>>> call(CategoriaDto categoriaDto);
}

class GetCategoriasImpl implements GetCategorias {

  final CategoriaRepository repository;
  GetCategoriasImpl(this.repository);

  @override
  Future<Either<CategoriaError,List<ArModel>>> call(CategoriaDto categoriaDto) async {
    if (categoriaDto.categoriasEnum == null) {
      return left(CategoriaError('Erro ao carregar listas de categorias especifica'));
    }
    if (categoriaDto.context == null) {
      return left(CategoriaError('Erro ao carregar listas de categorias especifica'));
    }
    return await repository.selectCategoriaList(categoriaDto);
  }
  
}