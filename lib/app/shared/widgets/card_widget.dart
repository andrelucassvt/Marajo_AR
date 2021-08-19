import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/pages/detalhes/detalhes_page.dart';
import 'package:marajoar/app/shared/models/ar_model.dart';

class CardWidget extends StatelessWidget {
  final ArModel model;
  CardWidget(this.model);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: model.nome,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => DetalhesPage(model))
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(model.foto)
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   Padding(
                     padding: const EdgeInsets.only(top: 140),
                     child: Container(
                       padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(15),
                           topRight: Radius.circular(15)
                         )
                       ),
                       child: AutoSizeText(
                         model.nome,
                         maxLines: 1,
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           fontSize: 20,
                           color: Colors.black,
                           fontWeight: FontWeight.bold
                         ),
                       ),
                     ),
                   )
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}