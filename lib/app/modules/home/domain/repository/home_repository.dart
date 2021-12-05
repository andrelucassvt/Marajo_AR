import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/domain/error/home_recomendados_error.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

abstract class HomeRepository {
  Future<Either<HomeRecomendadosError,List<ArModel>>> getRecomendados(BuildContext context);
}