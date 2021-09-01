import 'package:flutter/material.dart';
import 'package:marajoar/app/core/data/data.dart';
import 'package:marajoar/app/shared/models/ar_model.dart';

class HomeService {

  Future<List<ArModel>> getRecomendados(BuildContext context) async {
    return LanguageListArModel.listaArModelGlobal(context).where((element) => element.isfavorito).toList();  
  }
  
}