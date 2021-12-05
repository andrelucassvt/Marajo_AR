import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/domain/error/home_recomendados_error.dart';
import 'package:marajoar/app/modules/home/domain/repository/home_repository.dart';
import 'package:marajoar/app/modules/home/external/datasource/home_recomendados_datasource_impl.dart';
import 'package:marajoar/app/modules/home/infra/datasource/home_recomendados_datasource.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/domain/errors/global_error.dart';

class HomeRepositoryImpl implements HomeRepository{

  final HomeRecomendadosDatasource homeDataSourece;
  HomeRepositoryImpl(this.homeDataSourece);

  @override
  Future<Either<HomeRecomendadosError,List<ArModel>>> getRecomendados(BuildContext context) async {
    try {
      var recomendados = await homeDataSourece.getRecomendados(context);
      return Right(recomendados);
    } on HomeRecomendadosError catch (e) {
      throw Left(HomeRecomendadosError('Erro ao carregar recomendados'));
    }
  }
  
}