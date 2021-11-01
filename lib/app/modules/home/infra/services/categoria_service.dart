import 'package:flutter/material.dart';
import 'package:marajoar/app/shared/infra/datasources/data.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

class CategoriaService {
  
  Future<List<ArModel>> selectCategoriaList(CategoriasEnum categoriasEnum,BuildContext context) async {
    switch (categoriasEnum) {
      case CategoriasEnum.artesanato:
        return getArtesanato(context);
      case CategoriasEnum.comidas:
        return getComidas(context);
      case CategoriasEnum.animais:
        return getAnimais(context);
    }
  }


  Future<List<ArModel>> getArtesanato(BuildContext context) async {
    return LanguageListArModel.listaArModelGlobal(context).where((element) => element.categoriasEnum == CategoriasEnum.artesanato).toList();
  }

  Future<List<ArModel>> getAnimais(BuildContext context) async {
    return LanguageListArModel.listaArModelGlobal(context).where((element) => element.categoriasEnum == CategoriasEnum.animais).toList();
  }

  Future<List<ArModel>> getComidas(BuildContext context) async {
    return LanguageListArModel.listaArModelGlobal(context).where((element) => element.categoriasEnum == CategoriasEnum.comidas).toList();
  }
}