import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/form_validation.constants.dart';
import 'package:professors/localization/constants/settings/payments/payments_constants.dart';
import 'package:professors/store/payments/add_payment_method_state.dart';
import 'package:professors/utils/form.utils.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';

class AddPaymentMethodScreen extends StatelessWidget {
  final formConstants = FormValidationConstants();
  final PaymentsConstants screenConstants = PaymentsConstants();
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  // input controllers
  TextEditingController emailController = TextEditingController();

  // screen state
  AddPaymentMethodState screenStore = AddPaymentMethodState();

  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      body: CustomScrollView(
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
                          padding: AppPaddings.regularPadding(context),
                          child: TextFormField(
                            validator: _emailValidator,
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
                        Observer(
                          builder: (_) {
                            //
                            if ( screenStore.isLoading ) {
                              return DefaultLoaderWidget();

                            } else {
                              return Container(
                                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
                                child: ButtonsBuilder.redFlatButton(
                                  AppLocalizations.of(context).translate(
                                      screenConstants.addPaymentMethodEmailAddButton),
                                      () {
                                    _addAccount(context);
                                  },
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }

  String _emailValidator(String value) {
    if ( value == null || value.trim().isEmpty ) {
      return AppLocalizations.of(context).translate(formConstants.emailIsRequired);
    } else if (!FormUtils().validateEmail(value)) {
      return AppLocalizations.of(context).translate(formConstants.invalidInput);
    }
    return null;
  }

  _addAccount(BuildContext context) {
    if (!_formKey.currentState.validate()) {
      return;
    }

    screenStore.setIsLoading(true);
    restServices.getWalletService().createPaymentMethod(context, emailController.text)
        .then((value){
      restServices.getWalletService().getPaymentMethods(context);
      ToasterBuilder.buildSuccessToaster(context, AppLocalizations.of(context).translate(screenConstants.addPaymentMethodCreated));
      _goBackToPaymentMethodsList(context);
    }).catchError((e){
      ToasterBuilder.buildErrorToaster(context, e.cause);
    }).whenComplete(() => screenStore.setIsLoading(false));
  }

  _goBackToPaymentMethodsList(BuildContext context) {
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
  }
}
