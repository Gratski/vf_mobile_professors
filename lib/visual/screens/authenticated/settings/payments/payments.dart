import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/payments/payments_constants.dart';
import 'package:professors/visual/screens/authenticated/settings/payments/payment_methods.dart';
import 'package:professors/visual/screens/authenticated/settings/payments/payments_select_currency.screen.dart';
import 'package:professors/visual/screens/authenticated/settings/payments/settings_transactions_history.dart';
import 'package:professors/visual/screens/authenticated/settings/payments/upload_invoice.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/structural/lists/regular_list_tile.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';
import 'package:professors/globals/global_vars.dart';

class PaymentsScreen extends StatelessWidget {
  PaymentsConstants screenConstants = PaymentsConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar([]),
          AppHeaderWidget(AppLocalizations.of(context)
              .translate(screenConstants.topHeader),),
          
          /// BALANCE
          SliverToBoxAdapter(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                margin: AppPaddings.regularPadding(context).copyWith(top: 20),
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.10),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    TextsBuilder.h4Bold('${AppLocalizations.of(context)
                            .translate(screenConstants.balanceLabel)}', color: AppColors.bgMainColor),
                    Observer(builder: (_) {
                      return Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: TextsBuilder.h4Bold(
                            "${userWallet.balance} ${userWallet.currency.symbol}", color: AppColors.bgMainColor),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
          
          /// OPTIONS LIST
          SliverToBoxAdapter(
            child: Container(
              padding: AppPaddings.sliverListPadding(context),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  /// SEND INVOICE
                  RegularListTile(
                      label: AppLocalizations.of(context)
                          .translate(screenConstants.sendInvoiceLabel),
                      hint: null,
                      callback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SendInvoiceScreen()),
                        );
                      }),

                  /// PAYMENT METHOD
                  RegularListTile(
                      label: AppLocalizations.of(context)
                          .translate(screenConstants.paymentMethodLabel),
                      hint: null,
                      callback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentsMethodsScreen()),
                        );
                      }),

                  /// CURRENCY
                  RegularListTile(
                    label: AppLocalizations.of(context)
                        .translate(screenConstants.currencyLabel),
                    hint: null,
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PaymentsSelectCurrencyScreen()),
                      );
                    },
                  ),

                  /// TRANSACTIONS HISTORY
                  RegularListTile(
                      label: AppLocalizations.of(context)
                          .translate(screenConstants.transactionsHistoryLabel),
                      hint: null,
                      callback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SettingsTransactionsHistoryScreen()),
                        );
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
