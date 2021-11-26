import 'dart:async';
import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/external/datasource/categoria_datasource_impl.dart';
import 'package:marajoar/app/modules/home/infra/repository/categoria_repository_impl.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:mobx/mobx.dart';

part 'categoria_controller.g.dart';

class CategoriaController = _CategoriaStoreBase with _$CategoriaController;

abstract class _CategoriaStoreBase with Store {

  final _categoriaService = CategoriaRepositoryImpl(CategoriaDatasourceImpl());
  
  @observable
  StreamController<List<ArModel>> dados = StreamController<List<ArModel>>();

  @action
  selectCategoriaList(CategoriasEnum categoriasEnum,BuildContext context) async {
    List<ArModel> response = await _categoriaService.selectCategoriaList(categoriasEnum,context);
    dados.add(response);
  }
}