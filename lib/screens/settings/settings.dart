import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/screens/settings/payments/payments.dart';
import 'package:professors/screens/settings/notifications/settings_notifications.dart';
import 'package:professors/screens/settings/personal_details/settings_personal_details.dart';
import 'package:professors/screens/settings/security/security_definitions.dart';
import 'package:professors/screens/settings/support/support_type.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/icons/icons_builder.dart';
import 'package:professors/widgets/structural/lists/regular_list_tile.dart';
import 'package:professors/widgets/text/text.builder.dart';
import 'package:professors/localization/constants/settings/settings_constants.dart'
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

                  /// SECURITY DEFINITIONS
                  RegularListTile(
                    label: AppLocalizations.of(context).translate(
                        TRANSLATIONS.SettingsConstants.PRIVACY_DEFINITIONS),
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecurityDefinitionsScreen()),
                      );
                    },
                  ),

                  /// PAYMENTS
                  ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PaymentsScreen()),
                        );
                      },
                      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black,),
                      title: createListItemText(
                          AppLocalizations.of(context).translate(
                              TRANSLATIONS.SettingsConstants.PAYMENTS), null)
                  ),

                  /// CONTACT US
                  ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SupportTypeScreen()),
                        );
                      },
                      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black,),
                      title: createListItemText(
                          AppLocalizations.of(context).translate(
                              TRANSLATIONS.SettingsConstants.CONTACT_US), AppLocalizations.of(context).translate(
                          TRANSLATIONS.SettingsConstants.CONTACT_US_HINT))
                  ),

                  /// HOW IT WORKS
                  ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black,),
                      title: createListItemText(
                          AppLocalizations.of(context).translate(
                              TRANSLATIONS.SettingsConstants.HOW_IT_WORKS), AppLocalizations.of(context).translate(
                          TRANSLATIONS.SettingsConstants.HOW_IT_WORKS_HINT))
                  ),

                  /// TERMS
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
