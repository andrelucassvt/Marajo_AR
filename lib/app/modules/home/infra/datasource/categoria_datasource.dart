import 'package:flutter/material.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';

abstract class CategoriaDatasource {

  Future<List<ArModel>> selectCategoriaList(CategoriasEnum categoriasEnum,BuildContext context){}

  Future<List<ArModel>> getArtesanato(BuildContext context){}

  Future<List<ArModel>> getAnimais(BuildContext context){}

  Future<List<ArModel>> getComidas(BuildContext context){}
}