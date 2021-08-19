class ArModel {
  int id;
  String nome;
  String descricao;
  String foto;
  String objeto;

  ArModel({this.id,this.nome, this.descricao, this.foto, this.objeto});

  ArModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    foto = json['foto'];
    objeto = json['objeto'];
  }

  ArModel.fromMap(Map map){
    id = map['id'];
    nome = map['name'];
    descricao = map['descricao'];
    foto = map['foto'];
    objeto = map['objeto'];
  }

  Map<String, Object> toMap(){
    var map = <String, Object>{
      'id': id,
      'name': nome,
      'descricao': descricao,
      'foto': foto,
      'objeto': objeto
    };
    if(id != null){
      map['id'] = id;
    }
    return map;
  }

  static List fromJsonList (List list){
    if(list == null){
      return [];
    }
    return list.map((e) => ArModel.fromJson(e)).toList();
  }
}