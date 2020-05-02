import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/auth/authentication.constants.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/visual/screens/permitted/auth/abstract_auth.screen.dart';
import 'package:professors/visual/screens/permitted/auth/login.screen.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
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

            // error message
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
              child: Observer(
                builder: (_){
                  if ( authStore.registerHasError ) {
                    return Center(
                      child: TextsBuilder.regularText(authStore.registerErrorMsg),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),

            // Email
            Container(
                padding: AppPaddings.regularPadding(context),
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
                child: TextFormField(
                  style: TextStyle(color: AppColors.fontColor),
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
                  style: TextStyle(color: AppColors.fontColor),
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
                  style: TextStyle(color: AppColors.fontColor),
                  controller: accessCodeController,
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context).translate(screenConstants.registrationAccessCodeLabel)
                  ),
                )
            ),

            // Loader
            Observer(
              builder: (_) {
                if ( authStore.registerIsLoading ) {
                  return DefaultLoaderWidget();
                } else {
                  return Container();
                }
              },
            ),

            // Button
            Observer(
              builder: (_) {

                if ( !authStore.registerIsLoading ) {
                  return Container(
                      padding: AppPaddings.regularPadding(context),
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 10,
                            child: ButtonsBuilder.redFlatButton(AppLocalizations.of(context).translate(screenConstants.registrationButtonLabel), () {

                              authStore.setRegisterIsLoading(true);
                              authStore.setRegisterHasError(false);

                              String email = emailController.text;
                              String password = passwordController.text;
                              String accessCode = accessCodeController.text;
                              restServices.getAuthRestService().registration(context, email, password, accessCode)
                              .then((rsp) {
                                authStore.reset();
                                restServices.getAuthRestService().signIn(context, email, password)
                                .then((value){
                                  emailController.clear();
                                  passwordController.clear();
                                  accessCodeController.clear();
                                  authStore.reset();
                                  Navigator.pushNamedAndRemoveUntil(context, "/home", (r) => false);
                                }).catchError((e) {
                                  authStore.reset();
                                  authStore.setRegisterHasError(true);
                                  authStore.setRegisterErrorMsg(e.cause);
                                });
                              }).catchError((e) {
                                authStore.reset();
                                authStore.setRegisterHasError(true);
                                authStore.setRegisterErrorMsg(e.cause);
                              });

                            }),
                          )
                        ],
                      )
                  );
                } else {
                  return Container();
                }

              },
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

  @override
  onBackButtonTap() {}

}
