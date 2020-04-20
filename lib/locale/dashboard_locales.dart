import 'package:flutter/material.dart';
import 'package:professors/l10n/dashboard/messages_all.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DashboardLocalizations {

  static Future<DashboardLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then( (bool _) {
      Intl.defaultLocale = localeName;
      return DashboardLocalizations();
    });
  }

  static DashboardLocalizations of(BuildContext ctx) {
    return Localizations.of(ctx, DashboardLocalizations);
  }

  String get panelHeaderLabel {
    return Intl.message(
        'Dashboard',
        name: 'panelHeaderLabel',
        desc: 'The Dashboard Title'
    );
  }

  // STATISTICS
  String get statsGeneralEvaluationLabel {
    return Intl.message(
        'Evaluation',
        name: 'statsGeneralEvaluationLabel',
        desc: 'The evaluation label'
    );
  }

  String get statsCommentsLabel {
    return Intl.message(
        'Comments',
        name: 'statsCommentsLabel',
        desc: 'The Comments label'
    );
  }

  String get statsStudentsLabel {
    return Intl.message(
        'Students',
        name: 'statsStudentsLabel',
        desc: 'The Students label'
    );
  }

  String get statsClassesLabel {
    return Intl.message(
        'Classes',
        name: 'statsClassesLabel',
        desc: 'The Classes label'
    );
  }

  String get statsThisMonthStudentsLabel {
    return Intl.message(
        'Students',
        name: 'statsThisMonthStudentsLabel',
        desc: 'The Total Number of Students label'
    );
  }

  String get statsThisMonthIncomeLabel {
    return Intl.message(
        'Income',
        name: 'statsThisMonthIncomeLabel',
        desc: 'The Number of Students This Month label'
    );
  }

  String get statsThisMonthCancellationsLabel {
    return Intl.message(
        'Cancellations',
        name: 'statsThisMonthCancellationsLabel',
        desc: 'The Number of Cancellation This Month label'
    );
  }

  // GENERAL LABELS
  String get nextClassesHeaderLabel {
    return Intl.message(
        'Next Classes',
        name: 'nextClassesHeaderLabel',
        desc: 'The Next Classes label'
    );
  }
  String get createClassButtonLabel {
    return Intl.message(
        'New Class',
        name: 'createClassButtonLabel',
        desc: 'The New Class Button label'
    );
  }

  String get classificationHeaderLabel {
    return Intl.message(
        'Next Classes',
        name: 'classificationHeaderLabel',
        desc: 'The Classification Header label'
    );
  }
  String get classificationHighDescriptionLabel {
    return Intl.message(
        'Your classification is based on the reviews you receive from your students. Congratulations your classification is ',
        name: 'classificationHighDescriptionLabel',
        desc: 'The New Class Button label'
    );
  }

  String get classificationAverageDescriptionLabel {
    return Intl.message(
        'Your classification is based on the reviews you receive from your students. Your classification is ',
        name: 'classificationAverageDescriptionLabel',
        desc: 'The New Class Button label'
    );
  }

  String get classificationLowDescriptionLabel {
    return Intl.message(
        'Your classification is based on the reviews you receive from your students. Your classification is ',
        name: 'classificationLowDescriptionLabel',
        desc: 'The New Class Button label'
    );
  }

}

class DashboardLocalizationsDelegate extends LocalizationsDelegate<DashboardLocalizations> {

  @override
  bool isSupported(Locale locale) {
    return ['en','pt'].contains(locale.languageCode);
  }

  @override
  Future<DashboardLocalizations> load(Locale locale) {
    return DashboardLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<DashboardLocalizations> old) {
    return false;
  }

}