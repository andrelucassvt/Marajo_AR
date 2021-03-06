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
              GetLocalLanguage.getLanguage(context) == LanguagesApp.en ? textoEN : textoBR,
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
Maraj?? AR (Maraj?? em realidade aumentada) tem como objetivo levar um pouco da cultura marajoara atrav??s da realidade aumentada. A ideia surgiu para dar mais visibilidade ?? maior ilha fluviomar??tima do Brasil e do Mundo. 

O projeto foi desenvolvido a todo esfor??o (sem apoio pol??tico) por duas pessoas que amam a Ilha do Maraj??, terra onde nasceram e cresceram.
As duas pessoas por tr??s desse projeto s??o:
Andr?? Salvador, analista de sistemas.
Wendel Alves, estudante de engenharia de petr??leo.

Esse projeto teve apoio indispens??vel do professor universit??rio da UNAMA (Universidade da Amaz??nia) Alan Marciel de Souza. O professor acreditou na ideia e ajudou a registrar o sistema no INPI (Instituto nacional da propriedade industrial).
""";

String textoEN = """
Maraj?? AR (Maraj?? in augmented reality) aims to take some of the Marajoara culture through augmented reality. The idea arose to give more visibility to the largest fluvio-maritime island in Brazil and in the world.

The project was developed with every effort (without political support) by two people who love Ilha do Maraj??, the land where they were born and raised.
The two people behind this project are:
Andr?? Salvador, systems analyst.
Wendel Alves, petroleum engineering student.

This project had the indispensable support of the university professor at UNAMA (University of the Amazon) Alan Marciel de Souza. The professor believed in the idea and helped to register the system with the INPI (National Institute of Industrial Property).
""";