import 'package:marajoar/generated/l10n.dart';
import 'package:native_screenshot/native_screenshot.dart';
import 'package:flutter/material.dart';

class ArController {
  
  void arScreenshot(BuildContext context) async {
    LocaleProvider _localeProvider = LocaleProvider.of(context);
    String path = await NativeScreenshot.takeScreenshot();
    if (path == null || path.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_localeProvider.ArViewControllerErrorScreenshotText),
          backgroundColor: Colors.red,
        )
      ); // showSnackBar()

      return;
    } // if error

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Text(_localeProvider.ArViewControllerSucessScreenshotText)
      )
    );
  }
}