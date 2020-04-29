import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/nationality.constants.dart';
import 'package:professors/store/user/edit_profile_details_state.dart';
import 'package:professors/widgets/structural/header/app_header.widget.dart';
import 'package:professors/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/widgets/structural/lists/regular_list_tile.dart';

class SettingsNationalityScreen extends StatelessWidget {

  final GeneralConstants generalConstants = GeneralConstants();
  final NationalityScreenConstants screenConstants = NationalityScreenConstants();

  EditProfileDetailsState screenStore;
  SettingsNationalityScreen(this.screenStore);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CustomAppBar([],),
          ];
        },
        body: CustomScrollView(
          slivers: <Widget>[
            AppHeaderWidget(AppLocalizations.of(context)
                .translate(screenConstants.topHeader)),
            Observer(
              builder: (_) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    return RegularListTile(
                      label: nationalitiesStore.nationalities[index].designation,
                      callback: () {
                        screenStore.setCountry(
                            nationalitiesStore.nationalities[index].id,
                            nationalitiesStore.nationalities[index].designation);
                        Navigator.pop(context);
                      },
                    );
                  },
                    childCount: nationalitiesStore.nationalities.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
