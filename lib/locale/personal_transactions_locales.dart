import 'package:flutter/material.dart';
import 'package:professors/l10n/profile_details/messages_all.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class PersonalTransactionsLocalizations {

  static Future<PersonalTransactionsLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then( (bool _) {
      Intl.defaultLocale = localeName;
      return PersonalTransactionsLocalizations();
    });
  }

  static PersonalTransactionsLocalizations of(BuildContext ctx) {
    return Localizations.of(ctx, PersonalTransactionsLocalizations);
  }

  // Links
  String get transactionsHistoryHeader {
    return Intl.message(
        'Transactions History',
        name: 'transactionsHistoryHeader',
        desc: 'The label Transactions History Header'
    );
  }

  String get currentMonthTabLabel {
    return Intl.message(
        'This Month',
        name: 'currentMonthTabLabel',
        desc: 'The label for This Month Tab'
    );
  }

  String get totalMonthsTabLabel {
    return Intl.message(
        'Total',
        name: 'totalMonthsTabLabel',
        desc: 'The label Total Months Tab'
    );
  }

  String get paymentItemLabel {
    return Intl.message(
        'Payment',
        name: 'paymentItemLabel',
        desc: 'The label Payment Item Label'
    );
  }

}

class PersonalTransactionsLocalizationsDelegate extends LocalizationsDelegate<PersonalTransactionsLocalizations> {

  @override
  bool isSupported(Locale locale) {
    return ['en','pt'].contains(locale.languageCode);
  }

  @override
  Future<PersonalTransactionsLocalizations> load(Locale locale) {
    return PersonalTransactionsLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<PersonalTransactionsLocalizations> old) {
    return false;
  }

}