import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marajoar/app/modules/home/domain/repository/home_repository.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

abstract class GetRecomendados {
  Future<List<ArModel>> call(BuildContext context){}
}

class GetRecomendadosImpl implements GetRecomendados {

  final HomeRepository repository;
  GetRecomendadosImpl(this.repository);

  @override
  Future<List<ArModel>> call(BuildContext context) async {
    return await repository.getRecomendados(context);
  }
  
}