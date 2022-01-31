import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/home_recomendados/home_recomendados_cubit.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/home_recomendados/home_recomendados_state.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/home_tutorial/home_tutorial_cubit.dart';
import 'package:marajoar/app/modules/home/presenter/pages/categoria/categoria_module.dart';
import 'package:marajoar/app/shared/core/text.dart';
import 'package:marajoar/app/shared/data/get_local_language.dart';
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

  final homeCubit = Modular.get<HomeRecomendadosCubit>();
  final homeTutorial = Modular.get<HomeTutorialCubit>();

  InterstitialAd _interstitialAd;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 30),(){
     // _interstitialAd.show();
    });
  }

  @override
  void didChangeDependencies() {
    homeCubit.getRecomendados(context);
    homeTutorial.chamarTutorial(context);
    iniciarAdmob();
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    homeCubit.close();
    homeTutorial.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider = LocaleProvider.of(context);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 10,right: 15,left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Marajó AR',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Tooltip(
                    message: GetLocalLanguage.getLanguage(context) == LanguagesApp.en ? 'Search' : 'Pesquisa',
                    child: IconButton(
                      onPressed: () => Navigator.pushNamed(context, '/search'),
                      iconSize: 40,
                      icon: Icon(Icons.search),
                    ),
                  ),
                  PopupMenuButton<CategoriasEnum>(
                    tooltip: GetLocalLanguage.getLanguage(context) == LanguagesApp.en ? 'Filter' : 'Filtro',
                    icon: Icon(Icons.filter_list),
                    iconSize: 40,
                    onSelected: (CategoriasEnum enuns) => Navigator.of(context).push(MaterialPageRoute(builder: (_)=> CategoriaModule(enuns))),
                    itemBuilder: (context) => <PopupMenuEntry<CategoriasEnum>> [
                      PopupMenuItem<CategoriasEnum>(
                        value: CategoriasEnum.artesanato,
                        child: Text('🏺 ${localeProvider.HomeBodyIconsCategoriaArtesanato}'),
                      ),
                      PopupMenuItem<CategoriasEnum>(
                        value: CategoriasEnum.animais,
                        child: Text('🐃 ${localeProvider.HomeBodyIconsCategoriaFauna}'),
                      ),
                      PopupMenuItem<CategoriasEnum>(
                        value: CategoriasEnum.comidas,
                        child: Text('🥘 ${localeProvider.HomeBodyIconsCategoriaComidas}'),
                      ),
                    ]
                  ),
                  Tooltip(
                    message: GetLocalLanguage.getLanguage(context) == LanguagesApp.en ? 'About' : 'Sobre',
                    child: IconButton(
                      onPressed: () => Navigator.pushNamed(context, '/sobre'),
                      key: homeTutorial.keyAboutMarajoAR, 
                      iconSize: 40,
                      icon: Icon(Icons.info_outline),
                    ),
                  ),
                ],
              ),

/*
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
                      ontap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_)=> CategoriaModule(CategoriasEnum.artesanato)));
                      }
                    ),
                    IconWidgetCategoria(
                      nome: localeProvider.HomeBodyIconsCategoriaFauna, 
                      icone: '🐃', 
                      ontap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_)=> CategoriaModule(CategoriasEnum.animais)));
                      }
                    ),
                    IconWidgetCategoria(
                      nome: localeProvider.HomeBodyIconsCategoriaComidas, 
                      icone: '🥘', 
                      ontap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_)=> CategoriaModule(CategoriasEnum.comidas)));
                      }
                    ),
                  ],
                ),
              ), */

              Expanded(
                child: BlocBuilder<HomeRecomendadosCubit,HomeRecomendadosState>(
                  bloc: homeCubit,
                  builder: (context, state) {

                    if(state is HomeRecomendadosFailure){
                      return Center(
                        child: Text('Erro ao recarregar dados :('),
                      );
                    }

                    if(state is HomeRecomendadosLoading){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if(state is HomeRecomendadosSucess){
                      List<ArModel> dados = state.list;
                      return ListView.builder(
                        itemCount: dados.length,
                        padding: EdgeInsets.only(
                          bottom: 50
                        ),
                        itemBuilder: (context,index){
                          return CardWidget(dados[index]);
                        },
                      );
                    }
                    return SizedBox.shrink();
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