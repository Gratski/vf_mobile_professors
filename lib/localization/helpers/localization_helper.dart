import 'package:flutter/cupertino.dart';

class LocalizationHelper {

  bool isRunningEnglish(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    return locale.languageCode == 'en' || locale.languageCode == 'EN';
  }

}