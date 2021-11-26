import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marajoar/app/modules/home/domain/repository/categoria_repository.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';

abstract class GetCategorias {
  Future<List<ArModel>> call(CategoriasEnum categoriasEnum,BuildContext context){}
}

@Injectable(singleton: false)
class GetCategoriasImpl implements GetCategorias {

  final CategoriaRepository repository;
  GetCategoriasImpl(this.repository);

  @override
  Future<List<ArModel>> call(CategoriasEnum categoriasEnum, BuildContext context) async {
    return await repository.selectCategoriaList(categoriasEnum, context);
  }
  
}