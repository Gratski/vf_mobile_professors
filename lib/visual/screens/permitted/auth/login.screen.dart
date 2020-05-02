import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/auth/authentication.constants.dart';
import 'package:professors/services/dto/auth/signin/login.response.dart';
import 'package:professors/services/exceptions/authentication.exception.dart';
import 'package:professors/visual/screens/authenticated/home.dart';
import 'package:professors/visual/screens/permitted/auth/abstract_auth.screen.dart';
import 'package:professors/visual/screens/permitted/auth/password_recovery.screen.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

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
                  style: TextStyle(color: AppColors.fontColor),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: AppColors.fontColor),
                      hintStyle: TextStyle(color: AppColors.fontColor),
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
                  style: TextStyle(color: AppColors.fontColor),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: AppColors.fontColor),
                      hintStyle: TextStyle(color: AppColors.fontColor),
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
                      child: Observer(
                        builder: (_) {

                          if ( authStore.isLoading ) {
                            return ButtonsBuilder.redFlatButton(AppLocalizations.of(context).translate(screenConstants.loginButtonLabel), () async {
                              // validate fields and perform call to auth API
                              authStore.setIsLoading(true);
                              authStore.setHasError(false);
                              restServices.getAuthRestService().signIn(emailController.text, passwordController.text).then(
                                        (rsp) {
                                          authStore.setIsLoading(false);
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context) => HomeScreen()
                                          ));
                                        }
                                ).catchError(
                                        (e) {
                                          authStore.setIsLoading(false);
                                          authStore.setHasError(true);
                                          authStore.setErrorMsg(e.cause);
                                        });

                              });
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                        },
                      ),
                    )
                  ],
                )
            ),

            // forgot password
            Container(
                padding: AppPaddings.regularPadding(context),
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                child: ButtonsBuilder.transparentButton(AppLocalizations.of(context).translate(screenConstants.loginForgotPasswordText), () {
                  Navigator.push(context, MaterialPageRoute (
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
