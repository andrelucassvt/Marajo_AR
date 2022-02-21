import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:marajoar/app/modules/home/domain/dto/categoria_dto.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/categoria_filter/categoria_filter_cubit.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/categoria_filter/categoria_filter_state.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/widgets/card_widget.dart';
import 'package:marajoar/generated/l10n.dart';

class CategoriaPage extends StatefulWidget {

  @override
  _CategoriaPageState createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  // variavel de Parametros passados para a tela via rota nomeada
  var params;
  
  AdWidget adWidget;
  final BannerAd myBanner = BannerAd(
    adUnitId: Platform.isIOS ? 'ca-app-pub-3652623512305285/2053989791' : 'ca-app-pub-3652623512305285/1107829897',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  final controller = GetIt.I.get<CategoriaFilterCubit>();

  
  String get title {
    switch (params) {
      case CategoriasEnum.artesanato:
        return LocaleProvider.of(context).HomeBodyIconsCategoriaArtesanato;
      case CategoriasEnum.animais:
        return LocaleProvider.of(context).HomeBodyIconsCategoriaFauna;
      case CategoriasEnum.comidas:
        return LocaleProvider.of(context).HomeBodyIconsCategoriaComidas;
    }
  }

  bool enableHero = true;

  @override
  void initState() {
    super.initState();
    myBanner.load();
    adWidget = AdWidget(ad: myBanner);
  }

  @override
  void didChangeDependencies() {
    params = ModalRoute.of(context).settings.arguments as CategoriasEnum;
    controller.getCategoriaList(CategoriaDto(
      categoriasEnum: params,
      context: context
    ));
    super.didChangeDependencies();
  }


  @override
  void dispose() {
    myBanner.dispose();
    controller.close();
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
      body: BlocBuilder<CategoriaFilterCubit, CategortiaFilterState>(
        bloc: controller,
        builder: (context, state) {

          if (state is CategortiaFilterFailure) {
            return Center(
              child: Text('Erro ao carregar categoria :('),
            );
          }
          
          if (state is CategortiaFilterLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CategortiaFilterSucess) {
            List<ArModel> dados = state.list;
            return ListView(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: 15
                  ),
                  itemCount: dados.length,
                  itemBuilder: (context,index){
                    return HeroMode(
                      enabled: enableHero,
                      child: CardWidget(dados[index]));
                  }
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
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
          return Container();
        }
      )
    );
  }
}