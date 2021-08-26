import 'package:marajoar/app/core/language/data/pt_br/data.dart';
import 'package:marajoar/app/shared/models/ar_model.dart';

class HomeService {

  Future<List<ArModel>> getRecomendados() async {
    return listaArModelGlobalBR.where((element) => element.isfavorito).toList();  
  }
  
}