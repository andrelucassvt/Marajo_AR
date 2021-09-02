import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marajoar/app/core/colors.dart';
import 'package:marajoar/app/modules/arview/arcore/arcore_page.dart';
import 'package:marajoar/app/modules/arview/arkit/arkit_page.dart';
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
  void initState() {
    super.initState();
    print(widget.model.objeto);
  }
 @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider = LocaleProvider.of(context);
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.model.nome),
              background: Image.asset(
                widget.model.foto,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverFillRemaining(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      localeProvider.HomePagesDatalhesBodyDescricao,
                      style: TextStyle(
                        fontSize: 30
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.model.descricao,
                      style: TextStyle(
                        fontSize: 17
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 250,
                      child: ListView.builder(
                        itemCount: widget.model.listaImagens.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Image.asset(widget.model.listaImagens[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
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
          : () => Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ArcorePage(widget.model)))
      ),
    );
  }
}