import 'package:flutter/material.dart';
import 'package:professors/l10n/profile_details/messages_all.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class ProfileDetailsLocalizations {

  static Future<ProfileDetailsLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then( (bool _) {
      Intl.defaultLocale = localeName;
      return ProfileDetailsLocalizations();
    });
  }

  static ProfileDetailsLocalizations of(BuildContext ctx) {
    return Localizations.of(ctx, ProfileDetailsLocalizations);
  }

  // Links
  String get viewAsStudentLinkLabel {
    return Intl.message(
        'Add Language',
        name: 'viewAsStudentLinkLabel',
        desc: 'The label to view as student link'
    );
  }

  // Labels
  String get greetingLabel {
    return Intl.message(
        'Hello',
        name: 'greetingLabel',
        desc: 'The label Greeting'
    );
  }
  String get greetingIAmLabel {
    return Intl.message(
        'I am',
        name: 'greetingIAmLabel',
        desc: 'The label Greeting I am'
    );
  }

  String get aboutLabel {
    return Intl.message(
        'About',
        name: 'aboutLabel',
        desc: 'The label About Section Header'
    );
  }

  String get quoteLabel {
    return Intl.message(
        'Quote',
        name: 'quoteLabel',
        desc: 'The label Quote Section Header'
    );
  }

  String get teachesLabel {
    return Intl.message(
        'Teaches...',
        name: 'teachesLabel',
        desc: 'The label Teaches Section Header'
    );
  }

  String get commentsLabel {
    return Intl.message(
        'Comments...',
        name: 'commentsLabel',
        desc: 'The label Comments Section Header'
    );
  }
  String get viewAllCommentsLinkLabel {
    return Intl.message(
        'View All Comments',
        name: 'viewAllCommentsLinkLabel',
        desc: 'The label View All Comments Link'
    );
  }

}

class ProfileDetailsLocalizationsDelegate extends LocalizationsDelegate<ProfileDetailsLocalizations> {

  @override
  bool isSupported(Locale locale) {
    return ['en','pt'].contains(locale.languageCode);
  }

  @override
  Future<ProfileDetailsLocalizations> load(Locale locale) {
    return ProfileDetailsLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<ProfileDetailsLocalizations> old) {
    return false;
  }

}