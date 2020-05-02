import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/visual/screens/permitted/splash/pages/abstract_splash.screen.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class SplashSecondScreen extends AbstractSplashScreen {

  VoidCallback callback;
  SplashSecondScreen(this.callback);

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
                    image: ExactAssetImage('assets/images/onboarding_2.png', ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 6,
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
                child: Column(
                  children: <Widget>[

                    // header
                    Container(
                      child: TextsBuilder.h3Bold('EDIT PHOTO EASY'),
                    ),

                    // body text
                    Container(
                      padding: AppPaddings.regularPadding(context),
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
                      child: TextsBuilder.regularText('fdfd fd f dsf sdf ds sd f df ds fd sf ds fds f dsf ds fd sf dsf dsf sdf ds f'),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: ICON_SPACING),
                            child: Icon(FontAwesomeIcons.solidCircle, size: ICON_SIZE, color: AppColors.bgGreyColor,),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: ICON_SPACING),
                            child: Icon(FontAwesomeIcons.solidCircle, size: ICON_SIZE, color: AppColors.regularRed),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: ICON_SPACING),
                            child: Icon(FontAwesomeIcons.solidCircle, size: ICON_SIZE, color: AppColors.bgGreyColor),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: ICON_SPACING),
                            child: Icon(FontAwesomeIcons.solidCircle, size: ICON_SIZE, color: AppColors.bgGreyColor),
                          ),
                        ],
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
