import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/payments/payments_constants.dart';
import 'package:professors/visual/screens/authenticated/settings/payments/add_payment_method_terms.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';
import 'package:professors/globals/global_vars.dart';

class PaymentsMethodsScreen extends StatelessWidget {
  PaymentsConstants screenConstants = PaymentsConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[

          CustomAppBar([]),
          AppHeaderWidget(AppLocalizations.of(context)
              .translate(screenConstants.paymentMethodsTopHeader)),

          SliverToBoxAdapter(
            child: Container(
              child: Observer(
                builder: (_) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: userWallet.accounts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {},
                        trailing: Container(
                          padding: EdgeInsets.all(5),
                          child:
                            ( userWallet.accounts[index].isDefault ) ? Icon(Icons.check, color: AppColors.regularGreen,) : Text('')
                        ),
                        title: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.ccPaypal, color: AppColors.paypalColor, size: MediaQuery.of(context).size.width * 0.10,),
                              TextsBuilder.regularText(userWallet.accounts[index].email)
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
