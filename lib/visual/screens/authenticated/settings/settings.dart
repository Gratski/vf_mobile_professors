import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/services/dto/auth/signout/signout.dto.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/screens/authenticated/profile/profile.screen.dart';
import 'package:professors/visual/screens/authenticated/settings/payments/payments.dart';
import 'package:professors/visual/screens/authenticated/settings/personal_details/settings_personal_details.dart';
import 'package:professors/visual/screens/authenticated/settings/profile/settings_edit_profile_select_language.screen.dart';
import 'package:professors/visual/screens/authenticated/settings/security/security_definitions.dart';
import 'package:professors/visual/screens/authenticated/settings/support/support_type.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/widgets/structural/icons/icons_builder.dart';
import 'package:professors/visual/widgets/structural/lists/regular_list_tile.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';
import 'package:professors/localization/constants/settings/settings_constants.dart'
    as TRANSLATIONS;

import 'notifications/settings_notifications.dart';

class SettingsScreen extends StatelessWidget {

  GeneralConstants generalConstants = GeneralConstants();

  BuildContext context;

  Future<File> getImage(ImageSource _source) async {
    return await ImagePicker.pickImage(source: _source);
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: refreshOperation,
        backgroundColor: AppColors.bgMainColor,
        color: AppColors.regularRed,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/classes_bg.png"),
                      fit: BoxFit.cover,
                    ),
                    border: Border(
                      bottom: BorderSide(
                          width: 0.5, color: AppColors.textInputBorder),
                    ),
                  ),
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                          flex: 5,
                          child: Observer(
                            builder: (_) {
                              return GestureDetector(
                                onTap: () async {
                                  File file;
                                  if (Theme.of(context).platform ==
                                      TargetPlatform.android) {
                                    file = await FilePicker.getFile(
                                      type: FileType.custom,
                                      allowedExtensions: ['jpg', 'png', 'jpeg'],
                                    );
                                  } else if (Theme.of(context).platform ==
                                      TargetPlatform.iOS) {
                                    file = await getImage(ImageSource.gallery);
                                  }

                                  // check if the file as been set
                                  if ( file != null ) {
                                    restServices.getUserService().changeProfilePicture(context, file)
                                        .then((value) {
                                    })
                                        .catchError((e) {
                                      ToasterBuilder.buildErrorToaster(context, e.cause);
                                    });
                                  }

                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: MediaQuery.of(context).size.width / 2.7,
                                    width: MediaQuery.of(context).size.width / 2.7,
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.regularRed,
                                        maxRadius: 90,
                                        backgroundImage: userStore.pictureUrl != null ? CachedNetworkImageProvider(
                                            userStore.pictureUrl
                                        ) : AssetImage(
                                            'assets/images/logo.png'
                                        )
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
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

                              /// USERNAME
                              Flexible(
                                flex: 3,
                                child: Observer(
                                  builder: (_) {
                                    return TextsBuilder.h3Bold(
                                      "${userStore.firstName} ${userStore.lastName}",
                                    );
                                  },
                                ),
                              ),

                              /// RATE
                              Flexible(
                                flex: 3,
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: IconsBuilder.startListBasedOnScore(5),
                                  ),
                                ),
                              ),

                              /// VIEW PROFILE
                              Flexible(
                                flex: 3,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProfileScreen(generalStore.existingLanguages.first.id, generalStore.existingLanguages.first.code, userStore.id),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 15),
                                    child: TextsBuilder.regularText(
                                        AppLocalizations.of(context).translate(
                                            TRANSLATIONS
                                                .SettingsConstants.VIEW_PROFILE).toUpperCase()
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// EDIT PERSONAL DETAILS
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04),
                child: RegularListTile(
                  label: AppLocalizations.of(context).translate(
                      TRANSLATIONS.SettingsConstants.PERSONAL_DETAILS),
                  hint: AppLocalizations.of(context).translate(
                      TRANSLATIONS.SettingsConstants.PERSONAL_DETAILS_HINT),
                  callback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SettingsPersonalDetailsScreen()),
                    );
                  },
                ),
              ),
            ),

            /// EDIT LANGUAGE PROFILE
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

            /// PAYMENTS
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
                callback: () async {
                  SignOutResponse rsp = await restServices.getAuthRestService().signOut();
                  Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
                },
                hideTrailing: true,
              ),
            ),
          ],
        ),
      ),
    );

  }

  Future<Null> refreshOperation() async {
    restServices.getUserService().getUserPersonalDetails(context);
  }
}
