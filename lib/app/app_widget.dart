import 'package:flutter/material.dart';
import 'package:marajoar/app/core/colors.dart';
import 'package:marajoar/app/modules/home/home_page.dart';
import 'package:marajoar/app/modules/home/pages/sobre/sobre_page.dart';
import 'package:marajoar/generated/l10n.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: primaryColor),
      routes: {
        '/': (_) => HomePage(),
        '/sobre': (_) => SobrePage()
      },
      localizationsDelegates: [
        LocaleProvider.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: LocaleProvider.delegate.supportedLocales,
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context,widget!),
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
        ],
        background: Container(color: Color(0xFFF5F5F5))),
    );
  }
}