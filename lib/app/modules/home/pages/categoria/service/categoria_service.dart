import 'package:marajoar/app/core/data/data.dart';
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
    return listaArModelGlobalBR.where((element) => element.categoriasEnum == CategoriasEnum.artesanato).toList();
  }

  Future<List<ArModel>> getAnimais() async {
    return listaArModelGlobalBR.where((element) => element.categoriasEnum == CategoriasEnum.animais).toList();
  }

  Future<List<ArModel>> getComidas() async {
    return listaArModelGlobalBR.where((element) => element.categoriasEnum == CategoriasEnum.comidas).toList();
  }
}