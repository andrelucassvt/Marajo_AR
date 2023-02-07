import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:marajoar/app/features/home/presenter/home_page.dart';
import 'package:marajoar/app/shared/data/navigation_service.dart';
import 'package:marajoar/generated/l10n.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'features/sobre/presenter/sobre_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData(
          primaryColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light,
          appBarTheme: AppBarTheme(
            color: Colors.red,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.red, foregroundColor: Colors.white),
          iconTheme: IconThemeData(color: Colors.black)),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.red, foregroundColor: Colors.white),
          iconTheme: IconThemeData(
            color: Colors.white,
          )),
      localizationsDelegates: [
        LocaleProvider.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: LocaleProvider.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
      routes: {
        '/': (BuildContext context) => HomePage(),
        '/sobre': (BuildContext context) => SobrePage(),
      },
    );
  }
}
