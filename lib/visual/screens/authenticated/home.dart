import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/nav.constants.dart';
import 'package:professors/visual/screens/authenticated/abstract_authenticated_stfl.screen.dart';
import 'package:professors/visual/screens/authenticated/classes/classes.screen.dart';
import 'package:professors/visual/screens/authenticated/settings/settings.dart';

class HomeScreen extends AuthenticatedStatefulScreen {

  final navConstants = NavConstants();

  List<Widget> screens = [
    SettingsScreen(),
    ClassesScreen(),
  ];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AfterInitMixin<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    widget.authenticate(context);

    return Scaffold(
      body: Observer(
        builder: (_) => widget.screens[navStore.bottomNavigationIndex],
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return BottomNavigationBar(
              iconSize: 18.0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedIconTheme: IconThemeData(color: Colors.grey),
              selectedIconTheme: IconThemeData(color: Colors.red),
              //showUnselectedLabels: true,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.red,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.slidersH),
                  title: Text(AppLocalizations.of(context).translate(widget.navConstants.settingsLabel)),
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.playCircle),
                  title: Text(AppLocalizations.of(context).translate(widget.navConstants.classesLabel)),
                ),
              ],
              currentIndex: navStore.bottomNavigationIndex,
              onTap: (value) {
                navStore.bottomNavigationTabIndexChangedAction(value);
              });
        },
      ),
    );
  }

  @override
  void didInitState() {
    restServices.getLanguageProfileService().getAvailableProfileLanguages(context);
    restServices.getLanguageProfileService().getExistingProfileLanguages(context);
    restServices.getUserService().getUserPersonalDetails(context);
    restServices.getUserService().getUserNotificationPreferences(context);
    restServices.getWalletService().getPaymentMethods(context);
    restServices.getWalletService().getCurrencies(context);
    restServices.getWalletService().getUserCurrency(context);
  }
}
