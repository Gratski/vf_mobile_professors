import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/screens/settings/settings_notifications.dart';
import 'package:professors/screens/settings/settings_personal_details.dart';
import 'package:professors/screens/settings/settings_transactions_history.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/buttons/buttons_builder.dart';
import 'package:professors/widgets/icons/icons_builder.dart';
import 'package:professors/widgets/text/text.builder.dart';
import 'package:professors/localization/constants/settings_constants.dart'
    as TRANSLATIONS;

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: Center(
                child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 5,
                    child: CircleAvatar(
                      maxRadius: MediaQuery.of(context).size.width * 0.15,
                      backgroundImage: NetworkImage(
                          'https://i.ya-webdesign.com/images/circle-avatar-png.png'),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextsBuilder.h3Bold('Raquel Rodrigues'),
                          ButtonsBuilder.whiteFlatButton(
                              AppLocalizations.of(context).translate(
                                  TRANSLATIONS.SettingsConstants.VIEW_PROFILE),
                              () {}),
                          Row(
                            children: IconsBuilder.startListBasedOnScore(4.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: PaddingsBuilder.regularPadding(context),
              child: ListView(

                shrinkWrap: true,
                children: <Widget>[

                  /// PERSONAL DETAILS
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPersonalDetailsScreen()),
                      );
                    },
                    trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black,),
                    title: createListItemText(
                        AppLocalizations.of(context).translate(
                            TRANSLATIONS.SettingsConstants.PERSONAL_DETAILS),
                        AppLocalizations.of(context).translate(
                            TRANSLATIONS.SettingsConstants.PERSONAL_DETAILS_HINT))
                  ),

                  /// NOTIFICATIONS
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsNotificationsScreen()),
                      );
                    },
                      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black,),
                      title: createListItemText(
                          AppLocalizations.of(context).translate(
                              TRANSLATIONS.SettingsConstants.NOTIFICATIONS), null)
                  ),

                  /// PRIVACY DEFINITIONS
                  ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black,),
                      title: createListItemText(
                          AppLocalizations.of(context).translate(
                              TRANSLATIONS.SettingsConstants.PRIVACY_DEFINITIONS), null)
                  ),

                  /// PRIVACY DEFINITIONS
                  ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SettingsTransactionsHistoryScreen()),
                        );
                      },
                      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black,),
                      title: createListItemText(
                          AppLocalizations.of(context).translate(
                              TRANSLATIONS.SettingsConstants.PAYMENTS), null)
                  ),

                  /// CONTACT US
                  ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black,),
                      title: createListItemText(
                          AppLocalizations.of(context).translate(
                              TRANSLATIONS.SettingsConstants.CONTACT_US), AppLocalizations.of(context).translate(
                          TRANSLATIONS.SettingsConstants.CONTACT_US_HINT))
                  ),

                  /// CONTACT US
                  ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black,),
                      title: createListItemText(
                          AppLocalizations.of(context).translate(
                              TRANSLATIONS.SettingsConstants.HOW_IT_WORKS), AppLocalizations.of(context).translate(
                          TRANSLATIONS.SettingsConstants.HOW_IT_WORKS_HINT))
                  ),

                  /// CONTACT US
                  ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black,),
                      title: createListItemText(
                          AppLocalizations.of(context).translate(
                              TRANSLATIONS.SettingsConstants.TERMS), null)
                  ),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget createListItemText(String text, String hint) {
    return RichText(
      text: TextSpan(
          style: TextStyle(color: Colors.black),
          children: <TextSpan>[
            if ( hint != null ) TextsBuilder.hintSpan(hint.toUpperCase() + "\n"),
            TextsBuilder.listItemSpan(text)
          ]),
    );
  }
}
