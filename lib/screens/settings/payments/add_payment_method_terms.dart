import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/payments/payments_constants.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/appbar_builder.dart';
import 'package:professors/widgets/structural/subtitle_widget.dart';
import 'package:professors/widgets/structural/title_widget.dart';
import 'package:professors/widgets/text/text.builder.dart';

class PaymentsMethodsTermsScreen extends StatelessWidget {
  PaymentsConstants screenConstants = PaymentsConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder.appBarWithTitle(context, null),
      body: CustomScrollView(
        slivers: <Widget>[
          TopTitleWidget(
            AppLocalizations.of(context)
                .translate(screenConstants.addPaymentMethodTermsTopHeader),
            'SettingsAddPaymentMethodTitleKey'
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: PaddingsBuilder.regularPadding(context),
              margin: EdgeInsets.only(top: 20),
              child: TextsBuilder.regularText(
                AppLocalizations.of(context).translate(screenConstants.addPaymentMethodTermsExecutionTimeLabel)
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: PaddingsBuilder.regularPadding(context),
              margin: EdgeInsets.only(top: 20),
              child: TextsBuilder.regularText(
                  AppLocalizations.of(context).translate(screenConstants.addPaymentMethodTermsTaxationLabel)
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              padding: PaddingsBuilder.regularPadding(context),
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
              child: GestureDetector(
                onTap: () {},
                child: TextsBuilder.regularLink(
                    AppLocalizations.of(context).translate(screenConstants.addPaymentMethodTermsProceedLink)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
