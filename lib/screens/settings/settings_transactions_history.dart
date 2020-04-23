import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/widgets/structural/appbar_builder.dart';
import 'package:professors/localization/constants/settings_transactions_history_constants.dart'
    as SCREEN_TRANSLATIONS;

class SettingsTransactionsHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder.appBarWithTitle(
        context,
        AppLocalizations.of(context).translate(
            SCREEN_TRANSLATIONS.SettingsTransactionsHistory.TOP_HEADER),
      ),

    );
  }
}
