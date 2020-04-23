import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/settings_transactions_history_constants.dart';
import 'package:professors/models/transactions/transaction_type.dart';
import 'package:professors/models/transactions/transactions_list_item.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/utils/date_utils.dart';
import 'package:professors/widgets/transactions/transaction_list_item.dart';

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
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        title: Text(
          AppLocalizations.of(context).translate(screenConstants.title),
          style: TextStyle(color: Colors.black),
        ),
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.teal),
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
                      style: TextStyle(color: Colors.teal),
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
                      style: TextStyle(color: Colors.teal),
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
          Observer(
            builder: (_) {
              return Container(
                padding: PaddingsBuilder.regularPadding(context),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: transactionsHistoryStore.transactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildTransaction(
                        transactionsHistoryStore.transactions[index], context);
                  },
                ),
              );
            },
          ),

          /// TOTAL TRANSACTIONS
          Observer(
            builder: (_) {
              return Container(
                padding: PaddingsBuilder.regularPadding(context),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: transactionsHistoryStore.transactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildTransaction(
                        transactionsHistoryStore.transactions[index], context);
                  },
                ),
              );
            },
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
