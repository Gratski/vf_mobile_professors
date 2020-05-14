import 'dart:ui';

import 'package:flutter/cupertino.dart';

class LocalizationConfig {

  static List<Locale> get supportedLocales => [
    const Locale('en'),
    const Locale('pt'),
    const Locale('es'),
    const Locale('fr')
  ];

  static Locale extractCurrentLocale(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    for(var supportedLocale in supportedLocales) {
      if(supportedLocale.languageCode == locale.languageCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }

}