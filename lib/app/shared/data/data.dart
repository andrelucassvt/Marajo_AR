import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';
import 'package:marajoar/generated/l10n.dart';

class DataArModel {
  static List<ArModel> getDataListArModel(BuildContext context) {
    LocaleProvider locale = LocaleProvider.of(context);
    return [
      ArModel(
          nome: locale.CoreDataListBuffaloName,
          foto: 'assets/animais/buffalo.png',
          descricao: locale.CoreDataListBuffaloDesc,
          objeto: Platform.isIOS
              ? 'bufalo5'
              : 'https://firebasestorage.googleapis.com/v0/b/armaterial-94d57.appspot.com/o/arMarajo%2Fbufalo5.gltf?alt=media&token=9f4baf6d-ae4f-4d1c-ba53-0a8dcbc916c8',
          isfavorito: true,
          categoriasEnum: CategoriasEnum.animais,
          listaImagens: [
            'assets/animais/buffalo/policia_buffalo.jpeg',
            'assets/animais/buffalo/couro.jpeg',
            'assets/animais/buffalo/rebanho.jpeg',
          ]),
      ArModel(
          nome: locale.CoreDataListQueijoName,
          foto: 'assets/comidas/queijo.jpg',
          descricao: locale.CoreDataListQueijoDesc,
          objeto: Platform.isIOS
              ? 'queijomara'
              : 'https://firebasestorage.googleapis.com/v0/b/armaterial-94d57.appspot.com/o/arMarajo%2Fqueijomara.gltf?alt=media&token=910aabfb-a5e0-41dd-ad20-d8a0d93cd3b2',
          isfavorito: true,
          categoriasEnum: CategoriasEnum.comidas,
          listaImagens: [
            'assets/comidas/queijo/queijo_1.jpeg',
            'assets/comidas/queijo/queijo_2.jpeg',
            'assets/comidas/queijo/queijo_3.jpeg',
          ]),
      ArModel(
          nome: locale.CoreDataListAbacaxiName,
          foto: 'assets/comidas/abacaxi.jpeg',
          descricao: locale.CoreDataListAbacaxiDesc,
          objeto: Platform.isIOS
              ? 'abacaxi'
              : 'https://firebasestorage.googleapis.com/v0/b/armaterial-94d57.appspot.com/o/arMarajo%2Fpineapple.glb?alt=media&token=26cb6916-f357-4967-bd89-d40632662b85',
          isfavorito: true,
          categoriasEnum: CategoriasEnum.comidas,
          listaImagens: [
            'assets/comidas/abacaxi/abacaxi_2.jpeg',
            'assets/comidas/abacaxi/terra.jpeg',
          ]),
      ArModel(
          nome: locale.CoreDataListVasoName,
          foto: 'assets/objetos/vaso_marajoara.jpg',
          descricao: locale.CoreDataListVasoDesc,
          objeto: Platform.isIOS
              ? 'vaso1'
              : 'https://firebasestorage.googleapis.com/v0/b/armaterial-94d57.appspot.com/o/arMarajo%2Fvaso3.gltf?alt=media&token=34356e95-1d46-4139-88c1-6b7c00b6ce49',
          isfavorito: true,
          categoriasEnum: CategoriasEnum.artesanato,
          listaImagens: [
            'assets/objetos/vaso/vaso_1.jpeg',
            'assets/objetos/vaso/vaso_2.jpeg',
            'assets/objetos/vaso/vaso_3.jpeg',
          ]),
      ArModel(
          nome: 'Pirarucu',
          foto: 'assets/animais/pirarucu.jpeg',
          descricao: locale.CoreDataListPirarucuDesc,
          objeto: Platform.isIOS
              ? 'pirarucu'
              : 'https://firebasestorage.googleapis.com/v0/b/armaterial-94d57.appspot.com/o/arMarajo%2Fpirarocu.glb?alt=media&token=c2269386-f62f-4229-b693-554bc776d701',
          isfavorito: false,
          categoriasEnum: CategoriasEnum.animais,
          listaImagens: [
            'assets/animais/pirarucu/Pirarucu_1.jpeg',
            'assets/animais/pirarucu/pirarucu_2.jpeg',
            'assets/animais/pirarucu/pirarucu_3.jpeg',
          ]),
      // ArModel(
      //     nome: locale.CoreDataListCaranguejoName,
      //     foto: 'assets/animais/caranguejo.jpeg',
      //     descricao: locale.CoreDataListCaranguejoDesc,
      //     objeto: Platform.isIOS
      //         ? 'caranguejo3'
      //         : 'https://firebasestorage.googleapis.com/v0/b/armaterial-94d57.appspot.com/o/arMarajo%2Fblue_crab.glb?alt=media&token=182beb35-788a-4fbe-ab45-a83c200c677c',
      //     isfavorito: false,
      //     categoriasEnum: CategoriasEnum.animais,
      //     listaImagens: [
      //       'assets/animais/caranguejo/crab_1.jpeg',
      //       'assets/animais/caranguejo/crab_2.jpeg',
      //     ]),
    ];
  }
}
