import 'package:flutter/material.dart';
import 'package:marajoar/app/shared/data/data.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

class SeachController {

  Future<List<ArModel>> getDados(BuildContext context) async {
    return DataArModel.getDataListArModel(context);
  }
}