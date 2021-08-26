import 'package:marajoar/app/shared/enums/categoria_enum.dart';

class ArModel {
  late int id;
  late String nome;
  late String descricao;
  late String foto;
  late String objeto;
  late bool isfavorito;
  late CategoriasEnum categoriasEnum;

  ArModel({
    required this.id,
    required this.nome, 
    required this.descricao, 
    required this.foto, 
    required this.objeto,
    required this.isfavorito,
    required this.categoriasEnum,
  });

  ArModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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