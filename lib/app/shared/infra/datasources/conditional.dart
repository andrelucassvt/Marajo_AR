import 'package:flutter/material.dart';

class ConditionalLanguage {

  static String getLanguage(BuildContext context) {
    return Localizations.localeOf(context).toString();
  }
}