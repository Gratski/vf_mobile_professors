import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/settings/payments/payments_constants.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
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
                if ( userWallet.isUpdating ) {
                  return DefaultLoaderWidget();
                } else {
                  return SliverPadding(
                    padding: AppPaddings.sliverListPadding(context).copyWith(top: 20),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                        return RegularListTile(
                          label: userWallet.availableCurrencies[index].designation,
                          callback: () {
                            _changeCurrency(context, userWallet.availableCurrencies[index].id);
                          },
                          selected: userWallet.availableCurrencies[index].id == userWallet.currency.id,
                          hideTrailing: userWallet.availableCurrencies[index].id != userWallet.currency.id,
                        );
                      },
                        childCount: userWallet.availableCurrencies.length,
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

  _changeCurrency(BuildContext context, int id) async {
    userWallet.setIsUpdating(true);
    restServices.getWalletService().updateCurrency(context, id)
    .then((value){
      restServices.getWalletService().getUserCurrency(context)
          .then((value) => Navigator.pop(context))
          .catchError((e) => ToasterBuilder.buildErrorToaster(context, e.cause))
          .whenComplete(() => userWallet.setIsUpdating(false));
    }).catchError((e) {
      ToasterBuilder.buildErrorToaster(context, e.cause);
      userWallet.setIsUpdating(false);
    });
  }
}
