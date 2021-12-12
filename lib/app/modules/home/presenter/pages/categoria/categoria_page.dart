import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:marajoar/app/modules/home/domain/dto/categoria_dto.dart';
import 'package:marajoar/app/modules/home/presenter/pages/categoria/categoria_controller.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/widgets/card_widget.dart';
import 'package:marajoar/generated/l10n.dart';

class CategoriaPage extends StatefulWidget {
  final CategoriasEnum categoriasEnum;
  const CategoriaPage(this.categoriasEnum);

  @override
  _CategoriaPageState createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  
  AdWidget adWidget;
  final BannerAd myBanner = BannerAd(
    adUnitId: Platform.isIOS ? 'ca-app-pub-3652623512305285/2053989791' : 'ca-app-pub-3652623512305285/1107829897',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  final controller = Modular.get<CategoriaController>();
  
  String get title {
    switch (widget.categoriasEnum) {
      case CategoriasEnum.artesanato:
        return LocaleProvider.of(context).HomeBodyIconsCategoriaArtesanato;
      case CategoriasEnum.animais:
        return LocaleProvider.of(context).HomeBodyIconsCategoriaFauna;
      case CategoriasEnum.comidas:
        return LocaleProvider.of(context).HomeBodyIconsCategoriaComidas;
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      controller.selectCategoriaList(CategoriaDto(
        categoriasEnum: widget.categoriasEnum,
        context: context
      ));
      myBanner.load();
      adWidget = AdWidget(ad: myBanner);
    });
  }
  bool enableHero = true;

  @override
  void dispose() {
    controller.categoriaController.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Platform.isIOS
            ? Icons.arrow_back_ios
            : Icons.keyboard_backspace
          ),
          onPressed: (){
            setState(() {
              enableHero = false;
            });
            Navigator.of(context).pop();
          },
        ),
      ),
      body: StreamBuilder<List<ArModel>>(
        stream: controller.categoriaOut,
        builder: (context, snapshot) {

          if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar categoria :('),
            );
          }
          
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<ArModel> dados = snapshot.data;

          if (dados.isEmpty) {
            return Center(
              child: Text('Sem dados cadastrados',style: TextStyle(fontSize: 20)),
            );
          }

          return ListView(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: dados.length,
                itemBuilder: (context,index){
                  return HeroMode(
                    enabled: enableHero,
                    child: CardWidget(dados[index]));
                }
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  child: adWidget,
                  width: myBanner.size.width.toDouble(),
                  height: myBanner.size.height.toDouble(),
                ),
              )
            ],
          );
        }
      )
    );
  }
}