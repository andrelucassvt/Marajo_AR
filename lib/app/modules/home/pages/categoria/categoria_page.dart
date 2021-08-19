import 'package:flutter/material.dart';
import 'package:marajoar/app/core/colors.dart';
import 'package:marajoar/app/shared/enums/categoria_enum.dart';

class CategoriaPage extends StatefulWidget {
  final CategoriasEnum categoriasEnum;
  const CategoriaPage(this.categoriasEnum);

  @override
  _CategoriaPageState createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {

  String get title {
    switch (widget.categoriasEnum) {
      case CategoriasEnum.artesanato:
        return 'Artesanato';
      case CategoriasEnum.animais:
        return 'Animais';
      case CategoriasEnum.comidas:
        return 'Comidas';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Sem dados',style: TextStyle(fontSize: 20)),
      )
    );
  }
}