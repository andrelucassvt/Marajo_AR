import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:marajoar/app/modules/home/presenter/pages/categoria/categoria_module.dart';
import 'package:marajoar/app/modules/home/presenter/pages/home/home_controller.dart';
import 'package:marajoar/app/shared/core/text.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/widgets/card_widget.dart';
import 'package:marajoar/app/shared/widgets/icon_categoria.dart';
import 'package:marajoar/generated/l10n.dart';
import 'package:share/share.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State <HomePage> {

  final controller = Modular.get<HomeController>();
  InterstitialAd _interstitialAd;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      controller.chamarTutorial(context);
      controller.getRecomendados(context);
      iniciarAdmob();
    });
    Future.delayed(Duration(seconds: 30),(){
      _interstitialAd.show();
    });
  }

  @override
  void dispose() {
    controller.homeController.close();
    super.dispose();
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
                    key: controller.keyAboutMarajoAR, 
                    iconSize: 40,
                    icon: Icon(Icons.info_outline),
                  ),
                  Text(
                    'Marajó AR',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                       Share.share(TextShare.textoShare(context));
                    },
                    iconSize: 40, 
                    icon: Icon(Icons.share),
                  ),
                ],
              ),

              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/seach');
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: 'Pesquisar',
                      contentPadding: EdgeInsets.only(top: 15 ),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
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
                          MaterialPageRoute(builder: (_)=> CategoriaModule(CategoriasEnum.artesanato)));
                      }
                    ),
                    IconWidgetCategoria(
                      nome: localeProvider.HomeBodyIconsCategoriaFauna, 
                      icone: '🐃', 
                      containerColor: Colors.white,
                      iconeColor: Colors.black, 
                      ontap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_)=> CategoriaModule(CategoriasEnum.animais)));
                      }
                    ),
                    IconWidgetCategoria(
                      nome: localeProvider.HomeBodyIconsCategoriaComidas, 
                      icone: '🥘', 
                      containerColor: Colors.white,
                      iconeColor: Colors.black, 
                      ontap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_)=> CategoriaModule(CategoriasEnum.comidas)));
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
                  stream: controller.homeOut,
                  builder: (context, snapshot) {

                    if(snapshot.hasError){
                      return Center(
                        child: Text('Erro ao recarregar dados :('),
                      );
                    }

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

  iniciarAdmob(){
    InterstitialAd.load(
      adUnitId: Platform.isIOS ? 'ca-app-pub-3652623512305285/6827768936' : 'ca-app-pub-3652623512305285/3678863352',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          // Keep a reference to the ad so you can show it later.
          setState(() {
            this._interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error');
        },
      ));
  }
}