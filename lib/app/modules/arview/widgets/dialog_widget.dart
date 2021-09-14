import 'package:flutter/material.dart';
import 'package:marajoar/generated/l10n.dart';

class ShowMessageArview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider = LocaleProvider.of(context);
    return AlertDialog(
      title: Text(localeProvider.ArviewWidgetsDialogTitle,style: TextStyle(color: Colors.red)),
      content: Text(localeProvider.ArViewWidgetsDialogTextContent),
      actions: [
        TextButton(
          onPressed: ()=> Navigator.of(context).pop(), 
          child: Text(localeProvider.WidgetsButtonNext,style: TextStyle(color: Colors.blue),)
        )
      ],
    );
  }
}