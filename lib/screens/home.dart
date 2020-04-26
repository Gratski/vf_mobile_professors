import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/screens/classes/classes.screen.dart';
import 'package:professors/screens/dashboard.dart';
import 'package:professors/screens/notifications/notifications.dart';
import 'package:professors/screens/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  clearNavigationHistory(BuildContext context) {
    while (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  List<Widget> screens = [
    SettingsScreen(),
    DashboardScreen(),
    ClassesScreen(),
  ];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => widget.screens[navStore.bottomNavigationIndex],
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return BottomNavigationBar(
              iconSize: 22.0,
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
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.artstation),
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.graduationCap),
                  title: Text(''),
                ),
              ],
              currentIndex: navStore.bottomNavigationIndex,
              onTap: (value) {
                widget.clearNavigationHistory(context);
                navStore.bottomNavigationTabIndexChangedAction(value);
              });
        },
      ),
    );
  }
}
