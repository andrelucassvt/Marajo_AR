import 'package:marajoar/app/shared/enums/categoria_enum.dart';

class ArModel {
  String nome;
  String descricao;
  String foto;
  String objeto;
  bool isfavorito;
  CategoriasEnum categoriasEnum;
  List<String> listaImagens; 

  ArModel({
    this.nome, 
    this.descricao, 
    this.foto, 
    this.objeto,
    this.isfavorito,
    this.categoriasEnum,
    this.listaImagens,
  });
}