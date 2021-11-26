import 'dart:async';
import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/external/datasource/home_recomendados_datasource_impl.dart';
import 'package:marajoar/app/modules/home/infra/repository/home_repository_impl.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeStoreBase with _$HomeController;

abstract class _HomeStoreBase with Store {
  final _homeService = HomeRepositoryImpl(HomeRecomendadosDatasourceImpl());
  
  @observable
  StreamController<List<ArModel>> dados = StreamController<List<ArModel>>();

  @action
  getRecomendados(BuildContext context) async {
    List<ArModel> response = await _homeService.getRecomendados(context);
    dados.add(response);
  }
}