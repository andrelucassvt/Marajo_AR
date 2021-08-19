import 'package:flutter/material.dart';

class ShowMessageArview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Atenção',style: TextStyle(color: Colors.red)),
      content: Text('Certifique-se que esteja em um local plano \nAguarde os pontos brancos e clique para ver o objeto'),
      actions: [
        TextButton(
          onPressed: ()=> Navigator.of(context).pop(), 
          child: Text('Continuar',style: TextStyle(color: Colors.blue),)
        )
      ],
    );
  }
}