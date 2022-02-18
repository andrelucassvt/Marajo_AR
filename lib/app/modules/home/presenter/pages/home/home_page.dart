import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/home_enable_filter/home_enable_filter_cubit.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/home_recomendados/home_recomendados_cubit.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/home_recomendados/home_recomendados_state.dart';
import 'package:marajoar/app/modules/home/presenter/pages/categoria/categoria_module.dart';
import 'package:marajoar/app/shared/data/get_local_language.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/widgets/card_widget.dart';
import 'package:marajoar/app/shared/widgets/icon_categoria.dart';
import 'package:marajoar/generated/l10n.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeCubit = Modular.get<HomeRecomendadosCubit>();
  final homeEnableFilterCubit = Modular.get<HomeEnableFilterCubit>();

  InterstitialAd _interstitialAd;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 30), () {
      //TODO: Ativar propaganda
      //_interstitialAd.show();
    });
  }

  @override
  void didChangeDependencies() {
    homeCubit.getRecomendados(context);
    iniciarAdmob();
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    homeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider = LocaleProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Marajó AR',
          style: TextStyle(
            fontSize: 30, 
            fontWeight: FontWeight.bold, 
            color: Colors.black
          ),
        ),
        actions: [
          Tooltip(
            message: GetLocalLanguage.getLanguage(context) == LanguagesApp.en
              ? 'Search'
              : 'Pesquisa',
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/search'),
              iconSize: 40,
              color: Colors.black,
              icon: Icon(Icons.search),
            ),
          ),
          Tooltip(
            message: GetLocalLanguage.getLanguage(context) == LanguagesApp.en
              ? 'Filter'
              : 'Filtro',
            child: IconButton(
              onPressed: () => homeEnableFilterCubit.enableFilter(),
              iconSize: 40,
              color: Colors.black,
              icon: Icon(Icons.filter_list),
            ),
          ),
          Tooltip(
            message: GetLocalLanguage.getLanguage(context) == LanguagesApp.en
              ? 'About'
              : 'Sobre',
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/sobre'),
              iconSize: 40,
              color: Colors.black,
              icon: Icon(Icons.info_outline),
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<HomeEnableFilterCubit, HomeEnableFilterState>(
                bloc: homeEnableFilterCubit,
                builder: (context, state) {
                  if (state is HomeEnableFilterTrue) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconWidgetCategoria(
                          nome: localeProvider.HomeBodyIconsCategoriaArtesanato,
                          icone: '🏺',
                          ontap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => CategoriaModule(CategoriasEnum.artesanato)));
                          }
                        ),
                        IconWidgetCategoria(
                          nome: localeProvider.HomeBodyIconsCategoriaFauna,
                          icone: '🐃',
                          ontap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => CategoriaModule(CategoriasEnum.animais)));
                          }
                        ),
                        IconWidgetCategoria(
                          nome: localeProvider.HomeBodyIconsCategoriaComidas,
                          icone: '🥘',
                          ontap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => CategoriaModule(CategoriasEnum.comidas)));
                          }
                        ),
                      ],
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
              Expanded(
                child: BlocBuilder<HomeRecomendadosCubit, HomeRecomendadosState>(
                  bloc: homeCubit,
                  builder: (context, state) {
                    if (state is HomeRecomendadosFailure) {
                      return Center(
                        child: Text('Erro ao recarregar dados :('),
                      );
                    }

                    if (state is HomeRecomendadosLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is HomeRecomendadosSucess) {
                      List<ArModel> dados = state.list;
                      return ListView.builder(
                        itemCount: dados.length,
                        padding: EdgeInsets.only(bottom: 50),
                        itemBuilder: (context, index) {
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

  iniciarAdmob() {
    InterstitialAd.load(
        adUnitId: Platform.isIOS
            ? 'ca-app-pub-3652623512305285/6827768936'
            : 'ca-app-pub-3652623512305285/3678863352',
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
