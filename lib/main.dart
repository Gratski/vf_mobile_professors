import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:professors/screens/home.dart';
import 'package:professors/screens/permitted/splash/SplashPagesScreen.dart';
import 'package:professors/styles/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'localization/app_localizations.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool showedOnboarding = prefs.getBool("showedOnboarding");
  bool isNew = showedOnboarding == null || !showedOnboarding;

  runApp(MyApp(isNew));
}

class MyApp extends StatelessWidget {

  bool isNew;
  MyApp(this.isNew);

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
            counterStyle: TextStyle(color: AppColors.fontColor),
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
        home: (isNew) ? SplashPagesScreen() : HomeScreen()
    );
  }
}