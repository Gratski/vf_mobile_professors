import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/settings/payments/payments_constants.dart';
import 'package:professors/visual/builders/dialog.builder.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/screens/authenticated/settings/payments/add_payment_method_terms.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';
import 'package:professors/globals/global_vars.dart';

class PaymentsMethodsScreen extends StatelessWidget {
  GeneralConstants generalConstants = GeneralConstants();
  PaymentsConstants screenConstants = PaymentsConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[

          CustomAppBar([
            ButtonsBuilder.transparentButton(
                AppLocalizations.of(context).translate(generalConstants.buttonAddLabel), () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentsMethodsTermsScreen()),
              );
            })
          ]),
          AppHeaderWidget(AppLocalizations.of(context)
              .translate(screenConstants.paymentMethodsTopHeader)),

          SliverToBoxAdapter(
            child: Container(
              child: Observer(
                builder: (_) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: paymentsStore.paymentMethods.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onLongPress: () {
                          DialogsBuilder(context).editPaymentMethodDialog(() {
                            restServices.getWalletService().setPaymentMethodAsDefault(context, paymentsStore.paymentMethods[index].id)
                                .then((value) => restServices.getWalletService().getPaymentMethods(context))
                                .catchError((e){
                                ToasterBuilder.buildErrorToaster(context, e.cause);
                            },);
                          }, () {
                            restServices.getWalletService().deletePaymentMethod(context, paymentsStore.paymentMethods[index].id)
                                .then((value) => restServices.getWalletService().getPaymentMethods(context))
                                .catchError((e) {
                                ToasterBuilder.buildErrorToaster(context, e.cause);
                            });
                          });
                        },
                        trailing: Container(
                          padding: EdgeInsets.all(5),
                          child:
                            ( paymentsStore.paymentMethods[index].isDefault ) ? Icon(Icons.check, color: AppColors.regularGreen,) : Text('')
                        ),
                        title: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.ccPaypal, color: AppColors.paypalColor, size: MediaQuery.of(context).size.width * 0.10,),
                              Container(
                                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
                                child: TextsBuilder.regularText(paymentsStore.paymentMethods[index].paymentEmail),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
