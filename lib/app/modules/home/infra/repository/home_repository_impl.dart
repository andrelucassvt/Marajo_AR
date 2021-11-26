import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/domain/repository/home_repository.dart';
import 'package:marajoar/app/modules/home/external/datasource/home_recomendados_datasource_impl.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/domain/errors/global_error.dart';

class HomeRepositoryImpl implements HomeRepository{

  final HomeRecomendadosDatasourceImpl homeDataSourece;
  HomeRepositoryImpl(this.homeDataSourece);

  @override
  Future<List<ArModel>> getRecomendados(BuildContext context) async {
    try {
      return await homeDataSourece.getRecomendados(context);
    } on GlobalError catch (e) {
      throw GlobalError('Erro ao carregar recomendados');
    }
  }
  
}