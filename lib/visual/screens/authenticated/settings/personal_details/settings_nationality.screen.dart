import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/nationality.constants.dart';
import 'package:professors/store/nationalities/nationalities_state.dart';
import 'package:professors/store/user/edit_profile_details_state.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/structural/lists/regular_list_tile.dart';

class SettingsNationalityScreen extends StatefulWidget {

  NationalitiesState store = NationalitiesState();
  EditProfileDetailsState screenStore;
  SettingsNationalityScreen(this.screenStore);

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
                      label: widget.store.nationalities[index].countryName,
                      callback: () {
                        widget.screenStore.setCountry(
                            widget.store.nationalities[index].id,
                            widget.store.nationalities[index].countryName);
                        Navigator.pop(context);
                      },
                      selected: widget.store.nationalities[index].id == widget.screenStore.countryId,
                      hideTrailing: widget.store.nationalities[index].id != widget.screenStore.countryId,
                    );
                  },
                    childCount: widget.store.nationalities.length,
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
    restServices.getCountriesService().getCountries(context)
        .then((value) => widget.store.setNationalities(value.countries))
        .catchError((e) {
          ToasterBuilder.buildErrorToaster(context, e);
    });

  }

  @override
  void dispose() {
    widget.store.clearNationalities();
    super.dispose();
  }
}
