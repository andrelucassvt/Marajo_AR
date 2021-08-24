import 'package:marajoar/app/shared/models/ar_model.dart';

class HomeService {

  Future<List<ArModel>> getRecomendados() async {
    List<ArModel> lista = [
      ArModel(
        id: 1,
        nome: 'Queijo do Marajó',
        foto: 'assets/comidas/queijo.jpg',
        descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        objeto: 'queijo_marajo.sfb',
      ),
      ArModel(
        id: 2,
        nome: 'Vaso Marajoara',
        foto: 'assets/objetos/vaso_marajoara.jpg',
        descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        objeto: 'vaso2.sfb',
      ),
    ];
    return lista;  
  }
  
}