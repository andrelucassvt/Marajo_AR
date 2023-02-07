import 'package:flutter/material.dart';

enum LanguagesApp {
  br,
  en,
}

class GetLocalLanguage {
  static LanguagesApp getLanguage(BuildContext context) {
    var result = Localizations.localeOf(context).toString();
    if (result == 'en') {
      return LanguagesApp.en;
    }
    return LanguagesApp.br;
  }
}
