import 'package:flutter/material.dart';
import 'package:marajoar/generated/l10n.dart';

class TextShare {
  static String textoShare(BuildContext context) {
    LocaleProvider localeProvider = LocaleProvider.of(context);
    String textoShare = '''
${localeProvider.CoreTextShareTitulo}

${localeProvider.CoreTextShareDownload}

Apple Store:
https://apps.apple.com/us/app/marajó-ar/id1584863516

Google play: 
https://play.google.com/store/apps/details?id=com.andre.marajoar
''';

    return textoShare;
  }
}
