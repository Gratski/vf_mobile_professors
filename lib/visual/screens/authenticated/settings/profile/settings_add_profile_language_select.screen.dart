import 'package:flutter/material.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/settings/profile/settings_edit_profile.constants.dart';
import 'package:professors/visual/screens/authenticated/settings/profile/settings_edit_profile_in_language.screen.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/structural/lists/regular_list_tile.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class EditProfileAddNewLanguageScreen extends StatelessWidget {
  GeneralConstants generalConstants = GeneralConstants();
  SettingsEditProfileConstants screenConstants = SettingsEditProfileConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        key: Key('security_definitions_list'),
        shrinkWrap: true,
        slivers: <Widget>[
          CustomAppBar([]),

          /// Title
          AppHeaderWidget(
            AppLocalizations.of(context)
                .translate(screenConstants.addNewLanguageSelectScreenTopHeader),
            subTitle: AppLocalizations.of(context)
                .translate(screenConstants.addNewLanguageSelectScreenSubTitle),
            isSubTitleSmall: true,
          ),

          /// Language Options
          (generalStore.availableLanguages.length > 0) ? 
          SliverPadding(
            padding: AppPaddings.sliverListPadding(context),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      profileDetailsStore.setIsLoading(true);
                      profileDetailsStore.setId(null);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileInLanguageScreen(
                              generalStore.availableLanguages[index].id),
                        ),
                      );
                    },
                    child: RegularListTile(
                      label: generalStore.availableLanguages[index].designation,
                    ),
                  );
                },
                childCount: generalStore.availableLanguages.length,
              ),
            ),
          ) : SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              padding: AppPaddings.regularPadding(context),
              child: TextsBuilder.regularText(AppLocalizations.of(context).translate(screenConstants.addNewLanguageAlreadyHaveAllLanguages)),
            ),
          ),
        ],
      ),
    );
  }
}
