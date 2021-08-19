import 'package:marajoar/app/shared/models/ar_model.dart';

class HomeService {

  Future<List<ArModel>> getRecomendados() async {
    List<ArModel> lista = [
      ArModel(
        id: 1,
        nome: 'Queijo do Marajó',
        foto: 'assets/comidas/queijo.jpg',
        descricao: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
        objeto: 'queijo_marajo.sfb',
      ),
      ArModel(
        id: 2,
        nome: 'Vaso Marajoara',
        foto: 'assets/objetos/vaso_marajoara.jpg',
        descricao: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
        objeto: 'vaso.sfb',
      ),
    ];
    return lista;  
  }
  
}

/* sceneform.asset('sampledata/PineappleDSLRTry2RC_Model_7.glb',
        'default',
        'sampledata/PineappleDSLRTry2RC_Model_7.sfa',
        'src/main/assets/Pineapple')

sceneform.asset('sampledata/queijo.obj',
        'default',
        'sampledata/queijo.sfa',
        'src/main/assets/queijo_marajo')

sceneform.asset('sampledata/vaso.obj',
        'default',
        'sampledata/vaso.sfa',
        'src/main/assets/vaso') */