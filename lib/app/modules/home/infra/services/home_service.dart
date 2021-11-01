import 'package:flutter/material.dart';
import 'package:marajoar/app/shared/infra/datasources/data.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

class HomeService {

  Future<List<ArModel>> getRecomendados(BuildContext context) async {
    return LanguageListArModel.listaArModelGlobal(context).where((element) => element.isfavorito).toList();  
  }
  
}