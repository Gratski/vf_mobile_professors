import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/nationality.constants.dart';
import 'package:professors/store/user/edit_profile_details_state.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/structural/lists/regular_list_tile.dart';

class SettingsNationalityScreen extends StatefulWidget {

  Function callback;
  int selectedId;
  SettingsNationalityScreen(this.selectedId, this.callback);

  @override
  _SettingsNationalityScreen createState() => _SettingsNationalityScreen();
}

class _SettingsNationalityScreen extends State<SettingsNationalityScreen> with AfterInitMixin<SettingsNationalityScreen> {
  final GeneralConstants generalConstants = GeneralConstants();
  final NationalityScreenConstants screenConstants = NationalityScreenConstants();

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
                      label: nationalitiesStore.nationalities[index].countryName,
                      callback: () {
                        widget.callback(
                            nationalitiesStore.nationalities[index].id,
                            nationalitiesStore.nationalities[index].countryName);
                        Navigator.pop(context);
                      },
                      selected: nationalitiesStore.nationalities[index].id == widget.selectedId,
                      hideTrailing: nationalitiesStore.nationalities[index].id != widget.selectedId,
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

  @override
  void didInitState() {
    restServices.getCountriesService().getCountries(context);
  }

  @override
  void dispose() {
    nationalitiesStore.clearNationalities();
    super.dispose();
  }
}
