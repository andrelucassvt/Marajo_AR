import 'package:flutter/material.dart';
import 'package:marajoar/generated/l10n.dart';

class SobrePage extends StatefulWidget {
  @override
  SobrePageState createState() => SobrePageState();
}
class SobrePageState extends State <SobrePage> {

  @override
  Widget build(BuildContext context) {
    LocaleProvider locale = LocaleProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.HomePagesSobreAppBarTitle),
        centerTitle: true,
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
              textoBR,
              style: TextStyle(
                fontSize: 20
              ),
            ),
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