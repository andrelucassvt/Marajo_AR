import 'dart:async';
import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/domain/error/home_recomendados_error.dart';
import 'package:marajoar/app/modules/home/domain/usecases/get_recomendados.dart';
import 'package:marajoar/app/shared/data/get_first_acess.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/generated/l10n.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/tutorial.dart';

part 'home_controller.g.dart';

class HomeController = _HomeStoreBase with _$HomeController;

abstract class _HomeStoreBase with Store {
  final GetRecomendados homeService;
  _HomeStoreBase(this.homeService);
  
  @observable
  StreamController<List<ArModel>> homeController = StreamController<List<ArModel>>();
  Stream<List<ArModel>> get homeOut => homeController.stream;

  @observable
  bool valid = false;
  
  @observable
  var keyAboutMarajoAR = GlobalKey();

  @action
  getRecomendados(BuildContext context) async {
    var response = await homeService(context);
    response.fold(
      (l) => homeController.addError(l), 
      (r) => homeController.add(r)
    );
  }

  @action
  chamarTutorial(BuildContext context) async {
    await validar();
    List<TutorialItens> itens = [];
    itens.addAll({
      TutorialItens(
        globalKey: keyAboutMarajoAR,
        touchScreen: true,
        top: 200,
        left: 50,
        children: [
          Text(
            LocaleProvider.of(context).HomeTutorialTextAttention,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 100,
          )
        ],
        widgetNext: Text(
          LocaleProvider.of(context).HomeTutorialTextTapNext,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        ),
        shapeFocus: ShapeFocus.oval),
    });    
    Future.delayed(Duration(microseconds: 200)).then((value) {
      if (valid == false) {
        Tutorial.showTutorial(context, itens);
        GetFirstAcess.salvarAcesso();
      }
    });
  }
  
  @action
  validar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = prefs.getBool('valid') ?? false;
    valid = result;
    print(valid);
  }
  
}