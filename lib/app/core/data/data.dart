import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marajoar/app/shared/enums/categoria_enum.dart';
import 'package:marajoar/app/shared/models/ar_model.dart';
import 'package:marajoar/generated/l10n.dart';


class LanguageListArModel {
  static List<ArModel> listaArModelGlobal(BuildContext context){
    LocaleProvider locale = LocaleProvider.of(context);
    return [
      ArModel(
        nome: locale.CoreDataListBuffaloName,
        foto: 'assets/animais/buffalo.png',
        descricao: locale.CoreDataListBuffaloDesc,
        objeto: Platform.isIOS ? 'models.scnassets/buffalo.usdz' : 'buffalo.sfb',
        isfavorito: true,
        categoriasEnum: CategoriasEnum.animais,
        listaImagens: [
          'assets/animais/buffalo/policia_buffalo.jpeg',
          'assets/animais/buffalo/couro.jpeg',
          'assets/animais/buffalo/rebanho.jpeg',
        ]
      ),
      ArModel(
        nome: locale.CoreDataListAbacaxiName,
        foto: 'assets/comidas/abacaxi.jpeg',
        descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        objeto: Platform.isIOS ? 'models.scnassets/abacaxi.usdz' : 'abacaxi.sfb',
        isfavorito: true,
        categoriasEnum: CategoriasEnum.comidas,
        listaImagens: [
          'assets/comidas/abacaxi/abacaxi_2.jpeg',
          'assets/comidas/abacaxi/terra.jpeg',
        ]
      ),
      ArModel(
        nome: locale.CoreDataListQueijoName,
        foto: 'assets/comidas/queijo.jpg',
        descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        objeto: Platform.isIOS ? 'models.scnassets/queijom.usdz' : 'queijom.sfb',
        isfavorito: true,
        categoriasEnum: CategoriasEnum.comidas,
        listaImagens: [
          'assets/comidas/queijo/queijo_1.jpeg',
          'assets/comidas/queijo/queijo_2.jpeg',
          'assets/comidas/queijo/queijo_3.jpeg',
        ]
      ),
      ArModel(
        nome: locale.CoreDataListVasoName,
        foto: 'assets/objetos/vaso_marajoara.jpg',
        descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        objeto: 'models.scnassets/vaso3.usdz',
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
        descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
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
        descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        objeto: Platform.isIOS ?  'models.scnassets/caranguejo3.usdz' : 'pirarucu.sfb',
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