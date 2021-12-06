import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/domain/dto/categoria_dto.dart';
import 'package:marajoar/app/modules/home/infra/datasource/categoria_datasource.dart';
import 'package:marajoar/app/shared/data/data.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

class CategoriaDatasourceImpl implements CategoriaDatasource{
  @override
  Future<List<ArModel>> selectCategoriaList(CategoriaDto categoriaDto) async {
    switch (categoriaDto.categoriasEnum) {
      case CategoriasEnum.artesanato:
        return getArtesanato(categoriaDto.context);
      case CategoriasEnum.comidas:
        return getComidas(categoriaDto.context);
      case CategoriasEnum.animais:
        return getAnimais(categoriaDto.context);
    }
  }

  @override
  Future<List<ArModel>> getAnimais(BuildContext context) async {
    return DataArModel.getDataListArModel(context).where((element) => element.categoriasEnum == CategoriasEnum.animais).toList();
  }

  @override
  Future<List<ArModel>> getArtesanato(BuildContext context) async {
    return DataArModel.getDataListArModel(context).where((element) => element.categoriasEnum == CategoriasEnum.artesanato).toList();
  }

  @override
  Future<List<ArModel>> getComidas(BuildContext context) async {
    return DataArModel.getDataListArModel(context).where((element) => element.categoriasEnum == CategoriasEnum.comidas).toList();
  }

  
}