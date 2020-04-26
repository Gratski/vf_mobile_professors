import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/payments/payments_constants.dart';
import 'package:professors/screens/settings/payments/add_payment_method_terms.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/appbar_builder.dart';
import 'package:professors/widgets/structural/title_widget.dart';
import 'package:professors/widgets/text/text.builder.dart';
import 'package:professors/globals/global_vars.dart';

class PaymentsMethodsScreen extends StatelessWidget {
  PaymentsConstants screenConstants = PaymentsConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder.appBarWithTitle(context, null),
      body: CustomScrollView(
        slivers: <Widget>[
          TopTitleWidget(
            AppLocalizations.of(context)
                .translate(screenConstants.paymentMethodsTopHeader),
            'SettingsPaymentMethodsTitleKey'
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Observer(
                builder: (_) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: paymentMethodsStore.accounts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {},
                        trailing: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                            borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child:
                            ( paymentMethodsStore.accounts[index].isDefault ) ? Text(
                            AppLocalizations.of(context).translate(
                                screenConstants.paymentMethodsDefaultAccountLabel),
                          ) : Text('')
                        ),
                        title: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextsBuilder.h3LightSpan('PayPal\n'),
                              TextsBuilder.regularSpan(paymentMethodsStore.accounts[index].email),
                            ]
                          ),
                        ),
                      );
                    }
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: AppPaddings.regularPadding(context),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentsMethodsTermsScreen()),
                  );
                },
                child: TextsBuilder.regularLink(
                  AppLocalizations.of(context).translate(screenConstants.paymentMethodsAddAccountLink)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
