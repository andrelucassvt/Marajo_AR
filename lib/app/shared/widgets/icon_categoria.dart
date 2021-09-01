import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:marajoar/app/core/colors.dart';

class IconWidgetCategoria extends StatelessWidget {
  final String nome;
  final String icone;
  final Color iconeColor;
  final Color containerColor;
  final VoidCallback ontap;

  IconWidgetCategoria(
    {
      @required this.nome, 
      @required this.icone, 
      @required this.containerColor, 
      @required this.iconeColor,
      @required this.ontap
      }
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> this.ontap(),
      child: Container(
        width: 100,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primaryColor,width: 1)
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                icone,
                style: TextStyle(
                  fontSize: 40
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: AutoSizeText(
                  nome,
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}