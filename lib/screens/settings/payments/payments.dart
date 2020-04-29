import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/payments/payments_constants.dart';
import 'package:professors/screens/settings/payments/payment_methods.dart';
import 'package:professors/screens/settings/payments/payments_select_currency.screen.dart';
import 'package:professors/screens/settings/payments/settings_transactions_history.dart';
import 'package:professors/screens/settings/payments/upload_invoice.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/header/app_header.widget.dart';
import 'package:professors/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/widgets/structural/lists/regular_list_tile.dart';
import 'package:professors/widgets/text/text.builder.dart';
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
              .translate(screenConstants.topHeader)),
          SliverToBoxAdapter(child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.teal),
              ),
              child: Column(
                children: <Widget>[
                  TextsBuilder.h4Bold(AppLocalizations.of(context)
                      .translate(screenConstants.balanceLabel)),
                  Observer(builder: (_) {
                    return Container(
                      margin: EdgeInsets.only(top: 15.0),
                      child: TextsBuilder.h4Bold(
                          "${userWallet.currency.symbol} ${userWallet.balance}"),
                    );
                  }),
                ],
              ),
            );
          })),
          SliverToBoxAdapter(
            child: Container(
              padding: AppPaddings.regularPadding(context),
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
