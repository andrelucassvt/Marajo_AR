import 'package:flutter/material.dart';
import 'package:marajoar/app/core/colors.dart';

class SobrePage extends StatefulWidget {
  @override
  SobrePageState createState() => SobrePageState();
}
class SobrePageState extends State <SobrePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre o Marajó AR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}