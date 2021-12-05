import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marajoar/app/modules/home/domain/usecases/get_categorias.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:mobx/mobx.dart';

part 'categoria_controller.g.dart';

class CategoriaController = _CategoriaStoreBase with _$CategoriaController;

abstract class _CategoriaStoreBase with Store {

  final GetCategorias categoriaService;
  _CategoriaStoreBase(this.categoriaService);
  
  @observable
  StreamController<List<ArModel>> categoriaController = StreamController<List<ArModel>>();
  Stream<List<ArModel>> get categoriaOut => categoriaController.stream;

  @action
  selectCategoriaList(CategoriasEnum categoriasEnum,BuildContext context) async {
    var response = await categoriaService(categoriasEnum,context);
    response.fold(
      (l) => categoriaController.addError(l), 
      (r) => categoriaController.add(r)
    );
  }

}