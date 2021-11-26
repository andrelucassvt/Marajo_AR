import 'package:flutter/material.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

abstract class HomeRecomendadosDatasource {
  Future<List<ArModel>> getRecomendados(BuildContext context){}
}