import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:professors/screens/classes/classes.screen.dart';
import 'package:professors/screens/dashboard.dart';
import 'package:professors/screens/home.dart';
import 'package:professors/screens/profile/profile.screen.dart';
import 'package:professors/screens/settings/settings.dart';
import 'package:professors/screens/settings/personal_details/settings_personal_details.dart';
import 'package:professors/screens/settings/payments/settings_transactions_history.dart';
import 'package:professors/styles/colors.dart';
import 'localization/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          // app specific localizations
          AppLocalizations.delegate,

          // non-app specific localizations
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'),
          const Locale('pt')
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for(var supportedLocale in supportedLocales) {
            if(supportedLocale.languageCode == locale.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },

        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: AppColors.textInputBorder),
            labelStyle: TextStyle(color: AppColors.textInputBorder),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.textInputBorder, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textInputBorder, width: 1.0),
            ),
          ),
          canvasColor: AppColors.bgMainColor
        ),
        home: HomeScreen());
  }
}