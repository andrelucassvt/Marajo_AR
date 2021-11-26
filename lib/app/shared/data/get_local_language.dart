import 'package:flutter/material.dart';

class GetLocalLanguage {

  static String getLanguage(BuildContext context) {
    return Localizations.localeOf(context).toString();
  }
}