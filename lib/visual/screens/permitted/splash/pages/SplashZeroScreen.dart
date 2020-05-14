import 'package:flutter/material.dart';
import 'package:professors/visual/screens/permitted/splash/pages/abstract_splash.screen.dart';
import 'package:professors/visual/styles/colors.dart';

class SplashZeroScreen extends AbstractSplashScreen {

  VoidCallback callback;
  SplashZeroScreen(this.callback);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.bgMainColor,
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
                    image: ExactAssetImage('assets/images/onboarding_0.png', ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
