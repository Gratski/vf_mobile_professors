import 'package:flutter/material.dart';
import 'package:professors/l10n/common/messages_all.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class CommonLocalizations {

  static Future<CommonLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then( (bool _) {
      Intl.defaultLocale = localeName;
      return CommonLocalizations();
    });
  }

  static CommonLocalizations of(BuildContext ctx) {
    return Localizations.of(ctx, CommonLocalizations);
  }

  // Actions
  String get editLinkLabel {
    return Intl.message(
        'Edit',
        name: 'editLinkLabel',
        desc: 'The label to edit link'
    );
  }

  String get saveLinkLabel {
    return Intl.message(
        'Save',
        name: 'saveLinkLabel',
        desc: 'The label to save link'
    );
  }

  String get addLanguageLinkLabel {
    return Intl.message(
        'Add Language',
        name: 'addLanguageLinkLabel',
        desc: 'The label to add language link'
    );
  }

  // Labels
  String get helloLabel {
    return Intl.message(
        'Hello',
        name: 'helloLabel',
        desc: 'The Hello Label'
    );
  }

  String get classLabel {
    return Intl.message(
        'Class',
        name: 'classLabel',
        desc: 'The Class Label'
    );
  }



}

class CommonLocalizationsDelegate extends LocalizationsDelegate<CommonLocalizations> {

  @override
  bool isSupported(Locale locale) {
    return ['en','pt'].contains(locale.languageCode);
  }

  @override
  Future<CommonLocalizations> load(Locale locale) {
    return CommonLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<CommonLocalizations> old) {
    return false;
  }

}