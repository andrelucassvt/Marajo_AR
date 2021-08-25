import 'package:flutter/material.dart';
import 'package:marajoar/app/core/colors.dart';
import 'package:marajoar/app/modules/home/pages/categoria/controller/categoria_controller.dart';
import 'package:marajoar/app/shared/enums/categoria_enum.dart';
import 'package:marajoar/app/shared/models/ar_model.dart';
import 'package:marajoar/app/shared/widgets/card_widget.dart';

class CategoriaPage extends StatefulWidget {
  final CategoriasEnum categoriasEnum;
  const CategoriaPage(this.categoriasEnum);

  @override
  _CategoriaPageState createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {

  CategoriaController _categoriaController = CategoriaController();

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
  void initState() {
    super.initState();
    _categoriaController.selectCategoriaList(widget.categoriasEnum);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: StreamBuilder<List<ArModel>>(
        stream: _categoriaController.dados.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<ArModel> dados = snapshot.data;

          if (dados.isEmpty) {
            return Center(
              child: Text('Sem dados cadastrados',style: TextStyle(fontSize: 20)),
            );
          }

          return ListView.builder(
            itemCount: dados.length,
            itemBuilder: (context,index){
              return CardWidget(dados[index]);
            }
          );
        }
      )
    );
  }
}