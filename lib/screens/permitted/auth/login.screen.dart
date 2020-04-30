import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/auth/authentication.constants.dart';
import 'package:professors/screens/permitted/auth/abstract_auth.screen.dart';
import 'package:professors/screens/permitted/auth/password_recovery.screen.dart';
import 'package:professors/styles/colors.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/header/app_header.widget.dart';
import 'package:professors/widgets/text/text.builder.dart';

class LoginScreen extends AbstractAuthScreen {

  AuthenticationConstants screenConstants = AuthenticationConstants();

  // form controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  getHideBackButton() => false;

  @override
  getSlivers(BuildContext context) {
    return <Widget>[

      SliverToBoxAdapter(
        child: Column(
          children: <Widget>[

            // Logo
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height /80),
              child: AspectRatio(
                aspectRatio: 2,
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),

            // Title
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
              padding: AppPaddings.regularPadding(context),
              child: TextsBuilder.jumboBold(AppLocalizations.of(context)
                  .translate(screenConstants.loginTopHeader))
            ),

            // Email
            Container(
                padding: AppPaddings.regularPadding(context),
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context).translate(screenConstants.loginEmailLabel)
                  ),
                )
            ),

            // Password
            Container(
                padding: AppPaddings.regularPadding(context),
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context).translate(screenConstants.loginPasswordLabel)
                  ),
                )
            ),

            // Button
            Container(
                padding: AppPaddings.regularPadding(context),
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 10,
                      child: ButtonsBuilder.redFlatButton(AppLocalizations.of(context).translate(screenConstants.loginButtonLabel), () {
                        // validate fields and perform call to auth API
                      }),
                    )
                  ],
                )
            ),

            // forgot password
            Container(
                padding: AppPaddings.regularPadding(context),
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                child: ButtonsBuilder.transparentButton(AppLocalizations.of(context).translate(screenConstants.loginForgotPasswordText), () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PasswordRecoveryScreen(emailController.text)
                  ),);
                }, color: AppColors.fontColor)
            ),

          ],
        ),
      ),
    ];
  }



}
