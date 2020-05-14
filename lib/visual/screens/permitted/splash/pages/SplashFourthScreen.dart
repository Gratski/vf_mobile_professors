import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/splash.constants.dart';
import 'package:professors/visual/screens/permitted/splash/pages/abstract_splash.screen.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashFourthScreen extends AbstractSplashScreen {
  VoidCallback callback;

  SplashConstants splashConstants = SplashConstants();

  SplashFourthScreen(this.callback);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage(
                      'assets/images/onboarding_4.png',
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 6,
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 40),
                child: Column(
                  children: <Widget>[
                    // header
                    Container(
                      child: TextsBuilder.h3Bold(
                          AppLocalizations.of(context).translate(splashConstants.fourthPageHeader)
                      ),
                    ),

                    // body text
                    Container(
                      padding: AppPaddings.regularPadding(context),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 40),
                      child: TextsBuilder.regularText(
                          AppLocalizations.of(context).translate(splashConstants.fourthPageText)
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 20),
                      child: ButtonsBuilder.redFlatButton(
                        AppLocalizations.of(context).translate(splashConstants.okButtonLabel),
                        () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setBool('showedOnboarding', true);
                          Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
