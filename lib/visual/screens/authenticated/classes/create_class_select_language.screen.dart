import 'package:flutter/material.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/classes/create_class.constants.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/visual/screens/authenticated/classes/edit_create/create_or_edit_class.screen.dart';
import 'package:professors/visual/screens/authenticated/settings/profile/settings_add_profile_language_select.screen.dart';
import 'package:professors/store/classes/create_class_state.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/structural/lists/regular_list_tile.dart';

class CreateClassSelectLanguageScreen extends StatelessWidget {
  GeneralConstants generalConstants = GeneralConstants();
  CreateClassScreenConstants screenConstants = CreateClassScreenConstants();
  CreateClassState store = CreateClassState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          slivers: <Widget>[
            CustomAppBar(
              [
                ButtonsBuilder.transparentButton(
                  AppLocalizations.of(context).translate(generalConstants.addLanguageButtonLabel).toUpperCase(),
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            EditProfileAddNewLanguageScreen()));
                  },
                ),
              ],
            ),
            AppHeaderWidget(
              AppLocalizations.of(context).translate(screenConstants.classWillBeGivenInLabel),
              subTitle: AppLocalizations.of(context).translate(screenConstants.selectLanguageLabel),
            ),

            /// Language Options List
            SliverPadding(
              padding: AppPaddings.sliverListPadding(context),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                  return RegularListTile(
                    label: generalStore.existingLanguages[index].designation,
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateOrEditClassScreen(generalStore.existingLanguages[index])),
                      );
                    },
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
