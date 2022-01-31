import 'dart:io';

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/arview/presenter/pages/arcore/arcore_page.dart';
import 'package:marajoar/app/modules/arview/presenter/pages/arkit/arkit_page.dart';
import 'package:marajoar/app/modules/home/presenter/widgets/card_image.dart';
import 'package:marajoar/app/shared/core/colors.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/modules/arview/presenter/widgets/show_dialog_widget.dart';
import 'package:marajoar/app/shared/widgets/border_text.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: widget.model.nome,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.model.foto)
                        )
                      ),   
                    )
                  ),
                  Positioned(
                    left: 15,
                    top: 15,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32)
                      ),
                      child: IconButton(
                        alignment: Alignment.centerRight,
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        color: Colors.black,
                        icon: Icon(Icons.arrow_back_ios)
                      ),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: 15,
                    child: BorderTextMarajo(
                      child: Text(
                        localeProvider.HomePagesDatalhesAppBarTitle,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: BorderTextMarajo(
                      child: Text(
                        widget.model.nome,
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          inherit: false,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),
              Text(
                localeProvider.HomePagesDatalhesBodyDescricao,
                style: TextStyle(
                  fontSize: 30,
                )
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
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
                        padding: EdgeInsets.only(bottom: 10),
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
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text(localeProvider.HomePagesDatalhesFloatingButton),
        onPressed: Platform.isIOS
          ? () => Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ArkitPage(widget.model)))
          : () async {
            if (await ArCoreController.checkArCoreAvailability() == false) {
              return showDialog(
                context: context, 
                builder: (_)=> ShowDialogWidget(
                  title: localeProvider.DialogTitle,
                  content: localeProvider.ArcoreErrorMessageContent,
                ),
              );
            } 
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ArcorePage(widget.model)));
          }
      ),
    );
  }
}