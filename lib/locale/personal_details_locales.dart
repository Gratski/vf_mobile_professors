import 'package:flutter/material.dart';
import 'package:professors/l10n/personal_details/messages_all.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class PersonalDetailsLocalizations {

  static Future<PersonalDetailsLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then( (bool _) {
      Intl.defaultLocale = localeName;
      return PersonalDetailsLocalizations();
    });
  }

  static PersonalDetailsLocalizations of(BuildContext ctx) {
    return Localizations.of(ctx, PersonalDetailsLocalizations);
  }

  // Links
  String get editPersonalDetailsHeader {
    return Intl.message(
        'Edit Personal Details',
        name: 'editPersonalDetailsHeader',
        desc: 'The title header label'
    );
  }

  // Fields
  String get firstNameLabel {
    return Intl.message(
        'First Name',
        name: 'firstNameLabel',
        desc: 'The first name label'
    );
  }

  String get lastNameLabel {
    return Intl.message(
        'Last Name',
        name: 'lastNameLabel',
        desc: 'The last name label'
    );
  }

  String get genderLabel {
    return Intl.message(
        'Gender',
        name: 'genderLabel',
        desc: 'The gender label'
    );
  }

  String get birthdayLabel {
    return Intl.message(
        'Birthday',
        name: 'birthdayLabel',
        desc: 'The Birthday label'
    );
  }

  String get emailLabel {
    return Intl.message(
        'Email',
        name: 'emailLabel',
        desc: 'The Email label'
    );
  }

  String get phoneNumberLabel {
    return Intl.message(
        'Phone Number',
        name: 'phoneNumberLabel',
        desc: 'The Phone Number label'
    );
  }

  String get vatLabel {
    return Intl.message(
        'VAT',
        name: 'vatLabel',
        desc: 'The VAT label'
    );
  }

  String get nationalityLabel {
    return Intl.message(
        'Nationality',
        name: 'nationalityLabel',
        desc: 'The Nationality label'
    );
  }

}

class PersonalDetailsLocalizationsDelegate extends LocalizationsDelegate<PersonalDetailsLocalizations> {

  @override
  bool isSupported(Locale locale) {
    return ['en','pt'].contains(locale.languageCode);
  }

  @override
  Future<PersonalDetailsLocalizations> load(Locale locale) {
    return PersonalDetailsLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<PersonalDetailsLocalizations> old) {
    return false;
  }

}