import 'package:flutter/material.dart';
import 'package:marajoar/app/core/colors.dart';
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
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}