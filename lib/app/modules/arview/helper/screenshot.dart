import 'package:flutter/material.dart';
import 'package:marajoar/generated/l10n.dart';
import 'package:native_screenshot/native_screenshot.dart';

class Screenshot {

  static Future<void> screenshot(BuildContext context) async {
    LocaleProvider _localeProvider = LocaleProvider.of(context);
    String path = await NativeScreenshot.takeScreenshot();
    if (path == null || path.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_localeProvider.ArViewControllerErrorScreenshotText),
          backgroundColor: Colors.red,
        )
      );
      return;
    } 

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Text(_localeProvider.ArViewControllerSucessScreenshotText)
      )
    );
  }
}