import 'package:flutter/material.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';

abstract class CategoriaRepository {
  Future<List<ArModel>> selectCategoriaList(CategoriasEnum categoriasEnum,BuildContext context){}
}