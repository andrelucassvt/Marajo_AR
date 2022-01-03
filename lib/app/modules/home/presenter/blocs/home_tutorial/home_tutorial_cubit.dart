import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marajoar/app/shared/data/get_first_acess.dart';
import 'package:marajoar/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/tutorial.dart';

class HomeTutorialCubit extends Cubit<bool> {

  HomeTutorialCubit() : super(false);

  var keyAboutMarajoAR = GlobalKey();
  
  Future<void> chamarTutorial(BuildContext context) async {
    await _validar();
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
      if (state == false) {
        Tutorial.showTutorial(context, itens);
        GetFirstAcess.salvarAcesso();
      }
    });
  }

  Future<void> _validar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = prefs.getBool('valid') ?? false;
    emit(result);
    print(state);
  }
}
