import 'dart:io';

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:marajoar/app/core/colors.dart';
import 'package:marajoar/app/modules/arview/arcore/arcore_page.dart';
import 'package:marajoar/app/modules/arview/arkit/arkit_page.dart';
import 'package:marajoar/app/modules/home/pages/detalhes/image/image_page.dart';
import 'package:marajoar/app/modules/home/pages/detalhes/widgets/card_image.dart';
import 'package:marajoar/app/modules/home/pages/detalhes/widgets/showDialogErrorArcore.dart';
import 'package:marajoar/app/shared/models/ar_model.dart';
import 'package:marajoar/generated/l10n.dart';

class DetalhesPage extends StatefulWidget {
  final ArModel model;
  DetalhesPage(this.model);
  @override
  DetalhesPageState createState() => DetalhesPageState();
}
class DetalhesPageState extends State <DetalhesPage> {

 @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider = LocaleProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localeProvider.HomePagesDatalhesAppBarTitle),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: widget.model.nome,
            child: Container(
              height: MediaQuery.of(context).size.height * .35,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.model.foto)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    widget.model.nome,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      inherit: false,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                localeProvider.HomePagesDatalhesBodyDescricao,
                style: TextStyle(
                  fontSize: 30,
                )
              ),
            ),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 100
              ),
              children: [
                Text(
                  widget.model.descricao,
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.model.listaImagens.length,
                    itemBuilder: (ctx,index){
                      return CardImage(widget.model.listaImagens[index]);
                    }
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text(localeProvider.HomePagesDatalhesFloatingButton),
        backgroundColor: primaryColor,
        onPressed: Platform.isIOS
          ? () => Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ArkitPage(widget.model)))
          : () async {
            if (await ArCoreController.checkArCoreAvailability() == false) {
              return showDialog(
                context: context, 
                builder: (_)=> ShowDialogErrorArcore());
            } 
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ArcorePage(widget.model)));
          }
      ),
    );
  }
}