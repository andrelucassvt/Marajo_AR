// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class LocaleProvider {
  LocaleProvider();

  static LocaleProvider _current;

  static LocaleProvider get current {
    assert(_current != null,
        'No instance of LocaleProvider was loaded. Try to initialize the LocaleProvider delegate before accessing LocaleProvider.current.');
    return _current;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<LocaleProvider> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = LocaleProvider();
      LocaleProvider._current = instance;

      return instance;
    });
  }

  static LocaleProvider of(BuildContext context) {
    final instance = LocaleProvider.maybeOf(context);
    assert(instance != null,
        'No instance of LocaleProvider present in the widget tree. Did you add LocaleProvider.delegate in localizationsDelegates?');
    return instance;
  }

  static LocaleProvider maybeOf(BuildContext context) {
    return Localizations.of<LocaleProvider>(context, LocaleProvider);
  }

  /// `Click here and learn more about the ''Marajó project in augmented reality''`
  String get HomeTutorialTextAttention {
    return Intl.message(
      'Click here and learn more about the \'\'Marajó project in augmented reality\'\'',
      name: 'HomeTutorialTextAttention',
      desc: '',
      args: [],
    );
  }

  /// `Tap to continue`
  String get HomeTutorialTextTapNext {
    return Intl.message(
      'Tap to continue',
      name: 'HomeTutorialTextTapNext',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get HomeBodyCategoria {
    return Intl.message(
      'Categories',
      name: 'HomeBodyCategoria',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get HomeBodyRecomendados {
    return Intl.message(
      'Recommended',
      name: 'HomeBodyRecomendados',
      desc: '',
      args: [],
    );
  }

  /// `Craftsmanship`
  String get HomeBodyIconsCategoriaArtesanato {
    return Intl.message(
      'Craftsmanship',
      name: 'HomeBodyIconsCategoriaArtesanato',
      desc: '',
      args: [],
    );
  }

  /// `Fauna`
  String get HomeBodyIconsCategoriaFauna {
    return Intl.message(
      'Fauna',
      name: 'HomeBodyIconsCategoriaFauna',
      desc: '',
      args: [],
    );
  }

  /// `Food`
  String get HomeBodyIconsCategoriaComidas {
    return Intl.message(
      'Food',
      name: 'HomeBodyIconsCategoriaComidas',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get HomePagesDatalhesAppBarTitle {
    return Intl.message(
      'Details',
      name: 'HomePagesDatalhesAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get HomePagesDatalhesBodyDescricao {
    return Intl.message(
      'Description',
      name: 'HomePagesDatalhesBodyDescricao',
      desc: '',
      args: [],
    );
  }

  /// `Augmented Reality`
  String get HomePagesDatalhesFloatingButton {
    return Intl.message(
      'Augmented Reality',
      name: 'HomePagesDatalhesFloatingButton',
      desc: '',
      args: [],
    );
  }

  /// `About Marajó AR`
  String get HomePagesSobreAppBarTitle {
    return Intl.message(
      'About Marajó AR',
      name: 'HomePagesSobreAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get WidgetsButtonNext {
    return Intl.message(
      'Next',
      name: 'WidgetsButtonNext',
      desc: '',
      args: [],
    );
  }

  /// `Attention`
  String get ArviewWidgetsDialogTitle {
    return Intl.message(
      'Attention',
      name: 'ArviewWidgetsDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Marajoara buffalo`
  String get CoreDataListBuffaloName {
    return Intl.message(
      'Marajoara buffalo',
      name: 'CoreDataListBuffaloName',
      desc: '',
      args: [],
    );
  }

  /// `The island of Marajó concentrates the largest herd of buffaloes in Brazil. About 3 buffaloes for every 1 inhabitant. Breeding buffalo does not only involve cattle raisers, as the animals provide meat, milk, leather and horns for restaurants, artisans, cheesemakers and other types of establishments. The animals are even used by the police in Soure (Capital do Marajó) in their patrols, something that amazes tourists and reassures the inhabitants.`
  String get CoreDataListBuffaloDesc {
    return Intl.message(
      'The island of Marajó concentrates the largest herd of buffaloes in Brazil. About 3 buffaloes for every 1 inhabitant. Breeding buffalo does not only involve cattle raisers, as the animals provide meat, milk, leather and horns for restaurants, artisans, cheesemakers and other types of establishments. The animals are even used by the police in Soure (Capital do Marajó) in their patrols, something that amazes tourists and reassures the inhabitants.',
      name: 'CoreDataListBuffaloDesc',
      desc: '',
      args: [],
    );
  }

  /// `Pineapple`
  String get CoreDataListAbacaxiName {
    return Intl.message(
      'Pineapple',
      name: 'CoreDataListAbacaxiName',
      desc: '',
      args: [],
    );
  }

  /// `Pará is the largest producer of pineapple in Brazil. The city of Salvaterra is among the three cities that produce the most fruit in Pará. The Brazilian Institute of Geography and Statistics (IBGE) claims it. Planting is the main activity of family farming in the city, responsible for more than 80% of consumption in Belém, with 11 million fruits a year. As part of the regional culture, the village of Condeixa (in Salvaterra) holds the Pineapple Festival every year.`
  String get CoreDataListAbacaxiDesc {
    return Intl.message(
      'Pará is the largest producer of pineapple in Brazil. The city of Salvaterra is among the three cities that produce the most fruit in Pará. The Brazilian Institute of Geography and Statistics (IBGE) claims it. Planting is the main activity of family farming in the city, responsible for more than 80% of consumption in Belém, with 11 million fruits a year. As part of the regional culture, the village of Condeixa (in Salvaterra) holds the Pineapple Festival every year.',
      name: 'CoreDataListAbacaxiDesc',
      desc: '',
      args: [],
    );
  }

  /// `Marajó cheese`
  String get CoreDataListQueijoName {
    return Intl.message(
      'Marajó cheese',
      name: 'CoreDataListQueijoName',
      desc: '',
      args: [],
    );
  }

  /// `Made with buffalo milk, Queijo do Marajó is unique in the world. Winner of the Super Gold at the Queijo do Brasil Award, Queijo do Marajó takes its name from the fresh product traditionally and handcrafted with buffalo milk, for over 200 years, in the Ilha do Marajó archipelago, in the state of Pará .Its production is directly linked to the historical factors of Ilha do Marajó, but over the years, it was possible to improve production methods.`
  String get CoreDataListQueijoDesc {
    return Intl.message(
      'Made with buffalo milk, Queijo do Marajó is unique in the world. Winner of the Super Gold at the Queijo do Brasil Award, Queijo do Marajó takes its name from the fresh product traditionally and handcrafted with buffalo milk, for over 200 years, in the Ilha do Marajó archipelago, in the state of Pará .Its production is directly linked to the historical factors of Ilha do Marajó, but over the years, it was possible to improve production methods.',
      name: 'CoreDataListQueijoDesc',
      desc: '',
      args: [],
    );
  }

  /// `Marajoara vase`
  String get CoreDataListVasoName {
    return Intl.message(
      'Marajoara vase',
      name: 'CoreDataListVasoName',
      desc: '',
      args: [],
    );
  }

  /// `Marajoara art represents the artistic creation of the inhabitants of Ilha de Marajó, Pará, in particular ceramics, considered the oldest ceramic art in Brazil and one of the oldest in the Americas. In ceramics, we can note that there is always a connection with Marajoara art, which is formed by drawings (symbols) that are characterized by zoomorphism (expression of an animal) or anthropomorphism (representation of a person or part of it) and a mixture of the two forms ( anthropozoomorphism).`
  String get CoreDataListVasoDesc {
    return Intl.message(
      'Marajoara art represents the artistic creation of the inhabitants of Ilha de Marajó, Pará, in particular ceramics, considered the oldest ceramic art in Brazil and one of the oldest in the Americas. In ceramics, we can note that there is always a connection with Marajoara art, which is formed by drawings (symbols) that are characterized by zoomorphism (expression of an animal) or anthropomorphism (representation of a person or part of it) and a mixture of the two forms ( anthropozoomorphism).',
      name: 'CoreDataListVasoDesc',
      desc: '',
      args: [],
    );
  }

  /// `The pirarucu is one of the largest freshwater and lacustrine fish in Brazil. It can reach three meters and twenty centimeters and its weight can go up to 330 kg. It usually lives in lakes and rivers with clear and slightly alkaline water with temperatures ranging from 24 to 37 °C. Pirarucu is served as the main component in several typical dishes from Marajó.`
  String get CoreDataListPirarucuDesc {
    return Intl.message(
      'The pirarucu is one of the largest freshwater and lacustrine fish in Brazil. It can reach three meters and twenty centimeters and its weight can go up to 330 kg. It usually lives in lakes and rivers with clear and slightly alkaline water with temperatures ranging from 24 to 37 °C. Pirarucu is served as the main component in several typical dishes from Marajó.',
      name: 'CoreDataListPirarucuDesc',
      desc: '',
      args: [],
    );
  }

  /// `Crab`
  String get CoreDataListCaranguejoName {
    return Intl.message(
      'Crab',
      name: 'CoreDataListCaranguejoName',
      desc: '',
      args: [],
    );
  }

  /// `The mangroves are one of the biggest employers in the city of Soure on Marajó Island, more than 400 families live off the sale and collection of crabs. It is forbidden to capture the crab in its walking period, when the male and female leave their burrows and walk through the mangrove swamp to mate and release the eggs. This walk takes place in the new and full moon phases, when the tide is high. Those who fail to comply with the closed season will have to return live animals to their natural habitat and are subject to the sanctions defined in Law No. 9,605, of February 12, 1998, and Decree No. 6,514, of July 22, 2008.`
  String get CoreDataListCaranguejoDesc {
    return Intl.message(
      'The mangroves are one of the biggest employers in the city of Soure on Marajó Island, more than 400 families live off the sale and collection of crabs. It is forbidden to capture the crab in its walking period, when the male and female leave their burrows and walk through the mangrove swamp to mate and release the eggs. This walk takes place in the new and full moon phases, when the tide is high. Those who fail to comply with the closed season will have to return live animals to their natural habitat and are subject to the sanctions defined in Law No. 9,605, of February 12, 1998, and Decree No. 6,514, of July 22, 2008.',
      name: 'CoreDataListCaranguejoDesc',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<LocaleProvider> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<LocaleProvider> load(Locale locale) => LocaleProvider.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
