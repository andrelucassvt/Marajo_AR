import 'package:marajoar/app/shared/enums/categoria_enum.dart';
import 'package:marajoar/app/shared/models/ar_model.dart';

class CategoriaService {
  
  Future<List<ArModel>> selectCategoriaList(CategoriasEnum categoriasEnum) async {
    switch (categoriasEnum) {
      case CategoriasEnum.artesanato:
        return getArtesanato();
      case CategoriasEnum.comidas:
        return getComidas();
      case CategoriasEnum.animais:
        return getAnimais();
    }
  }


  Future<List<ArModel>> getArtesanato() async {
    List<ArModel> lista = [
      ArModel(
        id: 1,
        nome: 'Vaso Marajoara',
        descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        foto: 'assets/objetos/vaso_marajoara.jpg',
        objeto: 'aaaaaaa'
      )
    ];
    return lista;
  }

  Future<List<ArModel>> getAnimais() async {
    List<ArModel> lista = [];
    return lista;
  }

  Future<List<ArModel>> getComidas() async {
    List<ArModel> lista = [
      ArModel(
        id: 1,
        nome: 'Queijo Marajoara',
        descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        foto: 'assets/comidas/queijo.jpg',
        objeto: 'aaaaaaa'
      )
    ];
    return lista;
  }
}