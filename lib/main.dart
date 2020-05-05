import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:professors/localization/localization.config.dart';
import 'package:professors/visual/screens/authenticated/home.dart';
import 'package:professors/visual/screens/permitted/auth/login.screen.dart';
import 'package:professors/visual/screens/permitted/auth/registration.screen.dart';
import 'package:professors/visual/screens/permitted/splash/SplashPagesScreen.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'globals/app.config.dart';
import 'localization/app_localizations.dart';

void main({String env}) async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool showedOnboarding = prefs.getBool("showedOnboarding");
  bool isNew = showedOnboarding == null || !showedOnboarding;

  String authToken = prefs.getString("auth-token");
  bool hasToken = authToken != null && authToken.isNotEmpty;

  // load our config
  //uncomment for prod "prod"
  final config = await AppConfig.forEnvironment(env);

  runApp(MyApp(isNew, hasToken));
}

class MyApp extends StatelessWidget {

  bool isNew;
  bool hasToken;
  MyApp(this.isNew, this.hasToken);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        routes: {
          '/splash': (context) => SplashPagesScreen(),
          '/login': (context) => LoginScreen(),
          '/registration': (context) => RegistrationScreen(),
          '/home': (context) => HomeScreen()
        },
        initialRoute: (isNew) ? '/splash' : (hasToken) ? '/home' : '/registration',

        localizationsDelegates: [
          // app specific localizations
          AppLocalizations.delegate,

          // non-app specific localizations
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: LocalizationConfig.supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) {
          for(var supportedLocale in supportedLocales) {
            if(supportedLocale.languageCode == locale.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },

        theme: ThemeData(
          textTheme: TextTheme(
            subhead: new TextStyle(color: AppColors.fontColor),
          ),
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
        )
    );
  }
}