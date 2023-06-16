import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:instant_preview_arkit_arcore/instant_preview_arkit_arcore.dart';
import 'package:marajoar/app/features/detalhes/presenter/detalhes_page.dart';
import 'package:marajoar/app/features/home/presenter/cubit/home_cubit.dart';
import 'package:marajoar/app/shared/data/get_local_language.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeCubit = GetIt.I.get<HomeCubit>();

  late InterstitialAd _interstitialAd;
  final quickLook = InstantPreviewArkitArcore();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 30), () {
      //_interstitialAd.show();
    });
  }

  @override
  void didChangeDependencies() {
    homeCubit.getAllModels();
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
    final Orientation deviceOrientation = MediaQuery.of(context).orientation;
    final bool isLandscape = deviceOrientation == Orientation.landscape;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actionsIconTheme: IconThemeData(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white,
        ),
        title: Text(
          'Marajó AR',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        actions: [
          Tooltip(
            message: GetLocalLanguage.getLanguage(context) == LanguagesApp.en
                ? 'About'
                : 'Sobre',
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/sobre'),
              iconSize: 40,
              icon: Icon(Icons.info_outline),
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        left: !isLandscape,
        right: !isLandscape,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
          child: BlocBuilder<HomeCubit, HomeState>(
            bloc: homeCubit,
            builder: (context, state) {
              if (state is HomeFailure) {
                return Center(
                  child: Text('Erro ao recarregar dados :('),
                );
              }

              if (state is HomeLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is HomeSucess) {
                List<ArModel> dados = state.models;
                return ListView.builder(
                  itemCount: dados.length,
                  padding: EdgeInsets.only(
                    bottom: 50,
                  ),
                  scrollDirection:
                      isLandscape ? Axis.horizontal : Axis.vertical,
                  itemBuilder: (context, index) {
                    return CardWidget(
                      model: dados[index],
                      isLandscape: isLandscape,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => DetalhesPage(dados[index]),
                          ),
                        );
                      },
                    );
                  },
                );
              }
              return SizedBox.shrink();
            },
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
