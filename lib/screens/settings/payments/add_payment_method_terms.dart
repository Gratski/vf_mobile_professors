import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/payments/payments_constants.dart';
import 'package:professors/screens/settings/payments/add_payment_method.screen.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/header/app_header.widget.dart';
import 'package:professors/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/widgets/text/text.builder.dart';

class PaymentsMethodsTermsScreen extends StatelessWidget {
  PaymentsConstants screenConstants = PaymentsConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[

          CustomAppBar([]),
          AppHeaderWidget(AppLocalizations.of(context)
              .translate(screenConstants.addPaymentMethodTermsTopHeader)),

          SliverToBoxAdapter(
            child: Container(
              padding: AppPaddings.regularPadding(context),
              margin: EdgeInsets.only(top: 20),
              child: TextsBuilder.regularText(
                AppLocalizations.of(context).translate(screenConstants.addPaymentMethodTermsExecutionTimeLabel)
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: AppPaddings.regularPadding(context),
              margin: EdgeInsets.only(top: 20),
              child: TextsBuilder.regularText(
                  AppLocalizations.of(context).translate(screenConstants.addPaymentMethodTermsTaxationLabel)
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              padding: AppPaddings.regularPadding(context),
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => AddPaymentMethodScreen()
                  ),);
                },
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
