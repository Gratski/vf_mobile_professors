import 'package:flutter/material.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/profile/settings_edit_profile.constants.dart';
import 'package:professors/visual/screens/authenticated/settings/profile/settings_add_profile_language_select.screen.dart';
import 'package:professors/visual/screens/authenticated/settings/profile/settings_edit_profile_in_language.screen.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/structural/lists/regular_list_tile.dart';

class EditProfileSelectLanguageScreen extends StatelessWidget {
  SettingsEditProfileConstants screenConstants = SettingsEditProfileConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        key: Key('security_definitions_list'),
        shrinkWrap: true,
        slivers: <Widget>[
          CustomAppBar([
            Container(
              margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 20),
              child: ButtonsBuilder.transparentButton(
                AppLocalizations.of(context)
                    .translate(screenConstants.selectLanguageAddNewLanguage).toUpperCase(),
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfileAddNewLanguageScreen()),
                  );
                },
              ),
            ),
          ]),

          

          /// Title
          SliverPadding(
            padding: AppPaddings.regularPadding(context),
            sliver: AppHeaderWidget(
              AppLocalizations.of(context)
                  .translate(screenConstants.selectLanguageTopHeader),
              subTitle: AppLocalizations.of(context)
                  .translate(screenConstants.selectLanguageSubTitle),
            ),
          ),

          /// Language Options
          SliverPadding(
            padding: AppPaddings.regularPadding(context).copyWith(top: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {

                      // profile details set id to null in order to the page to be render
                      // for a new profile details creation
                      profileDetailsStore.setIsLoading(true);
                      profileDetailsStore.setId(generalStore.existingLanguages[index].id);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfileInLanguageScreen(generalStore.existingLanguages[index].id),),
                      );
                    },
                    child: RegularListTile(
                      label: generalStore.existingLanguages[index].designation,
                    ),
                  );
                },
                childCount: generalStore.existingLanguages.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
