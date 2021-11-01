import 'package:flutter/material.dart';
import 'package:marajoar/generated/l10n.dart';

class ImagePage extends StatefulWidget {
  final String image;
  ImagePage(this.image);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
  LocaleProvider locale = LocaleProvider.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(locale.HomePagesDatalhesAppBarTitle),
        centerTitle: true,
      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.asset(widget.image)),
      ),
    );
  }
}