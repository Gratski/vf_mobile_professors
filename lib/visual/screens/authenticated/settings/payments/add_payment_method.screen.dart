import 'package:flutter/material.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/payments/payments_constants.dart';
import 'package:professors/models/payments/accounts/PaymentAccountListItem.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';

class AddPaymentMethodScreen extends StatelessWidget {
  final PaymentsConstants screenConstants = PaymentsConstants();
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  // input controllers
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.regularPadding(context),
        child: CustomScrollView(
          slivers: <Widget>[
            CustomAppBar(
              [],
            ),
            AppHeaderWidget(
              AppLocalizations.of(context)
                  .translate(screenConstants.addPaymentMethodTopHeader),
              subTitle: AppLocalizations.of(context)
                  .translate(screenConstants.addPaymentMethodSubTitle),
            ),
            // fields to edit
            SliverList(
              key: GlobalKey(),
              delegate: SliverChildListDelegate(
                [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        /// PAYPAL EMAIL
                        Container(
                          child: TextFormField(
                            style: TextStyle(color: AppColors.fontColor),
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context).translate(
                                  screenConstants.addPaymentMethodEmailHint),
                              labelText: AppLocalizations.of(context).translate(
                                  screenConstants.addPaymentMethodEmailLabel),
                            ),
                          ),
                        ),

                        /// BUTTON
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 15),
                          child: ButtonsBuilder.redFlatButton(
                            AppLocalizations.of(context).translate(
                                screenConstants.addPaymentMethodEmailAddButton),
                            () {
                              userWallet.addAccount(PaymentAccountListItem(
                                email: emailController.text,
                                isDefault: false
                              ),);
                              int counter = 0;
                              Navigator.popUntil(
                                context,
                                (route) {
                                  if (counter == 2) {
                                    return true;
                                  } else {
                                    counter++;
                                    return false;
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
