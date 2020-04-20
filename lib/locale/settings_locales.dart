import 'package:flutter/material.dart';
import 'package:professors/l10n/settings/messages_all.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class ProfileLocalizations {

  static Future<ProfileLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then( (bool _) {
      Intl.defaultLocale = localeName;
      return ProfileLocalizations();
    });
  }

  static ProfileLocalizations of(BuildContext ctx) {
    return Localizations.of(ctx, ProfileLocalizations);
  }

  // Header Labels
  String get viewProfileLinkLabel {
    return Intl.message(
        'View Profile',
        name: 'viewProfileLinkLabel',
        desc: 'The label for the View Profile Link'
    );
  }

  // Menu Labels
  String get personalInfoMenuLabel {
    return Intl.message(
        'Personal Details',
        name: 'personalInfoMenuLabel',
        desc: 'The label for the Personal Details Menu Item'
    );
  }
  String get personalInfoMenuLabelHint {
    return Intl.message(
        'Account Configurations',
        name: 'personalInfoMenuLabelHint',
        desc: 'Hint for the label for the Personal Details Menu Item'
    );
  }

  String get notificationsMenuLabel {
    return Intl.message(
        'Notifications',
        name: 'notificationsMenuLabel',
        desc: 'The label for the Notifications Menu Item'
    );
  }

  String get privacyDefinitionsMenuLabel {
    return Intl.message(
        'Privacy Definitions',
        name: 'privacyDefinitionsMenuLabel',
        desc: 'The label for the Privacy Definitions Menu Item'
    );
  }

  String get paymentsMenuLabel {
    return Intl.message(
        'Payments',
        name: 'paymentsMenuLabel',
        desc: 'The label for the Payments Menu Item'
    );
  }

  String get contactUsMenuLabel {
    return Intl.message(
        'Contact us',
        name: 'contactUsMenuLabel',
        desc: 'The label for the Contact Us Menu Item'
    );
  }
  String get contactUsMenuLabelHint {
    return Intl.message(
        'Support',
        name: 'contactUsMenuLabelHint',
        desc: 'The label for the Contact Us Menu Item Hint'
    );
  }

  String get userGuidesMenuLabel {
    return Intl.message(
        'How it works',
        name: 'userGuidesMenuLabel',
        desc: 'The label for the How It Works Menu Item'
    );
  }
  String get userGuidesMenuLabelHint {
    return Intl.message(
        'About',
        name: 'userGuidesMenuLabelHint',
        desc: 'The label for the How It Works Menu Item Hint'
    );
  }

  String get termsAndConditionsMenuLabel {
    return Intl.message(
        'Terms and Conditions',
        name: 'termsAndConditionsMenuLabel',
        desc: 'The label for the Terms of Conditions Menu Item'
    );
  }
}

class ProfileLocalizationsDelegate extends LocalizationsDelegate<ProfileLocalizations> {

  @override
  bool isSupported(Locale locale) {
    return ['en','pt'].contains(locale.languageCode);
  }

  @override
  Future<ProfileLocalizations> load(Locale locale) {
    return ProfileLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<ProfileLocalizations> old) {
    return false;
  }

}