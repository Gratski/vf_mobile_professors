import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/settings/payments/settings_transactions_history_constants.dart';
import 'package:professors/models/payments/transactions/transaction_type.dart';
import 'package:professors/models/payments/transactions/transactions_list_item.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/utils/date_utils.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';
import 'package:professors/visual/widgets/transactions/transaction_list_item.dart';

class SettingsTransactionsHistoryScreen extends StatefulWidget {
  @override
  _SettingsTransactionsHistoryScreenState createState() =>
      _SettingsTransactionsHistoryScreenState();
}

class _SettingsTransactionsHistoryScreenState
    extends State<SettingsTransactionsHistoryScreen>
    with SingleTickerProviderStateMixin {

  TabController controller;
  GeneralConstants generalConstants = GeneralConstants();
  SettingsTransactionsHistoryConstants screenConstants = SettingsTransactionsHistoryConstants();

  @override
  void initState() {
    super.initState();
    this.controller = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    this.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.fontColor,
          ),
        ),
        centerTitle: false,
        title: Text(
          AppLocalizations.of(context).translate(screenConstants.title),
          style: TextStyle(color: AppColors.fontColor),
        ),
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: AppColors.regularRed),
          ),
          controller: controller,
          isScrollable: true,
          tabs: <Tab>[
            Tab(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                        AppLocalizations.of(context).translate(screenConstants.currentMonth),
                      style: TextStyle(color: AppColors.regularRed),
                    ),
                  );
                },
              ),
            ),
            Tab(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      AppLocalizations.of(context).translate(screenConstants.all),
                      style: TextStyle(color: AppColors.regularRed),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          /// CURRENT MONTH TRANSACTIONS
          Container(
                padding: AppPaddings.regularPadding(context),
                child: Center(
                  child: TextsBuilder.regularText(
                    AppLocalizations.of(context).translate(screenConstants.noTransactionsYet)
                  ),
                )
              ),

          /// TOTAL TRANSACTIONS

              Container(
                  padding: AppPaddings.regularPadding(context),
                  child: Center(
                    child: TextsBuilder.regularText(
                        AppLocalizations.of(context).translate(screenConstants.noTransactionsYet)
                    ),
                  )
              ),

        ],
      ),
    );
  }

  String transactionTypeToString(TransactionType tt) {
    switch (tt) {
      case TransactionType.PAYMENT:
        return "Payment";
        break;
      default:
        return "Other";
    }
  }

  TransactionListItemWidget buildTransaction(
      TransactionListItem tli, BuildContext context) {
    return TransactionListItemWidget(
      title: DateUtils(context).fromDateToString(tli.date),
      transactionType: transactionTypeToString(tli.transactionType),
      amount: tli.amount,
    );
  }
}
