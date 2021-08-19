import 'dart:async';
import 'package:marajoar/app/modules/home/service/home_service.dart';
import 'package:marajoar/app/shared/models/ar_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeStoreBase with _$HomeController;

abstract class _HomeStoreBase with Store {

  HomeService _homeService = HomeService();
  
  @observable
  StreamController<List<ArModel>> dados = StreamController<List<ArModel>>();

  @action
  getRecomendados() async {
    List<ArModel> response = await _homeService.getRecomendados();
    dados.add(response);
  }
}