 import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/controller/home_controller.dart';
import 'package:marajoar/app/modules/home/pages/categoria/categoria_page.dart';
import 'package:marajoar/app/shared/enums/categoria_enum.dart';
import 'package:marajoar/app/shared/models/ar_model.dart';
import 'package:marajoar/app/shared/shared_preference/shared_preference.dart';
import 'package:marajoar/app/shared/widgets/card_widget.dart';
import 'package:marajoar/app/shared/widgets/icon_categoria.dart';
import 'package:marajoar/generated/l10n.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/tutorial.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State <HomePage> {
  SharedPreferenceController sharedPreferenceController = SharedPreferenceController();
  HomeController controller = HomeController();
  bool valid = false;
  validar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = prefs.getBool('valid') ?? false;
    setState(() {
      valid = result;
      print(valid);
    });
  }
  var keyAboutMarajoAR = GlobalKey();
  List<TutorialItens> itens = [];
  chamarTutorial(BuildContext context){
    validar();
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
        sharedPreferenceController.salvarAcesso();
      }
    });
  }
  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      chamarTutorial(context);
    });
    super.initState();
    controller.getRecomendados();
  }
  @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider = LocaleProvider.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/sobre');
                    },
                    key: keyAboutMarajoAR, 
                    iconSize: 40,
                    icon: Icon(Icons.info_outline),
                  ),
                  Text(
                    'Ar Marajó',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      Share.share(
                        'Conheça um pouca da Ilha do Marajó em realidade aumentada\nBaixe o app:'
                      );
                    },
                    iconSize: 40, 
                    icon: Icon(Icons.share),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  localeProvider.HomeBodyCategoria,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconWidgetCategoria(
                      nome: localeProvider.HomeBodyIconsCategoriaArtesanato, 
                      icone: '🏺', 
                      containerColor: Colors.white,
                      iconeColor: Colors.black, 
                      ontap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_)=> CategoriaPage(CategoriasEnum.artesanato)));
                      }
                    ),
                    IconWidgetCategoria(
                      nome: localeProvider.HomeBodyIconsCategoriaAnimais, 
                      icone: '🐊', 
                      containerColor: Colors.white,
                      iconeColor: Colors.black, 
                      ontap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_)=> CategoriaPage(CategoriasEnum.animais)));
                      }
                    ),
                    IconWidgetCategoria(
                      nome: localeProvider.HomeBodyIconsCategoriaComidas, 
                      icone: '🥘', 
                      containerColor: Colors.white,
                      iconeColor: Colors.black, 
                      ontap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_)=> CategoriaPage(CategoriasEnum.comidas)));
                      }
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 15, bottom: 20),
                child: Text(
                  localeProvider.HomeBodyRecomendados,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

              Expanded(
                child: StreamBuilder<List<ArModel>>(
                  stream: controller.dados.stream,
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<ArModel> dados = snapshot.data;
                    return ListView.builder(
                      itemCount: dados.length,
                      itemBuilder: (context,index){
                        return CardWidget(dados[index]);
                      },
                    );
                  }
                )
              )

            ],
          ),
        ),
      ),
    );
  }
}