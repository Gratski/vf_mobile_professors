import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/auth/authentication.constants.dart';
import 'package:professors/screens/permitted/auth/abstract_auth.screen.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/header/app_header.widget.dart';

class PasswordRecoveryScreen extends AbstractAuthScreen {
  // translation constants
  AuthenticationConstants screenConstants = AuthenticationConstants();

  // form controllers
  TextEditingController emailController = TextEditingController();

  String email;
  PasswordRecoveryScreen(this.email);

  @override
  getHideBackButton() => false;

  @override
  getSlivers(BuildContext context) {
    return <Widget>[
      AppHeaderWidget(
        AppLocalizations.of(context)
            .translate(screenConstants.passwordRecoveryTopHeader),
        subTitle: AppLocalizations.of(context)
            .translate(screenConstants.passwordRecoverySubTitle),
        padding: AppPaddings.regularPadding(context),
      ),
      SliverToBoxAdapter(
        child: Column(
          children: <Widget>[
            // Email
            Container(
                padding: AppPaddings.regularPadding(context),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 20),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)
                          .translate(screenConstants
                          .passwordRecoveryEmailLabel)),
                )),

            // Button
            Container(
              padding: AppPaddings.regularPadding(context),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 40),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 10,
                    child: ButtonsBuilder.redFlatButton(
                      AppLocalizations.of(context).translate(
                          screenConstants
                              .passwordRecoveryButtonLabel),
                          () {
                        // validate fields and perform call to auth API
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
  }

}
