import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/visual/screens/authenticated/abstract_authenticated_stfl.screen.dart';
import 'package:professors/visual/screens/authenticated/classes/classes.screen.dart';
import 'package:professors/visual/screens/authenticated/settings/settings.dart';

class HomeScreen extends AuthenticatedStatefulScreen {
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
              unselectedIconTheme: IconThemeData(color: Colors.grey),
              selectedIconTheme: IconThemeData(color: Colors.red),
              showUnselectedLabels: true,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.red,
              items: <BottomNavigationBarItem>[
                /*
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.bell),
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.comment),
                  title: Text(''),
                ),
                 */
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.user),
                  title: Text('profile'),
                ),
                /*
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.artstation),
                  title: Text('dashboard'),
                ),
                 */
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.playCircle),
                  title: Text('classes'),
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
  }
}
