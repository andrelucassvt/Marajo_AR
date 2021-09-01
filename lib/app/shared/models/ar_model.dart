import 'package:marajoar/app/shared/enums/categoria_enum.dart';

class ArModel {
  String nome;
  String descricao;
  String foto;
  String objeto;
  bool isfavorito;
  CategoriasEnum categoriasEnum;

  ArModel({
    this.nome, 
    this.descricao, 
    this.foto, 
    this.objeto,
    this.isfavorito,
    this.categoriasEnum,
  });

  ArModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    descricao = json['descricao'];
    foto = json['foto'];
    objeto = json['objeto'];
    isfavorito = json['isfavorito'];
  }

  static List fromJsonList (List list){
    if(list == null){
      return [];
    }
    return list.map((e) => ArModel.fromJson(e)).toList();
  }
}