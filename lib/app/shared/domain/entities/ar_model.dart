import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';

class ArModel {
  final String nome;
  final String descricao;
  final String foto;
  final String objeto;
  final bool isfavorito;
  final CategoriasEnum categoriasEnum;
  final List<String> listaImagens;

  ArModel({
    required this.nome,
    required this.descricao,
    required this.foto,
    required this.objeto,
    required this.isfavorito,
    required this.categoriasEnum,
    required this.listaImagens,
  });
}
