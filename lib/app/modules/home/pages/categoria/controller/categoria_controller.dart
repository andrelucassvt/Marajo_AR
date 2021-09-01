import 'dart:async';
import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/pages/categoria/service/categoria_service.dart';
import 'package:marajoar/app/modules/home/service/home_service.dart';
import 'package:marajoar/app/shared/enums/categoria_enum.dart';
import 'package:marajoar/app/shared/models/ar_model.dart';
import 'package:mobx/mobx.dart';

part 'categoria_controller.g.dart';

class CategoriaController = _CategoriaStoreBase with _$CategoriaController;

abstract class _CategoriaStoreBase with Store {

  CategoriaService _categoriaService = CategoriaService();
  
  @observable
  StreamController<List<ArModel>> dados = StreamController<List<ArModel>>();

  @action
  selectCategoriaList(CategoriasEnum categoriasEnum,BuildContext context) async {
    List<ArModel> response = await _categoriaService.selectCategoriaList(categoriasEnum,context);
    dados.add(response);
  }
}