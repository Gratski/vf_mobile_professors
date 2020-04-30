import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/screens/profile/profile.screen.dart';
import 'package:professors/screens/settings/payments/payments.dart';
import 'package:professors/screens/settings/personal_details/settings_personal_details.dart';
import 'package:professors/screens/settings/profile/settings_edit_profile_select_language.screen.dart';
import 'package:professors/screens/settings/security/security_definitions.dart';
import 'package:professors/screens/settings/support/support_type.dart';
import 'package:professors/styles/colors.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/icons/icons_builder.dart';
import 'package:professors/widgets/structural/lists/regular_list_tile.dart';
import 'package:professors/widgets/text/text.builder.dart';
import 'package:professors/localization/constants/settings/settings_constants.dart'
    as TRANSLATIONS;

import 'notifications/settings_notifications.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: Text(''),
              backgroundColor: AppColors.bgMainColor,
              elevation: 0.0,
              floating: false,
              pinned: false,
              expandedHeight: MediaQuery.of(context).size.height / 4.5,
              flexibleSpace: Center(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/classes_bg.png"),
                      fit: BoxFit.cover,
                    ),
                    border: Border(
                      bottom: BorderSide(width: 1, color: AppColors.textInputBorder),
                    ),
                  ),
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 5,
                        child: CircleAvatar(
                          maxRadius: MediaQuery.of(context).size.width * 0.15,
                          backgroundImage: NetworkImage(
                              'https://img2.goodfon.com/wallpaper/big/9/89/gym-coach-weightlifting-gym.jpg'),
                        ),
                      ),
                      Flexible(
                        flex: 7,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextsBuilder.h3Bold('Raquel Rodrigues',),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: IconsBuilder.startListBasedOnScore(4.0),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfileScreen(true, false),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 15),
                                  child: TextsBuilder.regularText(
                                    AppLocalizations.of(context).translate(
                                        TRANSLATIONS
                                            .SettingsConstants.VIEW_PROFILE),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: CustomScrollView(
          slivers: <Widget>[

            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
                child: RegularListTile(
                  label: AppLocalizations.of(context)
                      .translate(TRANSLATIONS.SettingsConstants.PERSONAL_DETAILS),
                  hint: AppLocalizations.of(context).translate(
                      TRANSLATIONS.SettingsConstants.PERSONAL_DETAILS_HINT),
                  callback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsPersonalDetailsScreen()),
                    );
                  },
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: RegularListTile(
                label: AppLocalizations.of(context)
                    .translate(TRANSLATIONS.SettingsConstants.EDIT_PROFILE),
                hint: AppLocalizations.of(context).translate(
                    TRANSLATIONS.SettingsConstants.EDIT_PROFILE_HINT),
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditProfileSelectLanguageScreen()),
                  );
                },
              ),
            ),

            /// NOTIFICATIONS
            SliverToBoxAdapter(
              child: RegularListTile(
                label: AppLocalizations.of(context)
                    .translate(TRANSLATIONS.SettingsConstants.NOTIFICATIONS),
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SettingsNotificationsScreen()),
                  );
                },
              ),
            ),

            /// SECURITY DEFINITIONS
            SliverToBoxAdapter(
              child: RegularListTile(
                label: AppLocalizations.of(context).translate(
                    TRANSLATIONS.SettingsConstants.PRIVACY_DEFINITIONS),
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecurityDefinitionsScreen()),
                  );
                },
              ),
            ),

            SliverToBoxAdapter(
              child: RegularListTile(
                label: AppLocalizations.of(context)
                    .translate(TRANSLATIONS.SettingsConstants.PAYMENTS),
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentsScreen()),
                  );
                },
              ),
            ),

            /// CONTACT US
            SliverToBoxAdapter(
              child: RegularListTile(
                label: AppLocalizations.of(context)
                    .translate(TRANSLATIONS.SettingsConstants.CONTACT_US),
                hint: AppLocalizations.of(context)
                    .translate(TRANSLATIONS.SettingsConstants.CONTACT_US_HINT),
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SupportTypeScreen()),
                  );
                },
              ),
            ),

            /// HOW IT WORKS
            SliverToBoxAdapter(
              child: RegularListTile(
                label: AppLocalizations.of(context)
                    .translate(TRANSLATIONS.SettingsConstants.HOW_IT_WORKS),
                hint: AppLocalizations.of(context).translate(
                    TRANSLATIONS.SettingsConstants.HOW_IT_WORKS_HINT),
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SupportTypeScreen()),
                  );
                },
              ),
            ),

            /// TERMS
            SliverToBoxAdapter(
              child: RegularListTile(
                label: AppLocalizations.of(context)
                    .translate(TRANSLATIONS.SettingsConstants.TERMS),
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SupportTypeScreen()),
                  );
                },
              ),
            ),

            /// LOGOUT
            SliverToBoxAdapter(
              child: RegularListTile(
                label: AppLocalizations.of(context)
                    .translate(TRANSLATIONS.SettingsConstants.LOGOUT),
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SupportTypeScreen()),
                  );
                },
                hideTrailing: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
