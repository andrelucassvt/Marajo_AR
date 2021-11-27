import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/presenter/pages/home/home_page.dart';
import 'package:marajoar/app/modules/home/presenter/pages/sobre/sobre_page.dart';
import 'package:marajoar/app/shared/core/colors.dart';
import 'package:marajoar/generated/l10n.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: primaryColor),
      localizationsDelegates: [
        LocaleProvider.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: LocaleProvider.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context,widget),
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
        ],
        background: Container(color: Color(0xFFF5F5F5))),
    ).modular();
  }
}