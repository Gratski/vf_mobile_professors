import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/settings/payments/payments_constants.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/structural/lists/regular_list_tile.dart';

class PaymentsSelectCurrencyScreen extends StatelessWidget {

  final GeneralConstants generalConstants = GeneralConstants();
  final PaymentsConstants screenConstants = PaymentsConstants();

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
                .translate(screenConstants.selectCurrencyTopHeader), subTitle: AppLocalizations.of(context)
                .translate(screenConstants.selectCurrencySubTitle),),
            Observer(
              builder: (_) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    return RegularListTile(
                      label: userWallet.availableCurrencies[index].code,
                      callback: () {
                        userWallet.setCurrency(userWallet.availableCurrencies[index]);
                        Navigator.pop(context);
                      },
                      selected: userWallet.availableCurrencies[index].id == userWallet.currency.id,
                      hideTrailing: userWallet.availableCurrencies[index].id != userWallet.currency.id,
                    );
                  },
                    childCount: userWallet.availableCurrencies.length,
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
