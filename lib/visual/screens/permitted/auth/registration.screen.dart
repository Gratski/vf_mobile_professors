import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/auth/authentication.constants.dart';
import 'package:professors/visual/screens/permitted/auth/abstract_auth.screen.dart';
import 'package:professors/visual/screens/permitted/auth/login.screen.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';
import 'package:url_launcher/url_launcher.dart';

class RegistrationScreen extends AbstractAuthScreen {

  AuthenticationConstants screenConstants = AuthenticationConstants();

  // form controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController accessCodeController = TextEditingController();

  @override
  getHideBackButton() => true;

  @override
  getSlivers(BuildContext context) {
    return <Widget>[
      SliverToBoxAdapter(
        child: Column(
          children: <Widget>[

            // Logo
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 80),
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
                child: TextsBuilder.jumboBold(AppLocalizations.of(context)
                    .translate(screenConstants.registrationTopHeader))
            ),
            // Sub Title
            GestureDetector(
              onTap: () {
                _launchRegistrationURL();
              },
              child: Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                  child: TextsBuilder.regularText(AppLocalizations.of(context)
                      .translate(screenConstants.registrationSubTitle))
              ),
            ),

            // Email
            Container(
                padding: AppPaddings.regularPadding(context),
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context).translate(screenConstants.registrationEmailLabel)
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
                      hintText: AppLocalizations.of(context).translate(screenConstants.registrationPasswordLabel)
                  ),
                )
            ),

            // Access Code
            Container(
                padding: AppPaddings.regularPadding(context),
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
                child: TextFormField(
                  controller: accessCodeController,
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context).translate(screenConstants.registrationAccessCodeLabel)
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
                      child: ButtonsBuilder.redFlatButton(AppLocalizations.of(context).translate(screenConstants.registrationButtonLabel), () {
                        // validate fields and perform call to auth API
                      }),
                    )
                  ],
                )
            ),

            // Already have an account text
            Container(
                padding: AppPaddings.regularPadding(context),
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                child: ButtonsBuilder.transparentButton(AppLocalizations.of(context).translate(screenConstants.registrationAlreadyHaveAccount), () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => LoginScreen()
                  ),);
                }, color: AppColors.fontColor)
            ),

          ],
        ),
      ),
    ];
  }

  _launchRegistrationURL() async {
    const url = 'https://vfit.app';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      //throw 'Could not launch $url';
    }
  }

}
