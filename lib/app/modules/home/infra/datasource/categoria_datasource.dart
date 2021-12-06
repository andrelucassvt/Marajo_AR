import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/domain/dto/categoria_dto.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';

abstract class CategoriaDatasource {

  Future<List<ArModel>> selectCategoriaList(CategoriaDto categoriaDto);

  Future<List<ArModel>> getArtesanato(BuildContext context);

  Future<List<ArModel>> getAnimais(BuildContext context);

  Future<List<ArModel>> getComidas(BuildContext context);
}