import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:marajoar/app/shared/core/text.dart';
import 'package:marajoar/app/shared/data/get_local_language.dart';
import 'package:marajoar/generated/l10n.dart';
import 'dart:io';

import 'package:share/share.dart';
class SobrePage extends StatefulWidget {
  @override
  SobrePageState createState() => SobrePageState();
}
class SobrePageState extends State <SobrePage> {

  AdWidget adWidget;
  final BannerAd myBanner = BannerAd(
    adUnitId: Platform.isIOS ? 'ca-app-pub-3652623512305285/9825004345' : 'ca-app-pub-3652623512305285/3582752327',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );
  @override
  void initState() {
    super.initState();
    myBanner.load();
    adWidget = AdWidget(ad: myBanner);
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    LocaleProvider locale = LocaleProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.HomePagesSobreAppBarTitle),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Share.share(TextShare.textoShare(context)),
            iconSize: 35, 
            icon: Icon(Platform.isAndroid ? Icons.share : Icons.ios_share_sharp),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/buffaloSobre.png')
                )
              ),
            ),
            Text(
              GetLocalLanguage.getLanguage(context) == 'en' ? textoEN : textoBR,
              style: TextStyle(
                fontSize: 20
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: adWidget,
              width: myBanner.size.width.toDouble(),
              height: myBanner.size.height.toDouble(),
            )
          ],
        ),
      ),
    );
  }
}

String textoBR = """
Marajó AR (Marajó em realidade aumentada) tem como objetivo levar um pouco da cultura marajoara através da realidade aumentada. A ideia surgiu para dar mais visibilidade à maior ilha fluviomarítima do Brasil e do Mundo. 

O projeto foi desenvolvido a todo esforço (sem apoio político) por duas pessoas que amam a Ilha do Marajó, terra onde nasceram e cresceram.
As duas pessoas por trás desse projeto são:
André Salvador, analista de sistemas.
Wendel Alves, estudante de engenharia de petróleo.

Esse projeto teve apoio indispensável do professor universitário da UNAMA (Universidade da Amazônia) Alan Marciel de Souza. O professor acreditou na ideia e ajudou a registrar o sistema no INPI (Instituto nacional da propriedade industrial).
""";

String textoEN = """
Marajó AR (Marajó in augmented reality) aims to take some of the Marajoara culture through augmented reality. The idea arose to give more visibility to the largest fluvio-maritime island in Brazil and in the world.

The project was developed with every effort (without political support) by two people who love Ilha do Marajó, the land where they were born and raised.
The two people behind this project are:
André Salvador, systems analyst.
Wendel Alves, petroleum engineering student.

This project had the indispensable support of the university professor at UNAMA (University of the Amazon) Alan Marciel de Souza. The professor believed in the idea and helped to register the system with the INPI (National Institute of Industrial Property).
""";