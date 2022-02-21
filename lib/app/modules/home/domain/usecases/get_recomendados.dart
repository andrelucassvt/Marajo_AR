import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/domain/error/home_recomendados_error.dart';
import 'package:marajoar/app/modules/home/domain/repository/home_repository.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

abstract class GetRecomendados {
  Future<Either<HomeRecomendadosError,List<ArModel>>> call(BuildContext context);
}

class GetRecomendadosImpl implements GetRecomendados {

  final HomeRepository repository;
  GetRecomendadosImpl(this.repository);

  @override
  Future<Either<HomeRecomendadosError,List<ArModel>>> call(BuildContext context) async {
    return await repository.getRecomendados(context);
  }
  
}