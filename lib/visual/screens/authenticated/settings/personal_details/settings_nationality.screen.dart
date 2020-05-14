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
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/structural/lists/regular_list_tile.dart';

class SettingsNationalityScreen extends StatefulWidget {

  Function callback;
  int selectedId;
  final nationalitiesStore = NationalitiesState();
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

            /// LOADER
            Observer(
              builder: (_) {
                if ( widget.nationalitiesStore.isLoading ) {
                  return SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
                      child: DefaultLoaderWidget(),
                    ),
                  );
                } else {
                  return SliverPadding(
                    padding: AppPaddings.regularPadding(context).copyWith(left: MediaQuery.of(context).size.width / 40),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                        return RegularListTile(
                          label: widget.nationalitiesStore.nationalities[index].countryName,
                          callback: () {
                            widget.callback(
                                widget.nationalitiesStore.nationalities[index].id,
                                widget.nationalitiesStore.nationalities[index].countryName);
                            Navigator.pop(context);
                          },
                          selected: widget.nationalitiesStore.nationalities[index].id == widget.selectedId,
                          hideTrailing: widget.nationalitiesStore.nationalities[index].id != widget.selectedId,
                        );
                      },
                        childCount: widget.nationalitiesStore.nationalities.length,
                      ),
                    ),
                  );
                }
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
    .then((value) => widget.nationalitiesStore.setNationalities(value))
    .catchError((e) => ToasterBuilder.buildErrorToaster(context, e.cause))
    .whenComplete(() => widget.nationalitiesStore.setIsLoading(false));
  }

  @override
  void dispose() {
    widget.nationalitiesStore.clearNationalities();
    super.dispose();
  }
}
