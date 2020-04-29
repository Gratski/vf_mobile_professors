import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/settings/profile/settings_edit_profile.constants.dart';
import 'package:professors/screens/settings/profile/settings_edit_profile_in_language.screen.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/header/app_header.widget.dart';
import 'package:professors/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/widgets/structural/lists/list_tile_model.dart';
import 'package:professors/widgets/structural/lists/regular_list_tile.dart';

class EditProfileAddNewLanguageScreen extends StatelessWidget {

  GeneralConstants generalConstants = GeneralConstants();
  SettingsEditProfileConstants screenConstants = SettingsEditProfileConstants();

  @override
  Widget build(BuildContext context) {
    List<ListTileModel> listItems = [
      ListTileModel('Portuguese', () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditProfileInLanguageScreen('PT', true)),
        );
      }),
    ];

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
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfileInLanguageScreen('PT', true)),
                    );
                  },
                  child: RegularListTile(
                    label: listItems[index].label,
                  ),
                );
              },
              childCount: listItems.length,
            ),
          )
        ],
      ),
    );
  }
}
