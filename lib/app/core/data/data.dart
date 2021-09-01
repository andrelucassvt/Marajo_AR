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
        nome: 'Búfalo Marajoara',
        foto: 'assets/animais/buffalo.png',
        descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        objeto: Platform.isIOS ? 'models.scnassets/buffalo.usdz' : 'buffalo.sfb',
        isfavorito: true,
        categoriasEnum: CategoriasEnum.animais,
      ),
      ArModel(
        nome: 'Abacaxi',
        foto: 'assets/comidas/abacaxi.jpeg',
        descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        objeto: Platform.isIOS ? 'models.scnassets/abacaxi.usdz' : 'abacaxi.sfb',
        isfavorito: true,
        categoriasEnum: CategoriasEnum.comidas,
      ),
      ArModel(
        nome: 'Queijo do Marajó',
        foto: 'assets/comidas/queijo.jpg',
        descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        objeto: Platform.isIOS ? 'models.scnassets/queijom.usdz' : 'queijom.sfb',
        isfavorito: true,
        categoriasEnum: CategoriasEnum.comidas,
      ),
      ArModel(
        nome: 'Vaso Marajoara',
        foto: 'assets/objetos/vaso_marajoara.jpg',
        descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        objeto: 'models.scnassets/vaso3.usdz',
        isfavorito: true,
        categoriasEnum: CategoriasEnum.artesanato,
      ),
      ArModel(
        nome: 'Pirarucu',
        foto: 'assets/animais/pirarucu.jpeg',
        descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        objeto: Platform.isIOS ?  'models.scnassets/pirarucu.usdz' : 'pirarucu.sfb',
        isfavorito: false,
        categoriasEnum: CategoriasEnum.animais,
      ),
    ];
  } 
}