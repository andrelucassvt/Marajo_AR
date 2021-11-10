import 'package:flutter/material.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/infra/datasources/data.dart';

class SeachController {

  Future<List<ArModel>> getDados(BuildContext context) async {
    return LanguageListArModel.listaArModelGlobal(context); 
  }
}