import 'package:flutter/material.dart';
import 'package:marajoar/generated/l10n.dart';

class ShowDialogErrorArcore extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Atenção',style: TextStyle(color: Colors.red)),
      content: Text('Seu dispositivo não é compativel com a realidade aumentada'),
      actions: [
        TextButton(
          onPressed: ()=> Navigator.of(context).pop(), 
          child: Text('Sair',style: TextStyle(color: Colors.blue),)
        )
      ],
    );
  }
}