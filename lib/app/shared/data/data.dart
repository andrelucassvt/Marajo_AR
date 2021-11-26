import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/generated/l10n.dart';


class DataArModel {
  static List<ArModel> getDataListArModel(BuildContext context){
    LocaleProvider locale = LocaleProvider.of(context);
    return [
      ArModel(
        nome: locale.CoreDataListBuffaloName,
        foto: 'assets/animais/buffalo.png',
        descricao: locale.CoreDataListBuffaloDesc,
        objeto: Platform.isIOS ? 'models.scnassets/bufalo5.usdz' : 'bufalo.sfb',
        isfavorito: true,
        categoriasEnum: CategoriasEnum.animais,
        listaImagens: [
          'assets/animais/buffalo/policia_buffalo.jpeg',
          'assets/animais/buffalo/couro.jpeg',
          'assets/animais/buffalo/rebanho.jpeg',
        ]
      ),
      ArModel(
        nome: locale.CoreDataListQueijoName,
        foto: 'assets/comidas/queijo.jpg',
        descricao: locale.CoreDataListQueijoDesc,
        objeto: Platform.isIOS ? 'models.scnassets/queijomara.usdz' : 'queijo.sfb',
        isfavorito: true,
        categoriasEnum: CategoriasEnum.comidas,
        listaImagens: [
          'assets/comidas/queijo/queijo_1.jpeg',
          'assets/comidas/queijo/queijo_2.jpeg',
          'assets/comidas/queijo/queijo_3.jpeg',
        ]
      ),
      ArModel(
        nome: locale.CoreDataListAbacaxiName,
        foto: 'assets/comidas/abacaxi.jpeg',
        descricao: locale.CoreDataListAbacaxiDesc,
        objeto: Platform.isIOS ? 'models.scnassets/abacaxi.usdz' : 'abacaxi.sfb',
        isfavorito: true,
        categoriasEnum: CategoriasEnum.comidas,
        listaImagens: [
          'assets/comidas/abacaxi/abacaxi_2.jpeg',
          'assets/comidas/abacaxi/terra.jpeg',
        ]
      ),
      ArModel(
        nome: locale.CoreDataListVasoName,
        foto: 'assets/objetos/vaso_marajoara.jpg',
        descricao: locale.CoreDataListVasoDesc,
        objeto: Platform.isIOS ? 'models.scnassets/vaso1.usdz' : 'vaso.sfb',
        isfavorito: true,
        categoriasEnum: CategoriasEnum.artesanato,
        listaImagens: [
          'assets/objetos/vaso/vaso_1.jpeg',
          'assets/objetos/vaso/vaso_2.jpeg',
          'assets/objetos/vaso/vaso_3.jpeg',
        ]
      ),
      ArModel(
        nome: 'Pirarucu',
        foto: 'assets/animais/pirarucu.jpeg',
        descricao: locale.CoreDataListPirarucuDesc,
        objeto: Platform.isIOS ?  'models.scnassets/pirarucu.usdz' : 'pirarucu.sfb',
        isfavorito: false,
        categoriasEnum: CategoriasEnum.animais,
        listaImagens: [
          'assets/animais/pirarucu/Pirarucu_1.jpeg',
          'assets/animais/pirarucu/pirarucu_2.jpeg',
          'assets/animais/pirarucu/pirarucu_3.jpeg',
        ]
      ),
      ArModel(
        nome: locale.CoreDataListCaranguejoName,
        foto: 'assets/animais/caranguejo.jpeg',
        descricao: locale.CoreDataListCaranguejoDesc,
        objeto: Platform.isIOS ?  'models.scnassets/caranguejo3.usdz' : 'caranguejo.sfb',
        isfavorito: false,
        categoriasEnum: CategoriasEnum.animais,
        listaImagens: [
          'assets/animais/caranguejo/crab_1.jpeg',
          'assets/animais/caranguejo/crab_2.jpeg',
        ]
      ),
    ];
  } 
}