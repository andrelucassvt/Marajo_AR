import 'package:flutter/material.dart';
import 'package:marajoar/generated/l10n.dart';

class ShowDialogWidget extends StatelessWidget {
  final String title;
  final String content;
  ShowDialogWidget({
    @required this.title,
    @required this.content,
  });
  @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider = LocaleProvider.of(context);
    return AlertDialog(
      title: Text(title,style: TextStyle(color: Colors.red)),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: ()=> Navigator.of(context).pop(), 
          child: Text(localeProvider.DialogButtonNext,style: TextStyle(color: Colors.red))
        )
      ],
    );
  }
}