import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marajoar/app/core/colors.dart';
import 'package:marajoar/app/modules/arview/arcore/arcore_page.dart';
import 'package:marajoar/app/modules/arview/arkit/arkit_page.dart';
import 'package:marajoar/app/shared/models/ar_model.dart';

class DetalhesPage extends StatefulWidget {
  final ArModel model;
  DetalhesPage(this.model);
  @override
  DetalhesPageState createState() => DetalhesPageState();
}
class DetalhesPageState extends State <DetalhesPage> {
  
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: widget.model.nome,
            child: Container(
              height: MediaQuery.of(context).size.height * .4,
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
                'Descrição',
                style: TextStyle(fontSize: 30)
              ),
            ),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              children: [
                Text(
                  widget.model.descricao,
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Realidade aumentada'),
        backgroundColor: primaryColor,
        onPressed: (){
          if (Platform.isIOS) {            
            return Navigator.of(context).push(
              MaterialPageRoute(builder: (_)=> ArkitPage())
            );
          }
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_)=> ArcorePage(widget.model))
          );
        },
      ),
    );
  }
}