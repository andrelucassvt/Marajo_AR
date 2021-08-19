import 'package:flutter/material.dart';
import 'package:marajoar/app/core/colors.dart';

class SobrePage extends StatefulWidget {
  final String title;
  const SobrePage({Key key, this.title = 'Sobre o Marajó AR'}) : super(key: key);
  @override
  SobrePageState createState() => SobrePageState();
}
class SobrePageState extends State <SobrePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}