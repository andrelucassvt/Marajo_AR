import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/domain/dto/categoria_dto.dart';
import 'package:marajoar/app/modules/home/domain/error/categoria_error.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';

abstract class CategoriaRepository {
  Future<Either<CategoriaError,List<ArModel>>> selectCategoriaList(CategoriaDto categoriaDto);
}