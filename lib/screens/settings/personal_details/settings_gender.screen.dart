import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/nationality.constants.dart';
import 'package:professors/localization/constants/settings/personal_details/settings_personal_details.dart';
import 'package:professors/models/gender.dart';
import 'package:professors/store/user/edit_profile_details_state.dart';
import 'package:professors/utils/gender_utils.dart';
import 'package:professors/widgets/structural/header/app_header.widget.dart';
import 'package:professors/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/widgets/structural/lists/regular_list_tile.dart';

class SettingsGenderScreen extends StatelessWidget {
  final PersonalDetailsConstants screenConstants = PersonalDetailsConstants();

  EditProfileDetailsState screenStore;

  SettingsGenderScreen(this.screenStore);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CustomAppBar(
              [],
            ),
          ];
        },
        body: CustomScrollView(
          slivers: <Widget>[
            AppHeaderWidget(
              AppLocalizations.of(context)
                  .translate(screenConstants.genderScreenTopHeader),
              subTitle: AppLocalizations.of(context)
                  .translate(screenConstants.genderScreenSubTitle),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  /// MALE OPTION
                  RegularListTile(
                    label: GenderUtils().getGenderString(Gender.MALE, context),
                    callback: () {
                      screenStore.setGender(Gender.MALE);
                      Navigator.pop(context);
                    },
                  ),

                  /// FEMALE OPTION
                  RegularListTile(
                    label:
                        GenderUtils().getGenderString(Gender.FEMALE, context),
                    callback: () {
                      screenStore.setGender(Gender.FEMALE);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
