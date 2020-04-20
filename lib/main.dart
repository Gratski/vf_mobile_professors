import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:professors/locale/common_locales.dart';
import 'package:professors/locale/personal_transactions_locales.dart';

import 'locale/dashboard_locales.dart';
import 'locale/personal_details_locales.dart';
import 'locale/profile_details_locales.dart';
import 'locale/settings_locales.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          // app specific localizations
          CommonLocalizationsDelegate(), // Common Labels
          ProfileLocalizationsDelegate(), // Personal Profile Settings Screen
          ProfileDetailsLocalizationsDelegate(), // Profile Details Screen
          PersonalTransactionsLocalizationsDelegate(), // Personal Transactions Screen
          PersonalDetailsLocalizationsDelegate(), // Personal Details Screen
          DashboardLocalizationsDelegate(), // Dashboard Details Screen

          // non-app specific localizations
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('pt', '')
        ],
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Test'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(ProfileLocalizations.of(context).paymentsMenuLabel),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
