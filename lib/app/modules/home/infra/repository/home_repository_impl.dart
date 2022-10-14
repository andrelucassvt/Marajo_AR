import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/domain/error/home_recomendados_error.dart';
import 'package:marajoar/app/modules/home/domain/error/search_error.dart';
import 'package:marajoar/app/modules/home/domain/repository/home_repository.dart';
import 'package:marajoar/app/modules/home/infra/datasource/home_recomendados_datasource.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRecomendadosDatasource homeDataSourece;
  HomeRepositoryImpl(this.homeDataSourece);

  @override
  Future<Either<HomeRecomendadosError, List<ArModel>>> getRecomendados(
      BuildContext context) async {
    try {
      var recomendados = await homeDataSourece.getRecomendados(context);
      return Right(recomendados);
    } on HomeRecomendadosError catch (e) {
      throw Left(HomeRecomendadosError('Erro ao carregar recomendados $e'));
    }
  }

  @override
  Future<Either<SearchError, List<ArModel>>> search(
      String busca, BuildContext context) async {
    try {
      var result = await homeDataSourece.search(busca, context);
      return Right(result);
    } on SearchError catch (e) {
      throw Left(SearchError('Error ao buscar model $e'));
    }
  }
}
